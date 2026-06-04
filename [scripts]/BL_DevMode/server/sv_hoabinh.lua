local QBCore = exports['qb-core']:GetCoreObject()
local peacetimeActive = false

QBCore.Commands.Add("peacetime", "Bật/Tắt chế độ hòa bình toàn Server (Admin)", {}, false, function(source, args)
    peacetimeActive = not peacetimeActive
    TriggerClientEvent('qb-peacetime:client:Toggle', -1, peacetimeActive)
    
    local pName = GetPlayerName(source)
end, "admin")