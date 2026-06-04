local QBCore = exports['qb-core']:GetCoreObject()
local script_name = GetCurrentResourceName()

QBCore.Commands.Add('haki', 'Haki bá vương (Admin)', {}, false, function(source, args)
    local src = source
    TriggerClientEvent(script_name.. ":CL:USEITEM", src)
end, 'admin')

exports('haki_scroll', function(event, item, inventory, slot, data)
    if event == 'usingItem' then
        local src = inventory.id
        TriggerClientEvent(script_name.. ":CL:USEITEM", src)
        
        return 1 
    end
end)

RegisterNetEvent(script_name.. ":SV:EXPLOSION", function(coords)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    
    if xPlayer then
        TriggerClientEvent(script_name.. ":CL:EXPLOSION", -1, coords, src)
    end
end)