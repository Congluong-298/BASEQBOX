PlayerPed = false
Vehicle = false
Core = nil
pauseActive = false
alreadyInVehicle = false
currentMode = 'default'

nuiLoaded = false
hudSettings = {
    compassBehaviour = "playerlook",
    speedType = Config.DefaultSpeedType,
    speedoRefreshRate = "medium",
    cinematicMode = false,
    streamerMode = false,
    playMediaSongs = false,
}
directions = {
    N = 360, 0,
    NE = 315,
    E = 270,
    SE = 225,
    S = 180,
    SW = 135,
    W = 90,
    NW = 45
    --  N = 0, <= will result in the HUD breaking above 315deg
}
CreateThread(function()
    while true do
        PlayerPed = PlayerPedId()
        Vehicle = GetVehiclePedIsIn(PlayerPed)
        Wait(3000)
    end
end)
if Config.EnableSafezoneNotify then
    local alreadyInZone = false
    CreateThread(function()
        while true do
            local coords = GetEntityCoords(PlayerPed)
            local inSafezone = false
            for _,v in pairs(Config.SafezoneNotifyCoords) do
                local dist = #(coords - v.coords)
                if dist < v.radius then
                    inSafezone = true
                end
            end
            if inSafezone and not alreadyInZone then
                alreadyInZone = true
                nuiMessage("SHOW_SAFEZONE_NOTIFY")
            end
            if not inSafezone and alreadyInZone then
                alreadyInZone = false
                nuiMessage("HIDE_SAFEZONE_NOTIFY")
            end
            Wait(3000)
        end
    end)
end

function HideHud()
    nuiMessage("HIDE_HUD")
end

function ShowHud()
    nuiMessage("SHOW_HUD")
end

function multipleSpeed()
    return hudSettings.speedType == 'kmh' and 3.6 or 2.23694 
end

RegisterNetEvent("mHud:HideHud")
AddEventHandler("mHud:HideHud", function()
    HideHud()
end)

RegisterNetEvent("mHud:ShowHud")
AddEventHandler("mHud:ShowHud", function()
    ShowHud()
end)

CreateThread(function()

    while true do
        if IsPauseMenuActive() and not pauseActive then
            pauseActive = true
            HideHud()
        end
        if not IsPauseMenuActive() and pauseActive and not CinematicModeOn then
            pauseActive = false
            ShowHud()
        end
        Wait(2500)

    end
end)

RegisterNUICallback("getHudSetting", function(data, cb)
    local type = data.type
    local value = data.value
    hudSettings[type] = value
    if type == 'cinematicMode' then
        CinematicShow(value)
    end
    cb("ok")
end)

CreateThread(function()
    Core, Config.Framework = GetCore()
end)

function WaitCore()
    while Core == nil do
        Wait(0)
    end
end

function nuiMessage(action, payload)
    WaitNUI()
    SendNUIMessage({
        action = action,
        payload = payload
    }) 
end

function setShowMapWalking(val)
    nuiMessage("SET_SHOW_MAP_WALKING", val)
end

function loadKeys()    
    nuiMessage("LOAD_KEYS", Config.UIKeys)
end

RegisterNUICallback('loaded', function(data, cb)
    nuiLoaded = true
    cb('ok')
end)

RegisterNetEvent("mHud:GetPlayerGiftTimer")
AddEventHandler("mHud:GetPlayerGiftTimer", function(time)
    nuiMessage("SET_PLAYER_GIFT_TIME", time)

end)

CreateThread(function()
    WaitCore()
    WaitPlayer()
    loadKeys()  
    setShowMapWalking(Config.ShowMapWhileWalking)
    local identifier = TriggerCallback("mHud:GetIdentifier")
    nuiMessage("SET_IDENTIFIER", identifier)

    local pp = TriggerCallback("mHud:GetPlayerDiscordPP")
    nuiMessage("SET_PLAYER_PP", pp)
    nuiMessage("TOGGLE_VEHICLE_MODES", Config.EnableVehicleModes)
    nuiMessage("SET_COUNTRY_CODE", Config.CountryCode)
    nuiMessage("SET_WATERMARK_INFORMATIONS", Config.WaterMarkInformations)
    nuiMessage("TOGGLE_SECOND_JOB", Config.SecondJob.enable)   
    nuiMessage("SET_LOCALES", Config.Locales)   
    nuiMessage("ENABLE_UI_KEYS", Config.EnableUIKeys)   
    
    nuiMessage("SET_DEFAULT_SPEED_TYPE", Config.DefaultSpeedType)   
    nuiMessage("SET_MOUSE_CURSOR_KEY_LABEL", Config.MouseCursorKeyLabel)   
    nuiMessage("SET_MAX_VOICE_RANGES", Config.MaxVoiceRanges)   

    nuiMessage("SET_SAFEZONE_NOTIFY", Config.EnableSafezoneNotify)   
    if Config.SecondJob.enable then
        Config.SecondJob.func()
    end
    
end)

AddStateBagChangeHandler('hudInfoPlayersAmount', 'global', function(bagName, key, value)
    nuiMessage("SET_PLAYERS_AMOUNT", value)    
end)

