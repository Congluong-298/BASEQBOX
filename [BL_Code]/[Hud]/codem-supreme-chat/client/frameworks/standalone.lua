AddEventHandler('onClientResourceStart', function(resName)
    if resName ~= GetCurrentResourceName() then return end
    if Config.Framework ~= 'standalone' then return end
    Wait(1000)
    TriggerServerEvent('codem-supreme-chat:server:GetPlayerData')
end)