
local QBCore = exports['qb-core']:GetCoreObject()
local peacetimeActive = false

RegisterNetEvent('qb-peacetime:client:Toggle', function(state)
    peacetimeActive = state
    if peacetimeActive then
        QBCore.Functions.Notify("Chế độ hòa bình (Peacetime) đã được BẬT", "primary")
    else
        QBCore.Functions.Notify("Chế độ hòa bình (Peacetime) đã được TẮT", "error")
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000
        if peacetimeActive then
            sleep = 0
            local playerPed = PlayerPedId()
            NetworkSetFriendlyFireOption(false)
            SetCanAttackFriendly(playerPed, false, false)
            SetPlayerCanDoDriveBy(PlayerId(), false)
            DisablePlayerFiring(playerPed, true)
            DisableControlAction(0, 24, true) -- Chuột trái (Bắn)
            DisableControlAction(0, 47, true) -- G (Ném bom/lựu đạn)
            DisableControlAction(0, 58, true) -- G (Vũ khí phụ)
            DisableControlAction(0, 140, true) -- R (Đánh cận chiến)
            DisableControlAction(0, 263, true) -- Melee 1
        else
            NetworkSetFriendlyFireOption(true)
            SetPlayerCanDoDriveBy(PlayerId(), true)
            sleep = 1000 
        end
        Wait(sleep)
    end
end)