if Config.GtaDefaultUIs.enable then
    CreateThread(function()
        while true do
            if Config.GtaDefaultUIs.hide.vehicle_name then
                HideHudComponentThisFrame(6) -- VEHICLE_NAME
            end
            if Config.GtaDefaultUIs.hide.area_name then
                HideHudComponentThisFrame(7) -- AREA_NAME
            end
            if Config.GtaDefaultUIs.hide.vehicle_class then
                HideHudComponentThisFrame(8) -- VEHICLE_CLASS
            end
            if Config.GtaDefaultUIs.hide.street_name then
                HideHudComponentThisFrame(9) -- STREET_NAME
            end
            if Config.GtaDefaultUIs.hide.cash then
                HideHudComponentThisFrame(3) -- CASH
            end
            if Config.GtaDefaultUIs.hide.mp_cash then
                HideHudComponentThisFrame(4) -- MP_CASH
            end
            if Config.GtaDefaultUIs.hide.hud_components then
                HideHudComponentThisFrame(21) -- 21 : HUD_COMPONENTS
            end
            if Config.GtaDefaultUIs.hide.hud_weapons then
                HideHudComponentThisFrame(22) -- 22 : HUD_WEAPONS
            end
            if Config.GtaDefaultUIs.hide.ammo then
                DisplayAmmoThisFrame(false)
            end
            Wait(4)
        end
    end)
end

CreateThread(function()
    while not nuiLoaded do
        if NetworkIsSessionStarted() then
            SendNUIMessage({
                action = "CHECK_NUI",
            }) 
        end
        Wait(2000)
    end
end)

local cursorEnabled = false

function DisableMouseControl()
    CreateThread(function()    
        while cursorEnabled do
            Wait(0)
            DisableControlAction(0, 0, true) -- disable V
            DisableControlAction(0, 1, true) -- disable mouse look
            DisableControlAction(0, 2, true) -- disable mouse look
            DisableControlAction(0, 3, true) -- disable mouse look
            DisableControlAction(0, 4, true) -- disable mouse look
            DisableControlAction(0, 5, true) -- disable mouse look
            DisableControlAction(0, 6, true) -- disable mouse look
            DisableControlAction(0, 199, true) -- map
            DisableControlAction(0, 200, true) -- map
            DisableControlAction(0, 75, true) -- F
            DisableControlAction(0, 200, true) -- ESC
            DisableControlAction(0, 202, true) -- BACKSPACE / ESC
            DisableControlAction(0, 177, true) -- BACKSPACE / ESC            
            HideHudComponentThisFrame(16)

        end
    end)
end
local vehicleType = ""

CreateThread(function()
    while true do
        if alreadyInVehicle then    
            if IsDisabledControlJustPressed(0, Config.MouseCursorKey) then -- CAPS
                local vehicle = Vehicle
                if GetVehicleType(vehicle) ~= 'bike' then
                    cursorEnabled = not cursorEnabled
                    SetNuiFocus(cursorEnabled, cursorEnabled)
                    SetNuiFocusKeepInput(cursorEnabled)           
                    DisableMouseControl()
                end
            end                                    
        else
            if cursorEnabled then
                cursorEnabled = false
                SetNuiFocus(cursorEnabled, cursorEnabled)
                SetNuiFocusKeepInput(cursorEnabled)       
            end      
            Wait(2500)
        end
     
        Wait(0)
    end
end)

function LoadRectMinimap()

    local defaultAspectRatio = 1920/1080 -- Don't change this.
    local resolutionX, resolutionY = GetActiveScreenResolution()

    local aspectRatio = GetAspectRatio(0)
    local aspectRatio = resolutionX/resolutionY
    local minimapOffset = 0
    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio-aspectRatio)/3.6)
    end
 
    RequestStreamedTextureDict("squaremap", false)
    if not HasStreamedTextureDictLoaded("squaremap") then
        Wait(150)
    end
    SetMinimapClipType(0)
    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")
    -- 0.0 = nav symbol and icons left
    -- 0.1638 = nav symbol and icons stretched
    -- 0.216 = nav symbol and icons raised up
    SetMinimapComponentPosition("minimap", "L", "B", 0.0 + minimapOffset, -0.047, 0.1638, 0.183)
    -- icons within map
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0 + minimapOffset, 0.0, 0.128, 0.20)
    -- -0.01 = map pulled left
    -- 0.025 = map raised up
    -- 0.262 = map stretched
    -- 0.315 = map shorten
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.0085+ minimapOffset , 0.028, 0.296, 0.339)
    SetBlipAlpha(GetNorthRadarBlip(), 0)
    SetRadarBigmapEnabled(true, false)
    SetMinimapClipType(0)
    Wait(50)
    SetRadarBigmapEnabled(false, false)

end

function GetMinimapAnchor()
    -- Safezone goes from 1.0 (no gap) to 0.9 (5% gap (1/20))
    -- 0.05 * ((safezone - 0.9) * 10)
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end


RegisterNUICallback('resize', function(data, cb)
    LoadRectMinimap()
    local res_x, res_y = GetActiveScreenResolution()
    
    nuiMessage("ADJUST_HUD_POSITION", {
        left = res_x * GetMinimapAnchor().x+5,
    })
    cb('ok')
end)

CreateThread(function()
    WaitCore()
    WaitNUI()
    WaitPlayer()
    Wait(3000)
    LoadRectMinimap()
    local res_x, res_y = GetActiveScreenResolution()
    nuiMessage("ADJUST_HUD_POSITION", {
        left = res_x * GetMinimapAnchor().x+5,
    })
end)

function GetVehicleType(vehicle)
    if Config.EnableOnlyDefaultSpeedometer then
        if class == 13 then
            return "bike"
        elseif class == 16 or class == 15 then
            return "plane"
        elseif class == 14 then
            return "boat"
        end
    else        
        local class = GetVehicleClass(vehicle)
        if currentMode == 'drift' or currentMode == 'sport' then
            return currentMode..'mode'
        end
        if class == 13 then
            return "bike"
        elseif class == 16 or class == 15 then
            return "plane"
        elseif class == 14 then
            return "boat"
        elseif class == 4 then
            return "muscle"
        elseif class == 6 or class == 7 then
            return "super"
        end
    end
    return "vehicle"
end

