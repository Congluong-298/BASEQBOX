RegisterNetEvent('QBCore:Client:VehicleInfo', function(data)
    print(LocalPlayer.state.isLoggedIn, data.event)
    if not LocalPlayer.state.isLoggedIn or data.event == 'Entering' then 
        return 
    end
    Wait(100)
    local driver = GetPedInVehicleSeat(data.vehicle, -1)
    if driver ~= 0 then 
        for _, v in pairs(GetGamePool("CObject")) do
            if IsEntityAttachedToEntity(cache.ped, v) then
                local model = GetEntityModel(v) 
                if model ~= GetHashKey("prop_money_bag_01") then 
                    SetEntityAsMissionEntity(v, true, true)
                    DeleteObject(v)
                    DeleteEntity(v)
                end
            end
        end
    end
end)
