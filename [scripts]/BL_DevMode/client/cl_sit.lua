local sitting = false
local pos = nil
local lastPos = nil
local currentScenario = nil
local data = nil
local object = nil
local id = 0
local distance = 0

CreateThread(function()
    local Sitables = {}

    for k, v in pairs(Config.Props) do
        table.insert(Sitables, GetHashKey(v))
    end

    exports.ox_target:addModel(Sitables, {
        {
            name = 'sit_on_prop',
            event = "qb-sit:sit",
            icon = "fas fa-chair",
            label = "Ngồi xuống",
            distance = 1.5
        },
    })

    for k, v in pairs(Config.PolyChairs) do
        exports.ox_target:addBoxZone({
            coords = v.coords,
            size = vec3(v.width, v.length, v.maxZ - v.minZ),
            rotation = v.heading,
            debug = false,
            options = {
                {
                    name = 'poly_chair_'..k,
                    event = 'qb-sit:sitAlt',
                    icon = 'fas fa-circle',
                    label = 'Ngồi',
                    zOffset = v.zOffset,
                    PolyCoords = v.coords,
                    PolyHeading = v.heading,
                    distance = 2.0
                }
            }
        })
    end

    while true do
        Wait(100)
        if sitting and not IsPedUsingScenario(cache.ped, currentScenario) then
            Standup()
        end
    end
end)

RegisterNetEvent("qb:target:init:" .. GetCurrentResourceName(), function(Mapper)
    Mapper.Mapping:Listen("standup", "Get out of chair~", "keyboard", "X", function(state)
        if state and sitting then
            Standup()
        end
    end)
end)

RegisterNetEvent('qb-sit:sit', function()
    local ped = cache.ped
    if not IsPedInAnyVehicle(ped) then
        if sitting then
            Standup()
        else
            object, distance = GetNearChair()

            if distance and distance < 1.5 then
                local hash = GetEntityModel(object)
                data = nil
                local modelName = nil
                local found = false
                for k, v in pairs(Config.Sitable) do
                    if GetHashKey(k) == hash then
                        data = v
                        modelName = k
                        found = true
                        break
                    end
                end

                if found then
                    sit(object)
                end
            else
                QBCore.Functions.Notify('Không Gần Cái Gì Để Ngồi', 'error')
            end
        end
    else
        QBCore.Functions.Notify('Không thể làm điều đó trong xe', 'error')
    end
end)

RegisterNetEvent('qb-sit:sitAlt', function(dat)
    if not IsPedInAnyVehicle(cache.ped) then
        if sitting then
            Standup()
        else
            sitAlt(dat)
        end
    else
        QBCore.Functions.Notify('Không thể làm điều đó trong xe', 'error')
    end
end)

function GetNearChair()
    local obj, dist
    local coords = GetEntityCoords(cache.ped)
    for i = 1, #Config.Props do
        local closeObj = GetClosestObjectOfType(coords, 2.0, GetHashKey(Config.Props[i]), false, false, false)
        if DoesEntityExist(closeObj) then
            local objCoords = GetEntityCoords(closeObj)
            dist = #(coords - objCoords)
            if dist < 1.6 then
                return closeObj, dist
            end
        end
    end
    return nil, nil
end

function Standup()
    local playerPed = cache.ped
    ClearPedTasks(playerPed)
    sitting = false
    if lastPos then
        SetEntityCoords(playerPed, lastPos)
    end
    FreezeEntityPosition(playerPed, false)
    TriggerServerEvent('qb-sit:server:LeaveChair', id)
    id = 0
    currentScenario = nil
end

function sit(obj)
    object = obj
    pos = GetEntityCoords(object)
    id = math.random(11111, 99999)
    TriggerServerEvent('qb-sit:server:GetChair', id)
end

function sitAlt(dat)
    if not dat or not dat.PolyCoords then return end
    id = math.random(11111, 99999)
    TriggerServerEvent('qb-sit:server:GetChairAlt', id, dat)
end

RegisterNetEvent('qb-sit:client:GetChair', function(occupied)
    if occupied then
        QBCore.Functions.Notify('Ghế Có Người Ngồi', 'error')
        id = 0
        currentScenario = nil
    else
        local playerPed = cache.ped
        lastPos = GetEntityCoords(playerPed)
        TriggerServerEvent('qb-sit:server:TakeChair', id)
        currentScenario = data.scenario
        TaskStartScenarioAtPosition(playerPed, currentScenario, pos.x, pos.y, pos.z - (data.verticalOffset or 0.0), GetEntityHeading(object) + 180.0, 0, true, true)
        sitting = true
    end
end)

RegisterNetEvent('qb-sit:client:GetChairAlt', function(occupied, dat)
    if occupied then
        QBCore.Functions.Notify('Ghế Có Người Ngồi', 'error')
        id = 0
        currentScenario = nil
    else
        local playerPed = cache.ped
        lastPos = GetEntityCoords(playerPed)
        SetEntityHeading(playerPed, dat.PolyHeading)
        TriggerServerEvent('qb-sit:server:TakeChair', id)
        currentScenario = 'PROP_HUMAN_SEAT_CHAIR_UPRIGHT'
        TaskStartScenarioAtPosition(playerPed, currentScenario, dat.PolyCoords.x, dat.PolyCoords.y, dat.PolyCoords.z + (dat.zOffset or 0.0), dat.PolyHeading, -1, true, true)
        sitting = true
    end
end)