local inPassengerSeat = false
CreateThread(function()
    if not Config.ShowMapWhileWalking then
        DisplayRadar(false)
    end
    while true do
        local vehicle = Vehicle
        if IsPedInAnyVehicle(PlayerPed) then 
            if not alreadyInVehicle then
                local type = GetVehicleType(vehicle)
                if not Config.EnableVehiclesDefaultRadio then
                    SetVehicleRadioEnabled(vehicle, false)
                    SetVehRadioStation(vehicle, "OFF")
                end
                nuiMessage("IN_VEHICLE", {
                    value = true,
                    type = type
                }) 
                local Plate = trim(GetVehicleNumberPlateText(vehicle))

                if VehicleNitrous[Plate] and VehicleNitrous[Plate].hasnitro then
                    setNitroValue(VehicleNitrous[Plate].level)
                else
                    setNitroValue(0)
                end
                vehicleType = type
                if GetPedInVehicleSeat(vehicle, -1) == PlayerPed then
                    alreadyInVehicle = true 
                    inPassengerSeat = false
                else
                    inPassengerSeat = true
                end
                nuiMessage("SET_IN_PASSENGER_SIDE", inPassengerSeat)

                DisplayRadar(true)           
            end
        else
            if alreadyInVehicle or inPassengerSeat then
                if not Config.ShowMapWhileWalking then
                    DisplayRadar(false)    
                end

                vehicleType = ""
                nuiMessage("IN_VEHICLE", {
                    value = false,
                    type = false,
                })         
                -- TriggerServerEvent("mHud:DestroyMusic")
                alreadyInVehicle = false
                inPassengerSeat = false
                nuiMessage("SET_IN_PASSENGER_SIDE", inPassengerSeat)
                if currentMode == 'drift' then
                    DisableDriftMode(vehicle)
                end
                if currentMode == 'sport' then
                    resetVeh(vehicle)
                end
                currentMode = "default"
            end
        end
        Wait(2000)
    end
end)

local lastRgb = {
    r = false,
    g = false,
    b = false,
}

function CheckNeonEnabled()
    local vehicle = Vehicle

    local neons = {"left", "right", "front", "back"}
    for i=0, 3 do
        if IsVehicleNeonLightEnabled(vehicle, i) then
            nuiMessage("NEON_ENABLED", {
                type = neons[i+1],
                value = true,
            })         
        else
            nuiMessage("NEON_ENABLED", {
                type = neons[i+1],
                value = false,
            })         
        end
    end
end

function CheckVehicleLights(vehicle)
   local player = PlayerPed
   local vehicleVal, vehicleLights, vehicleHighlights  = GetVehicleLightsState(vehicle)
   if vehicleVal then
        local vehicleIsLightsOn
        if vehicleLights == 1 and vehicleHighlights == 0 then
            vehicleIsLightsOn = true
        elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
            vehicleIsLightsOn = true
        else
            vehicleIsLightsOn = false
        end
        nuiMessage("VEHICLE_LIGHTS", vehicleIsLightsOn)
    end
end


CreateThread(function()
    while true do
        if alreadyInVehicle or IsPedInAnyVehicle(PlayerPed) then
            local vehicle = Vehicle
            if DoesEntityExist(vehicle) then
                local r,g,b = GetVehicleNeonLightsColour(vehicle)
                if lastRgb.r == r and lastRgb.g == g and lastRgb.b == b then
                    Wait(2000)
                end
                lastRgb = {r = r, g = g, b = b}        
                nuiMessage("NEON_LIGHTS", {
                    r = r,
                    g = g,
                    b = b,
                })  
                
                nuiMessage("FUEL", Config.Fuel(vehicle))
    
                CheckVehicleDoors()
                CheckNeonEnabled()
                CheckVehicleLights(vehicle)
            end
        end
        Wait(2000)
    end
end)


local hazardlights = false
local leftindicator = false
local rightindicator = false
local lastState = nil

function SetVehicleSignals(data)
    nuiMessage("VEHICLE_SIGNALS", data) 
end

CreateThread(function()
    while true do
        local player = PlayerPed
        local vehicle = Vehicle
        if DoesEntityExist(vehicle) then
            if GetVehicleIndicatorLights(vehicle) == 0 and lastState ~= 0 then
        
                SetVehicleSignals({
                    leftindicator = false,
                    rightindicator = false,
                    hazardlights = false,
                })
                hazardlights = false
                leftindicator = false
                rightindicator = false                       
            end
            if GetVehicleIndicatorLights(vehicle) == 1 and lastState ~= 1 then
                SetVehicleSignals({
                    leftindicator = true,
                    rightindicator = false,
                    hazardlights = false,
                })
                hazardlights = false
                leftindicator = true
                rightindicator = false                     
            end
            if GetVehicleIndicatorLights(vehicle) == 2 and lastState ~= 2 then
          
                SetVehicleSignals({
                    leftindicator = false,
                    rightindicator = true,
                    hazardlights = false,
                })
                hazardlights = false
                leftindicator = false
                rightindicator = true                    
            end     
            if GetVehicleIndicatorLights(vehicle) == 3 and lastState ~= 3 then
                SetVehicleSignals({
                    leftindicator = false,
                    rightindicator = false,
                    hazardlights = true,
                })
                hazardlights = true
                leftindicator = false
                rightindicator = false
            end                              
            lastState = GetVehicleIndicatorLights(vehicle)
        else
            if hazardlights or leftindicator or rightindicator then
    
                SetVehicleSignals({
                    leftindicator = false,
                    rightindicator = false,
                    hazardlights = false,
                })
                hazardlights = false
                leftindicator = false
                rightindicator = false
                lastState = nil
            end
        end
        Wait(950)
    end
end)

