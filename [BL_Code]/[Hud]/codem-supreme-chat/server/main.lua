typingPlayers = typingPlayers or {}
registeredSuggestions = registeredSuggestions or {}

function SendCommandSuggestions(source)
    for _, suggestion in pairs(registeredSuggestions) do
        TriggerClientEvent('chat:addSuggestion', source, suggestion.name, suggestion.help or '', suggestion.params or {})
    end
end

AddEventHandler('chat:addSuggestion', function(name, help, params)
    if not name then return end
    registeredSuggestions[name] = { name = name, help = help or '', params = params or {} }
    TriggerClientEvent('chat:addSuggestion', -1, name, help or '', params or {})
end)

AddEventHandler('chat:removeSuggestion', function(name)
    if not name then return end
    registeredSuggestions[name] = nil
    TriggerClientEvent('chat:removeSuggestion', -1, name)
end)

RegisterNetEvent('codem-supreme-chat:server:GetPlayerData')
AddEventHandler('codem-supreme-chat:server:GetPlayerData', function()
    local source = source
    local settings = BuildPlayerSettings(source)
    local name     = GetDisplayName(source)
    local serverId = source

    local jobName, jobGrade = GetPlayerJob(source)
    local gangName          = GetPlayerGang(source)
    local restrictedChannels = GetRestrictedChannels(source)

    TriggerClientEvent('codem-supreme-chat:client:GetPlayerData', source, {
        settings           = settings,
        name               = name,
        serverId           = serverId,
        job                = jobName,
        jobGrade           = jobGrade,
        gang               = gangName,
        restrictedChannels = restrictedChannels,
        channels           = Config.Channels,
        locales            = Config.Locales and Config.Locales[Config.Language or 'en'],
    })

    SendCommandSuggestions(source)
end)

RegisterNetEvent('codem-supreme-chat:server:SaveSettings')
AddEventHandler('codem-supreme-chat:server:SaveSettings', function(newSettings)
    local source = source
    if type(newSettings) ~= 'table' then return end
    playerSettings[source] = playerSettings[source] or {}
    for k, v in pairs(newSettings) do
        playerSettings[source][k] = v
    end

    if Config.SQL and Config.SQL ~= '' then
        local identifier = GetPlayerIdentifiers(source)[1]
        if identifier then
            local encoded = json.encode(playerSettings[source])
            if Config.SQL == 'oxmysql' then
                pcall(function()
                    exports.oxmysql:execute(
                        "INSERT INTO supreme_chat_settings (identifier, settings) VALUES (?, ?) " ..
                        "ON DUPLICATE KEY UPDATE settings = VALUES(settings)",
                        { identifier, encoded }
                    )
                end)
            elseif Config.SQL == 'mysql-async' then
                pcall(function()
                    MySQL.Async.execute(
                        "INSERT INTO supreme_chat_settings (identifier, settings) VALUES (@id, @s) " ..
                        "ON DUPLICATE KEY UPDATE settings = @s",
                        { ['@id'] = identifier, ['@s'] = encoded }
                    )
                end)
            end
        end
    end
end)

RegisterNetEvent('codem-supreme-chat:server:TypingIndicator')
AddEventHandler('codem-supreme-chat:server:TypingIndicator', function(isTyping)
    local source = source
    typingPlayers[source] = isTyping or false
    TriggerClientEvent('codem-supreme-chat:client:TypingIndicator', -1, source, isTyping)
end)

RegisterNetEvent('codem-supreme-chat:server:UpdateMaskState')
AddEventHandler('codem-supreme-chat:server:UpdateMaskState', function(...)
    local source = source
    playerMaskState[source] = { ... }
end)

RegisterNetEvent('codem-supreme-chat:server:addMessage')
AddEventHandler('codem-supreme-chat:server:addMessage', function(data)
    local source = source
    if type(data) ~= 'table' then return end

    if not data.content or tostring(data.content):gsub('%s+', '') == '' then
        TriggerClientEvent('chat:addMessage', source, {
            channel        = 'server',
            showChannelTag = true,
            content        = GetLocale('BLANK_MESSAGE'),
        })
        return
    end

    if Config.MaskAnonymity and Config.MaskAnonymity.enabled then
        local maskState = playerMaskState[source]
        if maskState and IsWearingMaskFromState(maskState) then
            data.name = Config.MaskAnonymity.anonymousName or 'ANONYMOUS'
        end
    end

    TriggerClientEvent('codem-supreme-chat:client:addMessage', -1, data)
    SendDiscordLog(data.channel or 'all', data.name or GetDisplayName(source), data.content)
end)

