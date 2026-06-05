---@param source number
---@param channelCfg table  e.g. Config.DispatchCommandSettings
---@return table|nil  tagData  { jobTag={…}, badge={…} } or nil
local function GetChannelTagData(source, channelCfg)
    if not channelCfg or not channelCfg.allowedJobs then return nil end

    local jobName = GetPlayerJob(source)
    if not jobName then return nil end

    local jobData = channelCfg.allowedJobs[jobName]
    if not jobData then return nil end

    local result = {}

    if jobData.jobTag and jobData.jobTag.enabled then
        result.jobTag = {
            enabled = true,
            label   = jobData.jobTag.label,
            colors  = jobData.jobTag.colors,
        }
    end

    if jobData.badge and jobData.badge.enabled then
        local badgeValue = nil
        if type(jobData.badge.fn) == 'function' then
            local ok, val = pcall(jobData.badge.fn, source)
            if ok then badgeValue = val end
        end
        result.badge = {
            enabled = true,
            value   = badgeValue,
            colors  = jobData.badge.colors,
        }
    end

    return result
end

---Check job access for restricted channels (dispatch, gang).
---@param source number
---@param channelCfg table
---@return boolean
local function HasChannelAccess(source, channelCfg)
    if not channelCfg then return false end

    -- Job restriction
    if channelCfg.restrictTabToAllowedJobs and channelCfg.allowedJobs then
        local jobName = GetPlayerJob(source)
        if jobName and channelCfg.allowedJobs[jobName] then return true end
    end

    -- Gang restriction (QBCore)
    if channelCfg.restrictTabToAllowedGangs and channelCfg.allowedGangs then
        local gangName = GetPlayerGang(source)
        if gangName and channelCfg.allowedGangs[gangName] then return true end
    end

    -- If neither restriction is set, allow everyone
    if not channelCfg.restrictTabToAllowedJobs and not channelCfg.restrictTabToAllowedGangs then
        return true
    end

    return false
end

-- ─── GetRestrictedChannels export helper ──────────────────────────────────────
-- Returns a table of channel IDs the player does NOT have access to.

function GetRestrictedChannels(source)
    local restricted = {}

    local function checkChannel(channelId, channelCfg, jobRestrict, gangRestrict)
        if not channelCfg then return end
        if not jobRestrict and not gangRestrict then return end

        local hasAccess = false
        if jobRestrict and channelCfg.allowedJobs then
            local jobName = GetPlayerJob(source)
            if jobName and channelCfg.allowedJobs[jobName] then hasAccess = true end
        end
        if gangRestrict and channelCfg.allowedGangs then
            local gangName = GetPlayerGang(source)
            if gangName and channelCfg.allowedGangs[gangName] then hasAccess = true end
        end

        if not hasAccess then
            table.insert(restricted, channelId)
        end
    end

    checkChannel('dispatch', Config.DispatchCommandSettings,
        Config.DispatchCommandSettings and Config.DispatchCommandSettings.restrictTabToAllowedJobs, false)

    checkChannel('gang', Config.GangCommandSettings,
        Config.GangCommandSettings and Config.GangCommandSettings.restrictTabToAllowedJobs,
        Config.GangCommandSettings and Config.GangCommandSettings.restrictTabToAllowedGangs)

    return restricted
end

-- ─── /ooc ─────────────────────────────────────────────────────────────────────

if Config.EnableOOCCommand then
    local cfg = Config.OOCCommandSettings
    RegisterCommand(cfg.command, function(source, args, rawCmd)
        local msg = table.concat(args, ' ')
        if not msg or msg:gsub('%s+', '') == '' then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('BLANK_MESSAGE'),
            })
            return
        end

        local name      = GetDisplayName(source)
        local channelId = cfg.channel
        local data      = {
            channel        = channelId,
            showChannelTag = cfg.showChannelTag,
            content        = msg,
            name           = cfg.showPlayerData.name  and name       or nil,
            serverId       = cfg.showPlayerData.id    and source     or nil,
        }

        if cfg.proximity and cfg.proximity.enabled then
            -- Proximity broadcast
            TriggerClientEvent('codem-supreme-chat:client:addProximityMessage', -1, source, data, cfg.proximity.distance)
        else
            TriggerClientEvent('codem-supreme-chat:client:addMessage', -1, data)
        end

        SendDiscordLog(channelId, name, msg)
    end, false)
end

-- ─── /me ──────────────────────────────────────────────────────────────────────