CreateThread(function()
    while true do
        local player = PlayerPed
        local vehicle = Vehicle
        if DoesEntityExist(vehicle) then
            if GetVehicleIndicatorLights(vehicle) == 1 or GetVehicleIndicatorLights(vehicle) == 2 or GetVehicleIndicatorLights(vehicle) == 3 then
                PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- on
            end
        end
        Wait(1000)
    end
end)


if Config.EnableIndicators then
    function LeftIndicator()
        local player = PlayerPed
        local vehicle = Vehicle
        if DoesEntityExist(vehicle) then
            if GetVehicleIndicatorLights(vehicle) == 1 or GetVehicleIndicatorLights(vehicle) == 3 then
                if hazardlights then
                    SetVehicleIndicatorLights(vehicle, 0, false)               
                    SetVehicleIndicatorLights(vehicle, 1, true)
    
                    leftindicator = true
                    hazardlights = false
                    rightindicator = false
                    hazardlights = false                    
                else
                    SetVehicleIndicatorLights(vehicle, 1, false)
                    SetVehicleIndicatorLights(vehicle, 0, false)               
            
                    leftindicator = false
                    hazardlights = false
                    rightindicator = false
                    hazardlights = false  
                end
              
            elseif GetVehicleIndicatorLights(vehicle) == 0 or  GetVehicleIndicatorLights(vehicle) == 2 then
                SetVehicleIndicatorLights(vehicle, 0, false)               
                SetVehicleIndicatorLights(vehicle, 1, true)
    
    
                leftindicator = true
                hazardlights = false
                rightindicator = false
                hazardlights = false
            end
        end
    end

    function RightIndicator()
        local player = PlayerPed
        local vehicle = Vehicle
        if DoesEntityExist(vehicle) then
            if GetVehicleIndicatorLights(vehicle) == 3 or GetVehicleIndicatorLights(vehicle) == 2 then
                if hazardlights then
                    SetVehicleIndicatorLights(vehicle, 1, false)
                    SetVehicleIndicatorLights(vehicle, 0, true)
      
    
                    rightindicator = true
                    leftindicator = false
                    hazardlights = false
                else
                    SetVehicleIndicatorLights(vehicle, 1, false)
                    SetVehicleIndicatorLights(vehicle, 0, false)               
              
                    leftindicator = false
                    hazardlights = false
                    rightindicator = false
                    hazardlights = false
                end
                    
            elseif GetVehicleIndicatorLights(vehicle) == 0 or  GetVehicleIndicatorLights(vehicle) == 1 then
                SetVehicleIndicatorLights(vehicle, 1, false)
                SetVehicleIndicatorLights(vehicle, 0, true)
    
    
                rightindicator = true
                leftindicator = false
                hazardlights = false
    
            end
        end
    end

    function HazardLights()
        local player = PlayerPed
        local vehicle = Vehicle
        if DoesEntityExist(vehicle) then
            if not hazardlights then
                hazardlights = true
                SetVehicleIndicatorLights(vehicle, 0, false)
                SetVehicleIndicatorLights(vehicle, 1, false)

                leftindicator = false
                rightindicator = false                
                SetVehicleIndicatorLights(vehicle, 0, true)
                SetVehicleIndicatorLights(vehicle, 1, true)
            else

                SetVehicleIndicatorLights(vehicle, 1, false)
                SetVehicleIndicatorLights(vehicle, 0, false)                               
                leftindicator = false
                hazardlights = false
                rightindicator = false
                hazardlights = false                    
            end
        end

    end

    if Config.EnableRegisterKeyMapping then
        RegisterCommand("leftindicator", function()
            LeftIndicator()
        end)    
    
        RegisterCommand("rightindicator", function()
            RightIndicator()
        end)
        RegisterCommand("hazardlights", function()
            HazardLights()
        end)
        RegisterKeyMapping('leftindicator', 'Left indicator', 'keyboard', Config.leftindicator)
        RegisterKeyMapping('rightindicator', 'Right indicator', 'keyboard', Config.rightindicator)
        RegisterKeyMapping('hazardlights', 'Hazard Lights', 'keyboard', Config.hazardlights)
    else
        CreateThread(function()
            while true do
                if alreadyInVehicle then
                    if IsControlJustPressed(0, Config.leftindicator) then
                        LeftIndicator()
                    end
                    if IsControlJustPressed(0, Config.rightindicator) then
                        RightIndicator()
                    end
                    if IsControlJustPressed(0, Config.hazardlights) then
                        HazardLights()
                    end
                else
                    Wait(1200)
                end
                Wait(0)
            end
        end)
    end
end





local handbrake = false
CreateThread(function()
    while true do
        if alreadyInVehicle then
            if IsControlPressed(0, 76) then
                if not handbrake then
                    nuiMessage("handbrake", true)  
                    handbrake = true
                end
            else
                if handbrake then
                    nuiMessage("handbrake", false)  
                    handbrake = false
                end
            end
        else
            Wait(1500)
        end
        Wait(0)
    end
end)

local abs = false
CreateThread(function()
    while true do
        if currentMode == "drift" then
            if alreadyInVehicle then
                if IsControlPressed(0, 72) then
                    if not abs then
                        nuiMessage("abs", true)  
                        abs = true
                    end
                else
                    if abs then
                        nuiMessage("abs", false)  
                        abs = false
                    end
                end
            else
                Wait(1500)
            end
        else
            if abs then
                nuiMessage("abs", false)  
                abs = false
            end
            Wait(1500)
        end
        Wait(0)
    end
end)

