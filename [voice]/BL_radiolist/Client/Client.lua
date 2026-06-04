local QBCore = exports['qb-core']:GetCoreObject()
local PlayerServerID = GetPlayerServerId(PlayerId())
local PlayersInRadio = {}
local firstTimeEventGetsTriggered = true
local RadioChannelsName = {}
local isDead = false

RegisterNetEvent('JLRP-RadioList:Client:SyncRadioChannelPlayers')
AddEventHandler('JLRP-RadioList:Client:SyncRadioChannelPlayers', function(src, RadioChannelToJoin, PlayersInRadioChannel)
    if firstTimeEventGetsTriggered then
        for i, v in pairs(Config.RadioChannelsWithName) do
            local frequency = tonumber(i)
            local minFrequency, maxFrequency = frequency, frequency + 1
            for index = minFrequency, maxFrequency + 0.0, 0.01 do
                RadioChannelsName[tostring(index)] = tostring(v)
            end
            if frequency ~= 0 then
                RadioChannelsName[tostring(frequency)] = tostring(v)
            end
        end
        firstTimeEventGetsTriggered = false
    end

    PlayersInRadio = PlayersInRadioChannel

    if src == PlayerServerID then
        if RadioChannelToJoin > 0 then
            local radioChannelToJoin = tostring(RadioChannelToJoin)
            local channelDisplayName = RadioChannelsName[radioChannelToJoin] or radioChannelToJoin
            
            HideTheRadioList()
            
            for index, player in pairs(PlayersInRadio) do
                SendNUIMessage({ 
                    radioId = player.Source, 
                    radioName = player.Name, 
                    channel = channelDisplayName,
                    self = (player.Source == src)
                })
            end
            ResetTheRadioList()
        else
            ResetTheRadioList()
            HideTheRadioList()
        end
    elseif src ~= PlayerServerID then
        if RadioChannelToJoin > 0 then
            local radioChannelToJoin = tostring(RadioChannelToJoin)
            local channelDisplayName = RadioChannelsName[radioChannelToJoin] or radioChannelToJoin
            if PlayersInRadio[src] then
                SendNUIMessage({ 
                    radioId = src, 
                    radioName = PlayersInRadio[src].Name, 
                    channel = channelDisplayName 
                })
            end
        else
            SendNUIMessage({ radioId = src })
        end
    end
end)

RegisterNetEvent('pma-voice:setTalkingOnRadio')
AddEventHandler('pma-voice:setTalkingOnRadio', function(src, talkingState)
    SendNUIMessage({ radioId = src, radioTalking = talkingState })
end)

RegisterNetEvent('pma-voice:radioActive')
AddEventHandler('pma-voice:radioActive', function(talkingState)
    SendNUIMessage({ radioId = PlayerServerID, radioTalking = talkingState })
end)

RegisterNetEvent('JLRP-RadioList:Client:DisconnectPlayerCurrentChannel')
AddEventHandler('JLRP-RadioList:Client:DisconnectPlayerCurrentChannel', function()
    ResetTheRadioList()
    HideTheRadioList()
end)

function ResetTheRadioList()
    PlayersInRadio = {}
end

function HideTheRadioList()
    SendNUIMessage({ clearRadioList = true })
end

if Config.LetPlayersChangeVisibilityOfRadioList then
    RegisterCommand(Config.RadioListVisibilityCommand, function()
        SendNUIMessage({ changeVisibility = true, toggle = true }) -- Giả định NUI có hỗ trợ toggle hoặc bạn có thể quản lý biến visibility tại đây
    end)
    TriggerEvent("chat:addSuggestion", "/" .. Config.RadioListVisibilityCommand, "Ẩn/Hiện danh sách đàm")
end

CreateThread(function()
    while true do
        local sleep = 500
        local PlayerData = QBCore.Functions.GetPlayerData()

        if PlayerData and PlayerData.metadata then
            local isCurrentlyDead = PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"]

            if isCurrentlyDead then
                if not isDead then
                    isDead = true
                    SendNUIMessage({ changeVisibility = true, visible = false })
                end
                sleep = 1000
            else
                if isDead then
                    isDead = false
                end

                sleep = 5

                if IsControlPressed(0, 21) and IsControlJustPressed(0, 311) then
                    SendNUIMessage({ changeVisibility = true, visible = false })
                    QBCore.Functions.Notify('Ẩn danh sách đàm', 'error')
                end
                
                if IsControlPressed(0, 21) and IsControlJustPressed(0, 303) then
                    SendNUIMessage({ changeVisibility = true, visible = true })
                    QBCore.Functions.Notify('Hiện danh sách đàm', 'success')
                end
            end
        end
        Wait(sleep)
    end
end)

-- Đổi tên trong đàm
if Config.LetPlayersSetTheirOwnNameInRadio then
    TriggerEvent("chat:addSuggestion", "/" .. Config.RadioListChangeNameCommand,
        "Tùy chỉnh tên hiển thị trong danh sách đàm",
        { { name = 'tên mới', help = "Nhập tên bạn muốn hiển thị" } })
end

-- Cập nhật danh sách qua ID
RegisterNetEvent('RemoveAllById:RadioList')
AddEventHandler('RemoveAllById:RadioList', function(pid, typ, name, mhz)
    if typ == "remove" then
        SendNUIMessage({ action = "update-ui-drop", pid = pid })
    else
        SendNUIMessage({ action = "update-ui-join", pid = pid, name = name, mhz = mhz })
    end
end)