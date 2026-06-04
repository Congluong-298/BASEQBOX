local firstLoad = false

function LoadHUD()
    Wait(1000)
    WaitCore()
    WaitPlayer()
    nuiMessage("SET_GIFT_INFORMATIONS", {
        text = Config.Gift.text,
        time = Config.Gift.time,
        enable = Config.Gift.enable,
    })
    TriggerServerEvent('mHud:RequestPlaylists')
    TriggerServerEvent("mHud:StartGiftTimer")
    TriggerServerEvent("mHud:UpdatePlayersAmount")
    TriggerServerEvent("mHud:CheckPlayerStress")
    LoadPlayerInformations()
    nuiMessage("SET_HUD_LOADED")
    ShowHud()
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    LoadHUD()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    LoadHUD()
end)

CreateThread(function()
    Wait(2000)
    if not firstLoad then
        LoadHUD()
    end
end)

AddEventHandler("playerSpawned", function ()
    if not firstLoad then
        firstLoad = true
        DisplayRadar(false)
    end
end)
