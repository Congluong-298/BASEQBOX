while not LocalPlayer or not LocalPlayer.state.isLoggedIn do
    Citizen.Wait(2000)

end

local bodyBag
local attached = false
local timing = {
    ['bag'] = 120 * 1000,
    ['motel'] = 60 * 1000
}
RegisterNetEvent("QBCore:GotoSleep", function(type)
    LocalPlayer.state:set("invBusy", true, true)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    PutInBodybag()

    QBCore.Functions.Progressbar('sleeping', "Đang ngủ...", false and 1000 or 90000, 
        false,
        true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
        {}, {}, {}, function()
            DoScreenFadeIn(1000)
            TakeFromBodybag()
            LocalPlayer.state:set("invBusy", false, true)
            TriggerServerEvent("QBCore:Server:SetMetaData", "sleep", 100)
        end, function()
            DoScreenFadeIn(1000)
            TakeFromBodybag()
            LocalPlayer.state:set("invBusy", false, true)
        end)
end)
RegisterNetEvent("QBCore:GotoSleepp", function(type)
    LocalPlayer.state:set("invBusy", true, true)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    PutInBodybagg()
    QBCore.Functions.Progressbar('sleeping', "Đang ngủ...", false and 1000 or 90000, 
        false,
        true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
        {}, {}, {}, function()
            DoScreenFadeIn(1000)
            TakeFromBodybagg()
            LocalPlayer.state:set("invBusy", false, true)
            TriggerServerEvent("QBCore:Server:SetMetaData", "sleep", 100)
        end, function()
            DoScreenFadeIn(1000)
            TakeFromBodybagg()
            LocalPlayer.state:set("invBusy", false, true)
        end)
end)

function PutInBodybag()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    if not attached then
        SetEntityVisible(playerPed, false, false)
        RequestModel("xm_prop_body_bag")

        while not HasModelLoaded("xm_prop_body_bag") do
            Citizen.Wait(1)
        end
        FreezeEntityPosition(playerPed, true)
        bodyBag = CreateObject(joaat("xm_prop_body_bag"), playerCoords.x, playerCoords.y, playerCoords.z - 1, true, true,
            true)
        PlaceObjectOnGroundProperly(bodyBag)
        -- AttachEntityToEntity(bodyBag, playerPed, 0, -0.2, 0.75, -0.2, 0.0, 0.0, 0.0, false, false, false, false, 20, false)
        -- attached = true
    end
end

function PutInBodybagg()
    local playerPed = PlayerPedId()
    SetEntityVisible(playerPed, false, false)
    FreezeEntityPosition(playerPed, true)

end

function TakeFromBodybag()
    -- if attached then
    SetEntityVisible(PlayerPedId(), true, false)
    FreezeEntityPosition(PlayerPedId(), false)
    DetachEntity(PlayerPedId(), true, true)
    DeleteEntity(bodyBag)
    attached = false
    -- end
end

function TakeFromBodybagg()
    SetEntityVisible(PlayerPedId(), true, false)
    FreezeEntityPosition(PlayerPedId(), false)
end

local beds = {
    {
        name = "bed_police",
        coords = vec3(432.91, -990.55, 30.69),
        size = vec3(2.5, 2.5, 1.0),
        rotation = 0,
        groups = 'police'
    },
    {
        name = "bed_police_1",
        coords = vec3(1840.02, 3677.24, 38.93),
        size = vec3(1.5, 0.8, 4.0),
        rotation = 300,
        groups = 'police'
    },
    {
        name = "bed_police_2",
        coords = vec3(-452.97, 6003.85, 37.0),
        size = vec3(1.5, 0.6, 4.0),
        rotation = 47,
        groups = 'police'
    },
    {
        name = "bed_police_3",
        coords = vec3(1537.96, 810.19, 77.66),
        size = vec3(1.5, 0.5, 4.0),
        rotation = 60,
        groups = 'police'
    },
    {
        name = "bed_ambulance",
        coords = vec3(316.62, -598.03, 43.27),
        size = vec3(1.8, 0.8, 1.0),
        rotation = 340,
        groups = 'ambulance'
    },
    {
        name = "bed_ambulance_1",
        coords = vec3(1662.83, 3662.94, 35.34),
        size = vec3(1.0, 1.0, 4.0),
        rotation = 30,
        groups = 'ambulance'
    },
    {
        name = "bed_ambulance_2",
        coords = vec3(-267.16, 6316.49, 32.43),
        size = vec3(1.0, 1.0, 4.0),
        rotation = 315,
        groups = 'ambulance'
    },
    {
        name = "a",
        coords = vec3(-1896.84, 2076.65, 140.84),
        size = vec3(0.5, 1.5, 4.0),
        rotation = 320,
        groups = nil -- Mọi người đều dùng được
    }
}

for _, bed in ipairs(beds) do
    exports.ox_target:addBoxZone({
        coords = bed.coords,
        size = bed.size,
        rotation = bed.rotation,
        debug = false,
        options = {
            {
                name = bed.name,
                event = 'QBCore:GotoSleepp',
                icon = 'fas fa-circle',
                label = 'Ghé lưng',
                groups = bed.groups,
                distance = 2.0
            }
        }
    })
end