RegisterNetEvent('codem-supreme-chat:server:OpenSettings')
AddEventHandler('codem-supreme-chat:server:OpenSettings', function()
    local source = source
    TriggerClientEvent('codem-supreme-chat:client:OpenSettings', source)
end)

AddEventHandler('playerJoining', function()
    if not Config.EnablePlayerJoinedMessage then return end
    local source = source
    local name   = GetPlayerName(source) or tostring(source)
    TriggerClientEvent('chat:addMessage', -1, {
        channel        = 'server',
        showChannelTag = false,
        content        = GetLocale('PLAYER_JOINED', name),
    })
end)

AddEventHandler('playerDropped', function(reason)
    if not Config.EnablePlayerDroppedMessage then return end
    local source = source
    local name   = GetPlayerName(source) or tostring(source)

    typingPlayers[source]   = nil
    playerMaskState[source] = nil

    TriggerClientEvent('chat:addMessage', -1, {
        channel        = 'server',
        showChannelTag = false,
        content        = GetLocale('PLAYER_DROPPED', name),
    })
end)

if Config.AutoMessages and Config.AutoMessages.enabled then
    local msgIndex = 1
    CreateThread(function()
        local period = (Config.AutoMessages.period or 10) * 60 * 1000
        while true do
            Wait(period)
            local messages = Config.AutoMessages.messages
            if messages and #messages > 0 then
                local msg = messages[msgIndex]
                if msg then
                    TriggerClientEvent('chat:addMessage', -1, {
                        channel        = 'server',
                        showChannelTag = false,
                        content        = msg,
                    })
                end
                msgIndex = (msgIndex % #messages) + 1
            end
        end
    end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if Config.Debug then
    end

    local function reg(name, help, params)
        registeredSuggestions['/' .. name] = { name = '/' .. name, help = help, params = params or {} }
    end

    if Config.EnableOOCCommand and Config.OOCCommandSettings then
        reg(Config.OOCCommandSettings.command, 'Send an OOC message', {{ name = 'message', help = 'Your message' }})
    end
    if Config.EnableMECommand and Config.MECommandSettings then
        reg(Config.MECommandSettings.command, 'Perform an action', {{ name = 'action', help = 'Your action' }})
    end
    if Config.EnableDOCommand and Config.DOCommandSettings then
        reg(Config.DOCommandSettings.command, 'Describe something', {{ name = 'action', help = 'Your description' }})
    end
    if Config.EnablePMCommand and Config.PMCommandSettings then
        reg(Config.PMCommandSettings.command, 'Send a private message',
            {{ name = 'id', help = 'Player ID' }, { name = 'message', help = 'Your message' }})
    end
    if Config.EnableServerCommand and Config.ServerCommandSettings then
        reg(Config.ServerCommandSettings.command, 'Send a server-wide message (admin)',
            {{ name = 'message', help = 'Your message' }})
    end
    if Config.EnableDispatchCommand and Config.DispatchCommandSettings then
        reg(Config.DispatchCommandSettings.command, 'Send a dispatch message',
            {{ name = 'message', help = 'Your message' }})
    end
    if Config.EnableGangCommand and Config.GangCommandSettings then
        reg(Config.GangCommandSettings.command, 'Send a gang message',
            {{ name = 'message', help = 'Your message' }})
    end
    reg(Config.OpenSettingsCommand or 'chatsettings', 'Open chat settings')
    reg('clearchat', 'Clear the chat (admin)')
end)

function IsWearingMaskFromState(maskState)
    if not maskState then return false end
    if maskState[1] == true or maskState[1] == 1 then
        local drawableId = maskState[3]
        if Config.MaskAnonymity.nonMaskProps and drawableId then
            if Config.MaskAnonymity.nonMaskProps[drawableId] then
                return false
            end
        end
        return true
    end
    return false
end

exports('GetSettings', function(source)
    return BuildPlayerSettings(source)
end)

exports('UpdateSettings', function(source, newSettings)
    if type(newSettings) ~= 'table' then return false end
    playerSettings[source] = playerSettings[source] or {}
    for k, v in pairs(newSettings) do
        playerSettings[source][k] = v
    end
    TriggerClientEvent('codem-supreme-chat:client:GetPlayerData', source, {
        settings = BuildPlayerSettings(source),
        name     = GetDisplayName(source),
        serverId = source,
    })
    return true
end)

exports('GetRestrictedChannels', function(source)
    return GetRestrictedChannels(source)
end)