if Config.EnableMECommand then
    local cfg = Config.MECommandSettings
    RegisterCommand(cfg.command, function(source, args, rawCmd)
        local msg = table.concat(args, ' ')
        if not msg or msg:gsub('%s+', '') == '' then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('BLANK_MESSAGE'),
            })
            return
        end

        local name = GetDisplayName(source)
        if Config.MaskAnonymity and Config.MaskAnonymity.enabled then
            local ms = playerMaskState[source]
            if ms and IsWearingMaskFromState(ms) then
                name = Config.MaskAnonymity.anonymousName or 'ANONYMOUS'
            end
        end

        local data = {
            channel        = cfg.channel,
            showChannelTag = cfg.showChannelTag,
            content        = msg,
            name           = cfg.showPlayerData.name and name   or nil,
            serverId       = cfg.showPlayerData.id   and source or nil,
        }

        if cfg.proximity and cfg.proximity.enabled then
            TriggerClientEvent('codem-supreme-chat:client:addProximityMessage', -1, source, data, cfg.proximity.distance)
        else
            TriggerClientEvent('codem-supreme-chat:client:addMessage', -1, data)
        end

        SendDiscordLog(cfg.channel, name, msg)
    end, false)
end

-- ─── /do ──────────────────────────────────────────────────────────────────────

if Config.EnableDOCommand then
    local cfg = Config.DOCommandSettings
    RegisterCommand(cfg.command, function(source, args, rawCmd)
        local msg = table.concat(args, ' ')
        if not msg or msg:gsub('%s+', '') == '' then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('BLANK_MESSAGE'),
            })
            return
        end

        local name = GetDisplayName(source)
        if Config.MaskAnonymity and Config.MaskAnonymity.enabled then
            local ms = playerMaskState[source]
            if ms and IsWearingMaskFromState(ms) then
                name = Config.MaskAnonymity.anonymousName or 'ANONYMOUS'
            end
        end

        local data = {
            channel        = cfg.channel,
            showChannelTag = cfg.showChannelTag,
            content        = msg,
            name           = cfg.showPlayerData.name and name   or nil,
            serverId       = cfg.showPlayerData.id   and source or nil,
        }

        if cfg.proximity and cfg.proximity.enabled then
            TriggerClientEvent('codem-supreme-chat:client:addProximityMessage', -1, source, data, cfg.proximity.distance)
        else
            TriggerClientEvent('codem-supreme-chat:client:addMessage', -1, data)
        end

        SendDiscordLog(cfg.channel, name, msg)
    end, false)
end

-- ─── /pm ──────────────────────────────────────────────────────────────────────

if Config.EnablePMCommand then
    local cfg = Config.PMCommandSettings
    RegisterCommand(cfg.command, function(source, args, rawCmd)
        local targetId = tonumber(args[1])
        table.remove(args, 1)
        local msg = table.concat(args, ' ')

        if not targetId then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('PLAYER_NOT_FOUND'),
            })
            return
        end

        if targetId == source then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('CANNOT_PM_SELF'),
            })
            return
        end

        if not msg or msg:gsub('%s+', '') == '' then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('BLANK_MESSAGE'),
            })
            return
        end

        if not GetPlayerName(targetId) then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('PLAYER_NOT_FOUND'),
            })
            return
        end

        local senderName   = GetDisplayName(source)
        local receiverName = GetDisplayName(targetId)

        local dataForSender = {
            channel        = cfg.channel,
            showChannelTag = cfg.showChannelTag,
            content        = '[PM → ' .. receiverName .. '] ' .. msg,
            name           = cfg.showPlayerData.name and senderName or nil,
            serverId       = cfg.showPlayerData.id   and source     or nil,
            isPM           = true,
        }

        local dataForReceiver = {
            channel        = cfg.channel,
            showChannelTag = cfg.showChannelTag,
            content        = '[PM ← ' .. senderName .. '] ' .. msg,
            name           = cfg.showPlayerData.name and senderName or nil,
            serverId       = cfg.showPlayerData.id   and source     or nil,
            isPM           = true,
        }

        TriggerClientEvent('codem-supreme-chat:client:addMessage', source,   dataForSender)
        TriggerClientEvent('codem-supreme-chat:client:addMessage', targetId, dataForReceiver)
    end, false)
end

-- ─── /server ──────────────────────────────────────────────────────────────────