local sirenStatus = false
function SetLightData(vehicle)
    local inPoliceVehicle = false
    local inAmbulanceVehicle = false 
    local sirenOn = IsVehicleSirenOn(vehicle)
    if sirenOn then 
        if not sirenStatus then
            for _,v in pairs(Config.PoliceVehicles) do
                if v == GetEntityModel(vehicle) then
                    inPoliceVehicle = true
                end
            end
            for _,v in pairs(Config.AmbulanceVehicles) do
                if v == GetEntityModel(vehicle) then
                    inAmbulanceVehicle = true
                end
            end
                
            nuiMessage("SET_LIGHT_DATA", {
                inPoliceVehicle = inPoliceVehicle,
                inAmbulanceVehicle = inAmbulanceVehicle,
                sirenOn = sirenOn,
            }) 
            sirenStatus = true 
        end
    else
        if sirenStatus then
            sirenStatus = false 
            nuiMessage("SET_LIGHT_DATA", {
                inPoliceVehicle = inPoliceVehicle,
                inAmbulanceVehicle = inAmbulanceVehicle,
                sirenOn = false,
            })  
        end
    end
end

CreateThread(function()
    while true do
        if alreadyInVehicle or IsPedInAnyVehicle(PlayerPed) then
            local vehicle = Vehicle
            if DoesEntityExist(vehicle)  then
                local speed = GetEntitySpeed(vehicle) * multipleSpeed()
                local heading = GetEntityHeading(PlayerPed)
                
                nuiMessage("SET_SPEED", {
                    current = speed,
                    rpm =  string.format("%.1f", GetVehicleCurrentRpm(vehicle)) - 0.2,
                    max = GetVehicleEstimatedMaxSpeed(vehicle) * multipleSpeed(),
                    roll = -GetEntityRoll(vehicle),
                    headingValue = heading,
                    wind = GetWindSpeed(),
                    gear = GetVehicleCurrentGear(vehicle),

                })  
            end        
        else
            Wait(1000)
        end
        Wait(Config.SpeedometerRefreshRateTimes[hudSettings.speedoRefreshRate])
    end
end)


CreateThread(function()
    while true do
        if alreadyInVehicle then
            local vehicle = Vehicle
            if DoesEntityExist(vehicle) then
                SetLightData(vehicle)     
            else
                if sirenStatus then
                    nuiMessage("SET_LIGHT_DATA", {
                        inPoliceVehicle = false,
                        inAmbulanceVehicle = false,
                        sirenOn = false,
                    })  
                    sirenStatus = false 
                end
            end
        else
            if sirenStatus then
                nuiMessage("SET_LIGHT_DATA", {
                    inPoliceVehicle = false,
                    inAmbulanceVehicle = false,
                    sirenOn = false,
                })  
                sirenStatus = false 
            end
            Wait(2000)
        end

        Wait(1000)
    end
end)




local partyMode = false
function PartyMode()
    if not partyMode then
        local vehicle = Vehicle
        partyMode = true
        CreateThread(function()
            while partyMode do  
                for i=0, 3 do
                    if IsVehicleNeonLightEnabled(vehicle, i) then
                        SetVehicleNeonLightEnabled(vehicle, i, false)
                    else
                        SetVehicleNeonLightEnabled(vehicle, i, true)
                    end
                    Wait(120)
                end
                Wait(0)
            end
        end)
        Wait(12000)
        partyMode = false
    end
end

RegisterNUICallback("closeSettings", function(data, cb)
    SetNuiFocus(false, false)
    if cursorEnabled then
        Wait(350)
        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)       
    end    
    cb("ok")
end)

function OpenHudSettings()
    nuiMessage("OPEN_HUD_SETTINGS")
    SetNuiFocusKeepInput(false)       
    SetNuiFocus(true, true)
end
local doors = {
    frontLeftDoor = false,
    frontRightDoor = false,
    backLeftDoor = false,
    backRightDoor = false,
    hood = false,
    trunk = false,
}

function CheckVehicleDoorImage(image, keys, currentVal)
    local found = true
    for _,v in pairs(keys) do
        if not doors[v] then
            found = false
        end
    end
    if found then
        return image
    end
    return currentVal
end

