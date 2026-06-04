local QBCore = exports['qb-core']:GetCoreObject()
script_name = GetCurrentResourceName()

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(250)
    end
end)

RegisterNetEvent(script_name.. ":CL:USEITEM")
AddEventHandler(script_name.. ":CL:USEITEM", function()
    if Charger then return end
    if not IsPedOnFoot(PlayerPedId()) or IsPedRagdoll(GetPlayerPed(-1)) then return end
    Charger = true
    LoadAnimDict('export@lucasposeanime2')
    TaskPlayAnim(PlayerPedId(), "export@lucasposeanime2" ,"lucasposeanime2" ,8.0, -8.0, -1, 1, 0, false, false, false)
    local coords = GetEntityCoords(PlayerPedId())
    -- TriggerServerEvent("InteractSound_SV:PlayOnSource", "gojo", 10)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 20, 'gojo', 10)
    Wait(5000)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 20, 'gojo_v2', 10)
    TriggerServerEvent(script_name.. ":SV:EXPLOSION", coords)
end)

RegisterNetEvent(script_name.. ":CL:EXPLOSION")
AddEventHandler(script_name.. ":CL:EXPLOSION", function(explosioncoords, ped)
	Citizen.CreateThread(function()
        local playerid = GetPlayerFromServerId(ped)
        local ped = GetPlayerPed(playerid)
        local radius = 0.0
        local Room = true
        Citizen.CreateThread(function()
            while Room do
                Citizen.Wait(0)
                if radius < Config["MaxHaki"] then
                    radius = radius + 0.1
                end
                if radius >= Config["MaxHaki"] then
                    if playerid ~= -1 then
                        if ped == PlayerPedId() then
                            ClearPedTasks(PlayerPedId())
                        end
                    end
                    Citizen.CreateThread(function()
                        Citizen.Wait(Config["WaiuHaki"])
                        Charger = false
                        Room = false
                    end)
                end
            end
        end)

        Citizen.CreateThread(function()
            while Room do
                Citizen.Wait(0)
                DrawMarker(28, explosioncoords.x, explosioncoords.y, explosioncoords.z, 0, 0, 0, 0, 0, 0, radius, radius, radius, 59, 0, 0, 155, 0, 0, 2, 0, 0, 0, 0)
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)
                local dist = Vdist(explosioncoords, coords)
                if dist <= radius then
                    if playerid ~= -1 then
                        if ped ~= PlayerPedId() then
                            if not IsPedRagdoll(GetPlayerPed(-1)) then
                                local ForwardVector = GetEntityForwardVector(PlayerPedId())
                                SetPedToRagdollWithFall(PlayerPedId(), 10000, 10000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                            end
                        end
                    end
                end
            end
        end)
	end)
end)

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end