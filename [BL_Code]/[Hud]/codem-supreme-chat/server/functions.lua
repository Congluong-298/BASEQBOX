---@return string  Translated string for the server language
function GetLocale(key, ...)
    local lang  = Config.Language or 'en'
    local block = Config.Locales and Config.Locales[lang] and Config.Locales[lang]['NOTIFICATIONS']
    if not block then return key end
    local str = block[key]
    if not str then return key end
    if select('#', ...) > 0 then
        return string.format(str, ...)
    end
    return str
end

-- ─── Permission helpers ───────────────────────────────────────────────────────

---Check whether a source has admin rights based on Config.Admins and the
---active framework.
---@param source number
---@return boolean
function HasAdminPermission(source)
    if not Config.Admins or #Config.Admins == 0 then return false end

    local framework = Config.Framework

    -- Standalone: match against license identifiers
    if framework == 'standalone' then
        local identifiers = GetPlayerIdentifiers(source)
        for _, id in ipairs(identifiers) do
            for _, admin in ipairs(Config.Admins) do
                if id == admin then return true end
            end
        end
        return false
    end

    -- Framework mode: match against permission strings (e.g. 'admin', 'god')
    for _, perm in ipairs(Config.Admins) do
        if IsPlayerAceAllowed(source, perm) then return true end
    end
    return false
end

---Check whether a source has a specific required permission string.
---Used by Config.ServerCommandSettings.requiredPermissions etc.
---@param source  number
---@param perms   table   list of permission strings
---@return boolean
function HasRequiredPermission(source, perms)
    if not perms or #perms == 0 then return true end
    local framework = Config.Framework

    if framework == 'standalone' then
        -- In standalone mode treat permission strings as ACE nodes
        for _, perm in ipairs(perms) do
            if IsPlayerAceAllowed(source, perm) then return true end
        end
        return false
    end

    -- Framework mode
    for _, perm in ipairs(perms) do
        if IsPlayerAceAllowed(source, perm) then return true end
    end
    return false
end

-- ─── Player data helpers ──────────────────────────────────────────────────────

---Returns the display name for a player according to Config.PlayerName.
---@param source number
---@return string
function GetDisplayName(source)
    if Config.PlayerName == 'fivem' then
        return GetPlayerName(source) or ('Player ' .. source)
    end
    -- 'game' – use the in-game character name when a framework is present
    local framework = Config.Framework
    if framework == 'newesx' or framework == 'oldesx' then
        local xPlayer = Core and Core.GetPlayerFromId and Core.GetPlayerFromId(source)
        if xPlayer then
            local fn = xPlayer.get and xPlayer:get('firstName') or xPlayer.firstName
            local ln = xPlayer.get and xPlayer:get('lastName')  or xPlayer.lastName
            if fn and ln then return fn .. ' ' .. ln end
            if fn then return fn end
        end
    elseif framework == 'newqb' or framework == 'oldqb' or framework == 'qbox' then
        local Player = Core and Core.Functions and Core.Functions.GetPlayer(source)
        if Player then
            local ci = Player.PlayerData and Player.PlayerData.charinfo
            if ci and ci.firstname and ci.lastname then
                return ci.firstname .. ' ' .. ci.lastname
            end
        end
    end
    return GetPlayerName(source) or ('Player ' .. source)
end

---Returns the active job name for a player (or nil in standalone).
---@param source number
---@return string|nil, string|nil  jobName, jobGrade
function GetPlayerJob(source)
    local framework = Config.Framework
    if framework == 'newesx' or framework == 'oldesx' then
        local xPlayer = Core and Core.GetPlayerFromId and Core.GetPlayerFromId(source)
        if xPlayer then
            local job = xPlayer.job or (xPlayer.get and xPlayer:get('job'))
            if job then return job.name, tostring(job.grade or 0) end
        end
    elseif framework == 'newqb' or framework == 'oldqb' or framework == 'qbox' then
        local Player = Core and Core.Functions and Core.Functions.GetPlayer(source)
        if Player then
            local job = Player.PlayerData and Player.PlayerData.job
            if job then return job.name, tostring(job.grade and job.grade.level or 0) end
        end
    elseif framework == 'standalone' then
        -- Standalone: look up Config.StandaloneTags
        if Config.StandaloneTags then
            local identifiers = GetPlayerIdentifiers(source)
            for jobName, data in pairs(Config.StandaloneTags) do
                if data.members then
                    for _, id in ipairs(identifiers) do
                        for _, memberId in ipairs(data.members) do
                            if id == memberId then return jobName, '0' end
                        end
                    end
                end
            end
        end
    end
    return nil, nil
end

---Returns the active gang name for a player (QBCore only).
---@param source number
---@return string|nil
function GetPlayerGang(source)
    local framework = Config.Framework
    if framework == 'newqb' or framework == 'oldqb' or framework == 'qbox' then
        local Player = Core and Core.Functions and Core.Functions.GetPlayer(source)
        if Player then
            local gang = Player.PlayerData and Player.PlayerData.gang
            if gang and gang.name and gang.name ~= 'none' then
                return gang.name
            end
        end
    end
    return nil
end

-- ─── Per-player settings storage ─────────────────────────────────────────────

playerSettings = playerSettings or {}   -- [source] = settingsTable
playerMaskState = playerMaskState or {} -- [source] = { wearing, … }

---Build the initial settings table for a player, merging Config.Settings
---with any previously saved values.
---@param source number
---@return table
function BuildPlayerSettings(source)
    local saved = playerSettings[source]
    local base  = {}

    -- Deep-copy Config.Settings as the default
    for k, v in pairs(Config.Settings) do
        if type(v) == 'table' then
            local t = {}
            for k2, v2 in pairs(v) do t[k2] = v2 end
            base[k] = t
        else
            base[k] = v
        end
    end

    if saved then
        for k, v in pairs(saved) do
            if type(v) == 'table' and type(base[k]) == 'table' then
                for k2, v2 in pairs(v) do base[k][k2] = v2 end
            else
                base[k] = v
            end
        end
    end

    return base
end

-- ─── Discord webhook ──────────────────────────────────────────────────────────

---Send a message embed to a Discord webhook (fire-and-forget).
---@param channel string
---@param senderName string
---@param message string
function SendDiscordLog(channel, senderName, message)
    if not Config.Discord or not Config.Discord.enabled then return end
    if not Config.Discord.logChannels or not Config.Discord.logChannels[channel] then return end
    if not Config.Discord.webhookURL or Config.Discord.webhookURL == '' then return end

    local color  = (Config.Discord.embedColors and Config.Discord.embedColors[channel]) or 16777215
    local embed  = {
        {
            title       = '[' .. channel:upper() .. '] ' .. senderName,
            description = message,
            color       = color,
            footer      = { text = Config.Discord.serverName or 'Supreme Chat' },
            timestamp   = os.date('!%Y-%m-%dT%H:%M:%SZ'),
        }
    }

    PerformHttpRequest(Config.Discord.webhookURL, function() end, 'POST',
        json.encode({ username = Config.Discord.botName or 'Supreme Chat', embeds = embed }),
        { ['Content-Type'] = 'application/json' }
    )
end