if Config.EnableServerCommand then
    local cfg = Config.ServerCommandSettings
    RegisterCommand(cfg.command, function(source, args, rawCmd)
        -- Permission check
        if cfg.requiredPermissions and not HasRequiredPermission(source, cfg.requiredPermissions) then
            if not HasAdminPermission(source) then
                TriggerClientEvent('chat:addMessage', source, {
                    channel = 'server', showChannelTag = true,
                    content = GetLocale('NO_PERMISSION'),
                })
                return
            end
        end

        local msg = table.concat(args, ' ')
        if not msg or msg:gsub('%s+', '') == '' then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('BLANK_MESSAGE'),
            })
            return
        end

        local name = GetDisplayName(source)
        local data = {
            channel        = cfg.channel,
            showChannelTag = cfg.showChannelTag,
            content        = msg,
            name           = cfg.showPlayerData.name and name   or nil,
            serverId       = cfg.showPlayerData.id   and source or nil,
        }

        TriggerClientEvent('codem-supreme-chat:client:addMessage', -1, data)
        SendDiscordLog(cfg.channel, name, msg)
    end, false)
end

-- ─── /dp  (dispatch) ──────────────────────────────────────────────────────────

if Config.EnableDispatchCommand then
    local cfg = Config.DispatchCommandSettings
    RegisterCommand(cfg.command, function(source, args, rawCmd)
        if not HasChannelAccess(source, cfg) then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('NO_PERMISSION'),
            })
            return
        end

        local msg = table.concat(args, ' ')
        if not msg or msg:gsub('%s+', '') == '' then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('BLANK_MESSAGE'),
            })
            return
        end

        local name    = GetDisplayName(source)
        local tagData = GetChannelTagData(source, cfg)

        local data = {
            channel        = cfg.channel,
            showChannelTag = cfg.showChannelTag,
            content        = msg,
            name           = cfg.showPlayerData.name and name   or nil,
            serverId       = cfg.showPlayerData.id   and source or nil,
            jobTag         = tagData and tagData.jobTag or nil,
            badge          = tagData and tagData.badge  or nil,
        }

        TriggerClientEvent('codem-supreme-chat:client:addMessage', -1, data)
        SendDiscordLog(cfg.channel, name, msg)
    end, false)
end

-- ─── /g  (gang) ───────────────────────────────────────────────────────────────

if Config.EnableGangCommand then
    local cfg = Config.GangCommandSettings
    RegisterCommand(cfg.command, function(source, args, rawCmd)
        if not HasChannelAccess(source, cfg) then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('NO_PERMISSION'),
            })
            return
        end

        local msg = table.concat(args, ' ')
        if not msg or msg:gsub('%s+', '') == '' then
            TriggerClientEvent('chat:addMessage', source, {
                channel = 'server', showChannelTag = true,
                content = GetLocale('BLANK_MESSAGE'),
            })
            return
        end

        local name    = GetDisplayName(source)
        local gangName = GetPlayerGang(source)
        local tagData = GetChannelTagData(source, cfg)

        local data = {
            channel        = cfg.channel,
            showChannelTag = cfg.showChannelTag,
            content        = msg,
            name           = cfg.showPlayerData.name and name   or nil,
            serverId       = cfg.showPlayerData.id   and source or nil,
            jobTag         = tagData and tagData.jobTag or nil,
            badge          = tagData and tagData.badge  or nil,
        }

        TriggerClientEvent('codem-supreme-chat:client:addMessage', -1, data)
        SendDiscordLog(cfg.channel, name, msg)
    end, false)
end

-- ─── /chatsettings ────────────────────────────────────────────────────────────

RegisterCommand(Config.OpenSettingsCommand or 'chatsettings', function(source, args, rawCmd)
    TriggerClientEvent('codem-supreme-chat:client:OpenSettings', source)
end, false)

-- ─── Admin: clear chat ────────────────────────────────────────────────────────

RegisterCommand('clearchat', function(source, args, rawCmd)
    if source ~= 0 and not HasAdminPermission(source) then
        TriggerClientEvent('chat:addMessage', source, {
            channel = 'server', showChannelTag = true,
            content = GetLocale('NO_PERMISSION'),
        })
        return
    end

    TriggerClientEvent('codem-supreme-chat:client:clearChat', -1)
    TriggerClientEvent('chat:addMessage', -1, {
        channel = 'server', showChannelTag = false,
        content = GetLocale('CHAT_CLEARED'),
    })
end, true)  -- restricted = true (requires ACE permission 'command.clearchat')

-- ─── Version checker stub ─────────────────────────────────────────────────────
-- versionchecker.lua is listed in fxmanifest but the actual check logic
-- is in server/versionchecker.lua (created separately). This block is a
-- safety no-op in case that file is absent.