function CheckVehicleDoors()
    local vehicle = Vehicle
      --[[doorIndex: 
    0 = Front Left Door

    1 = Front Right Door
    
    2 = Back Left Door

    3 = Back Right Door

    4 = Hood

    5 = Trunk

    ]]--
    doors = {
        frontLeftDoor = false,
        frontRightDoor = false,
        backLeftDoor = false,
        backRightDoor = false,
        hood = false,
        trunk = false,
    }
    local vehicleImage = "vehicle-1.png"
  
    if GetVehicleDoorAngleRatio(vehicle, 0) ~= 0 then
        doors.frontLeftDoor = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 1) ~= 0  then
        doors.frontRightDoor = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 2) ~= 0  then
        doors.backLeftDoor = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 3)  ~= 0 then
        doors.backRightDoor = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 4)  ~= 0 then
        doors.hood = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 5) ~= 0 then
        doors.trunk = true
    end
    vehicleImage = CheckVehicleDoorImage("vehicle-2.png", {"frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-3.png", {"frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-4.png", {"backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-5.png", {"backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-10.png", {"trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-11.png", {"hood"}, vehicleImage)


    vehicleImage = CheckVehicleDoorImage("vehicle-12.png", {"trunk", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-13.png", {"trunk", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-14.png", {"trunk", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-15.png", {"trunk", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-6.png", {"frontLeftDoor", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-20.png", {"hood", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-21.png", {"hood", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-22.png", {"hood", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-23.png", {"hood", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-28.png", {"hood", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-62.png", {"backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-37.png", {"frontLeftDoor",  "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-38.png", {"frontRightDoor",  "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-39.png", {"frontLeftDoor",  "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-40.png", {"frontRightDoor",  "backRightDoor"}, vehicleImage)

    vehicleImage = CheckVehicleDoorImage("vehicle-7.png", {"frontLeftDoor", "frontRightDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-8.png", {"frontLeftDoor", "frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-16.png", {"trunk", "frontRightDoor", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-24.png", {"hood", "frontRightDoor", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-29.png", {"hood", "trunk", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-30.png", {"hood", "trunk", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-31.png", {"hood", "trunk", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-32.png", {"hood", "trunk", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-41.png", {"frontLeftDoor",  "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-42.png", {"frontRightDoor",  "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-43.png", {"frontLeftDoor",  "backRightDoor", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-44.png", {"frontRightDoor",  "backLeftDoor", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-45.png", {"frontRightDoor",  "backLeftDoor", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-46.png", {"frontLeftDoor",  "backLeftDoor", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-47.png", {"frontRightDoor",  "backRightDoor", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-50.png", {"backRightDoor", "frontLeftDoor",  "hood"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-51.png", {"backLeftDoor", "frontRightDoor",  "hood"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-52.png", {"backLeftDoor", "frontLeftDoor",  "hood"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-53.png", {"backRightDoor", "frontRightDoor",  "hood"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-63.png", {"backLeftDoor", "backRightDoor", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-64.png", {"backLeftDoor", "backRightDoor", "hood"}, vehicleImage)    

    vehicleImage = CheckVehicleDoorImage("vehicle-9.png", {"frontLeftDoor", "frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-17.png", {"trunk", "frontRightDoor", "frontLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-18.png", {"trunk", "frontRightDoor", "frontLeftDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-25.png", {"hood", "frontRightDoor", "frontLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-26.png", {"hood", "frontRightDoor", "frontLeftDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-33.png", {"hood", "trunk", "frontRightDoor", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-48.png", {"backLeftDoor", "frontLeftDoor",  "backRightDoor", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-49.png", {"backLeftDoor", "frontRightDoor",  "backRightDoor", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-54.png", {"backRightDoor", "backLeftDoor", "frontLeftDoor",  "hood"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-55.png", {"backRightDoor", "backLeftDoor", "frontRightDoor",  "hood"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-56.png", {"backLeftDoor", "frontLeftDoor", "hood",  "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-57.png", {"backRightDoor", "frontRightDoor", "hood",  "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-58.png", {"backRightDoor", "frontLeftDoor", "hood",  "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-59.png", {"backLeftDoor", "frontRightDoor", "hood",  "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-65.png", {"backLeftDoor", "backRightDoor", "hood", "trunk"}, vehicleImage)

    vehicleImage = CheckVehicleDoorImage("vehicle-27.png", {"hood", "frontRightDoor", "frontLeftDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-19.png", {"trunk", "frontRightDoor", "frontLeftDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-34.png", {"hood", "trunk", "frontRightDoor", "frontLeftDoor",  "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-35.png", {"hood", "trunk", "frontRightDoor", "frontLeftDoor",  "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-60.png", {"backLeftDoor", "backRightDoor", "frontRightDoor", "hood",  "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("vehicle-61.png", {"backLeftDoor", "backRightDoor", "frontLeftDoor", "hood",  "trunk"}, vehicleImage)


    vehicleImage = CheckVehicleDoorImage("vehicle-36.png", {"hood", "trunk", "frontRightDoor", "frontLeftDoor",  "backRightDoor", "backLeftDoor"}, vehicleImage)
    nuiMessage("VEHICLE_DOORS", vehicleImage)  
end

RegisterNUICallback("vehicleDoors", function(data, cb)
    local vehicle = Vehicle
    local isDoorOpen = GetVehicleDoorAngleRatio(vehicle, data.value) ~= 0 
    if isDoorOpen then
        SetVehicleDoorShut(vehicle, data.value, true)
    else
        SetVehicleDoorOpen(vehicle, data.value)
    end
    Wait(500)
    CheckVehicleDoors()
end)

RegisterCommand(Config.HudSettingsCommand, function()
    OpenHudSettings()
end)



RegisterNetEvent(Config.HudSettingsEvent)
AddEventHandler(Config.HudSettingsEvent, function()
    OpenHudSettings()
end)



function windowToggle(window, door, vehicle)
    
    if DoesEntityExist(vehicle) then
        local isclosed = IsVehicleWindowIntact(vehicle,window)
        if GetIsDoorValid(vehicle, door) and isclosed then 
            RollDownWindow(vehicle, window)
        else
            RollUpWindow(vehicle, window)
        end
    end
end

RegisterNUICallback("toggleWindow", function(data, cb)

    TriggerServerEvent("mHud:ToggleWindow", data.window, data.door)
end)

RegisterNetEvent("mHud:SyncWindow")
AddEventHandler("mHud:SyncWindow", function(sender, window, door)
    local playerPed = GetPlayerPed(GetPlayerFromServerId(sender))
    if IsPedInAnyVehicle(playerPed, false) and DoesEntityExist(playerPed)  then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        windowToggle(window, door, vehicle)
    end
end)

RegisterNUICallback("toggleNeon", function(data, cb)
    local vehicle = Vehicle
    partyMode = false
    if data.type == "neon" then
        if IsVehicleNeonLightEnabled(vehicle, data.value) then
            SetVehicleNeonLightEnabled(vehicle, data.value, false)
        else
            SetVehicleNeonLightEnabled(vehicle, data.value, true)
        end
        CheckNeonEnabled()
    elseif data.type == "party" then
        PartyMode()
    elseif data.type == "all" then
        local toggle = true
        for i=0, 3 do
            if IsVehicleNeonLightEnabled(vehicle, i) then
                toggle = false                            
            end
        end
        for i=0, 3 do
            SetVehicleNeonLightEnabled(vehicle, i, toggle)
        end
        
    end
    cb("ok")
end)




local AllWeapons = json.decode('{"melee":{"dagger":"0x92A27487","bat":"0x958A4A8F","bottle":"0xF9E6AA4B","crowbar":"0x84BD7BFD","unarmed":"0xA2719263","flashlight":"0x8BB05FD7","golfclub":"0x440E4788","hammer":"0x4E875F73","hatchet":"0xF9DCBF2D","knuckle":"0xD8DF3C3C","knife":"0x99B507EA","machete":"0xDD5DF8D9","switchblade":"0xDFE37640","nightstick":"0x678B81B1","wrench":"0x19044EE0","battleaxe":"0xCD274149","poolcue":"0x94117305","stone_hatchet":"0x3813FC08"},"handguns":{"pistol":"0x1B06D571","pistol_mk2":"0xBFE256D4","combatpistol":"0x5EF9FEC4","appistol":"0x22D8FE39","stungun":"0x3656C8C1","pistol50":"0x99AEEB3B","snspistol":"0xBFD21232","snspistol_mk2":"0x88374054","heavypistol":"0xD205520E","vintagepistol":"0x83839C4","flaregun":"0x47757124","marksmanpistol":"0xDC4DB296","revolver":"0xC1B3C3D1","revolver_mk2":"0xCB96392F","doubleaction":"0x97EA20B8","raypistol":"0xAF3696A1"},"smg":{"microsmg":"0x13532244","smg":"0x2BE6766B","smg_mk2":"0x78A97CD0","assaultsmg":"0xEFE7E2DF","combatpdw":"0xA3D4D34","machinepistol":"0xDB1AA450","minismg":"0xBD248B55","raycarbine":"0x476BF155"},"shotguns":{"pumpshotgun":"0x1D073A89","pumpshotgun_mk2":"0x555AF99A","sawnoffshotgun":"0x7846A318","assaultshotgun":"0xE284C527","bullpupshotgun":"0x9D61E50F","musket":"0xA89CB99E","heavyshotgun":"0x3AABBBAA","dbshotgun":"0xEF951FBB","autoshotgun":"0x12E82D3D"},"assault_rifles":{"assaultrifle":"0xBFEFFF6D","assaultrifle_mk2":"0x394F415C","carbinerifle":"0x83BF0278","carbinerifle_mk2":"0xFAD1F1C9","advancedrifle":"0xAF113F99","specialcarbine":"0xC0A3098D","specialcarbine_mk2":"0x969C3D67","bullpuprifle":"0x7F229F94","bullpuprifle_mk2":"0x84D6FAFD","compactrifle":"0x624FE830"},"machine_guns":{"mg":"0x9D07F764","combatmg":"0x7FD62962","combatmg_mk2":"0xDBBD7280","gusenberg":"0x61012683"},"sniper_rifles":{"sniperrifle":"0x5FC3C11","heavysniper":"0xC472FE2","heavysniper_mk2":"0xA914799","marksmanrifle":"0xC734385A","marksmanrifle_mk2":"0x6A6C02E0"},"heavy_weapons":{"rpg":"0xB1CA77B1","grenadelauncher":"0xA284510B","grenadelauncher_smoke":"0x4DD2DC56","minigun":"0x42BF8A85","firework":"0x7F7497E5","railgun":"0x6D544C99","hominglauncher":"0x63AB0442","compactlauncher":"0x781FE4A","rayminigun":"0xB62D1F67"},"throwables":{"grenade":"0x93E220BD","bzgas":"0xA0973D5E","smokegrenade":"0xFDBC8A50","flare":"0x497FACC3","molotov":"0x24B17070","stickybomb":"0x2C3731D9","proxmine":"0xAB564B93","snowball":"0x787F0BB","pipebomb":"0xBA45E8B8","ball":"0x23C9F95C"},"misc":{"petrolcan":"0x34A67B97","fireextinguisher":"0x60EC506","parachute":"0xFBAB5776"}}')
local lastWeaponHash = false


CreateThread(function()
    while true do
        local playerPed = PlayerPed
        local weaponHash = GetSelectedPedWeapon(playerPed, true)
        if weaponHash then
            for key,value in pairs(AllWeapons) do
		        for keyTwo,valueTwo in pairs(AllWeapons[key]) do
                    if weaponHash == GetHashKey('weapon_'..keyTwo) and weaponHash ~= -1569615261 and lastWeaponHash ~= weaponHash then
                        lastWeaponHash = weaponHash
                        nuiMessage("SET_WEAPON_IMAGE", keyTwo)         
                        
                    end
                end
            end 
            if weaponHash == -1569615261 and lastWeaponHash ~= -1569615261  then
                lastWeaponHash = -1569615261                                       
                nuiMessage("SET_WEAPON_IMAGE", false)         

            end 
        end
        Wait(1700)
    end    
end)

local lastAmmo = false
local lastMaxAmmo = false

CreateThread(function()
    while true do
        local playerPed = PlayerPed
        local weaponHash = GetSelectedPedWeapon(playerPed, true)
        if weaponHash ~= -1569615261 then
            local _, ammo = GetAmmoInClip(playerPed, weaponHash)
            local maxammo = GetAmmoInPedWeapon(playerPed, weaponHash)
            if IsControlPressed(0, 24) or lastAmmo ~= ammo or  lastMaxAmmo ~= maxammo then
       
                nuiMessage("SET_WEAPON_AMMO", {
                    maxAmmo = maxammo-ammo, 
                    ammo = ammo
                })         
                lastAmmo = ammo
                lastMaxAmmo = maxammo
            end
            Wait(300)
        else
            Wait(900)
        end
    end
end)

CreateThread(function()
    while true do
        SetRadarZoom(1100)
        Wait(100)

    end
end)

CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    while true do
        Citizen.InvokeNative(0xF6E48914C7A8694E, minimap, "SETUP_HEALTH_ARMOUR")
        Citizen.InvokeNative(0xC3D0841A0CC546A6, 3)
        Citizen.InvokeNative(0xC6796A8FFA375E53)
        Citizen.InvokeNative(0xC6796A8FFA375E53)
        Wait(1000)

    end
end)

CreateThread(function()
    while true do
        if IsBigmapActive() then
            SetRadarBigmapEnabled(false, false)
        end
        Wait(2000)
    end
end)


function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num + 0.5 * mult)
end

local lastZone = nil
CreateThread(function()
    while true do
        local playerPed = PlayerPed
        local position = GetEntityCoords(playerPed)
		local var1, var2 = GetStreetNameAtCoord(position.x, position.y, position.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
        local zone = GetNameOfZone(position.x, position.y, position.z);
		local zoneLabel = GetLabelText(zone);
		hash1 = GetStreetNameFromHashKey(var1);
		hash2 = GetStreetNameFromHashKey(var2);
        local street2;
		street2 = zoneLabel;
        local heading = GetEntityHeading(playerPed);

        if hudSettings.compassBehaviour == "mouselook" then
            local camRot = GetGameplayCamRot(0)
			heading = tostring(round(360.0 - ((camRot.z + 360.0) % 360.0)))
        end
        for k, v in pairs(directions) do
            if (math.abs(heading - v) < 22.5) then
                heading = k;
                if (heading == 1) then
                    heading = 'N';
                    break;
                end

                break;
            end
        end
        nuiMessage("SET_LOCATION", {
            street = hash1,
			zone = street2,
            heading = heading,
        })
        Wait(1500)     
    end
end)

function FindNeareastLocation(locations)
    local closesDist = -1
    local foundCoords = false
    local coords = GetEntityCoords(PlayerPed)
    for _,v in pairs(locations) do
        dist = #(coords - v)
        if closesDist == -1 or dist < closesDist then
            closesDist = dist
            foundCoords = v 
        end
    end
    return foundCoords
end

RegisterNUICallback("OnInputFocus", function()
    if cursorEnabled then
        SetNuiFocusKeepInput(false)
    end
end)

RegisterNUICallback("OnInputFocusRemove", function()
    if cursorEnabled then
        SetNuiFocusKeepInput(true)
    end
end)

RegisterNUICallback('waypoint', function(data, cb)
    local coords = FindNeareastLocation(Config.QuickLocations[data.type])
    if coords then
        SetNewWaypoint(coords.x, coords.y)
    end
    cb("ok")
end)

CreateThread(function()
    while true do
        Wait(1000)
        local hours = GetClockHours()
        local minutes = GetClockMinutes()
        local string = 'AM'
        if Config.MilitaryTime == false then
            if hours == 0 or hours == 24 then
                hours = 12 
                
            elseif hours >= 13 then            
                string = 'PM'
                hours = hours - 12
            end
        end
        if hours < 10 then
            hours = '0'..hours
        end
        if minutes < 10 then
            minutes = '0'..minutes
        end
        local formattedText = hours .. ':'..minutes
        if Config.MilitaryTime == false then
            formattedText = formattedText ..' '..string
        end
        nuiMessage("UPDATE_CLOCK", formattedText)
    end
end)

if Config.EnableEngineToggle then
    local engineRunning = true
    function ToggleEngine()
        local playerPed = PlayerPed
        local vehicle = Vehicle
        if not DoesEntityExist(vehicle) then  return end
        if vehicle == 0 or GetPedInVehicleSeat(vehicle, -1) ~= playerPed then return end
        if GetIsVehicleEngineRunning(vehicle) then
            Config.Notification(Config.Notifications["ENGINE_OFF"].message, Config.Notifications["ENGINE_OFF"].type)
        else
            Config.Notification(Config.Notifications["ENGINE_ON"].message, Config.Notifications["ENGINE_ON"].type)
        end
        engineRunning = not GetIsVehicleEngineRunning(vehicle)
        if Config.ForceEngineOff then
            CreateThread(function()
                SetVehicleEngineOn(vehicle, engineRunning, false, true)

                while not engineRunning and DoesEntityExist(vehicle) do
                    SetVehicleEngineOn(vehicle, engineRunning, false, true)
                    Wait(100)
                end
            end)
        else
            SetVehicleEngineOn(vehicle, not GetIsVehicleEngineRunning(vehicle), false, true)
        end
    end

    if Config.EnableRegisterKeyMapping then
        RegisterCommand('engine', function()
            ToggleEngine()
        end)
        RegisterKeyMapping('engine', 'Toggle Engine', 'keyboard',  Config.VehicleEngineToggleKey)
    else
        CreateThread(function()
            while true do
                if alreadyInVehicle then
                    if IsControlJustPressed(0, Config.VehicleEngineToggleKey) then
                        ToggleEngine()
                    end
                else
                    Wait(1250)
                end
                Wait(0)
            end
        end)
    end
end
local lastCheckIsAlreadyEngineRunning = false
CreateThread(function()
    while true do
        Wait(1200)
        if alreadyInVehicle then
            local playerPed = PlayerPed
            local vehicle = Vehicle
            if DoesEntityExist(vehicle) then
         
                local isRunning = GetIsVehicleEngineRunning(vehicle)
                if isRunning ~= lastCheckIsAlreadyEngineRunning then
                    lastCheckIsAlreadyEngineRunning = isRunning
                    if isRunning then
                        nuiMessage("ENGINE_STATUS", true)
                    else
                        nuiMessage("ENGINE_STATUS", false)                                   
                    end
                end
            end
        end
    end
end)
