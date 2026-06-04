

function setVehData(vehicle)
    if Config.VehicleModes["sport"].changeHandling then
        SetVehicleEnginePowerMultiplier(vehicle, Config.VehicleModes["sport"].boostPower)
        SetVehicleEngineTorqueMultiplier(vehicle, Config.VehicleModes["sport"].boostPower)
    end
end

function resetVeh(vehicle)
    if Config.VehicleModes["sport"].changeHandling then
        SetVehicleEnginePowerMultiplier(vehicle,  1.0)
        SetVehicleEngineTorqueMultiplier(vehicle, 1.0)
    end
end


local lastDriftValues = {
    fInitialDragCoeff = 0,
    fDriveInertia  = 0,
    fSteeringLock  = 0,
    fTractionCurveMax  = 0,
    fTractionCurveMin  = 0,
    fTractionCurveLateral  = 0,
    fLowSpeedTractionLossMult  = 0,
}

function EnableDriftMode(vehicle)
    if Config.VehicleModes["drift"].changeHandling then
        local modifier = -1
    
        lastDriftValues = {
            fInitialDragCoeff = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDragCoeff"),
            fDriveInertia  = GetVehicleHandlingFloat(vehicle, "CHandlingData", 'fDriveInertia'),
            fSteeringLock  = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fSteeringLock"),
            fTractionCurveMax  = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionCurveMax"),
            fTractionCurveMin  = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionCurveMin"),
            fTractionCurveLateral  = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fTractionCurveLateral"),
            fLowSpeedTractionLossMult  = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fLowSpeedTractionLossMult"),
        }
        
        local addTofInitialDragCoeff = lastDriftValues.fInitialDragCoeff + 90.22
        local addTofDriveInertia =  lastDriftValues.fDriveInertia + 0.31
        local addTofSteeringLock = lastDriftValues.fSteeringLock + 22.0
        local addTofTractionCurveMax = lastDriftValues.fTractionCurveMax - 1.1
        local addTofTractionCurveMin = lastDriftValues.fTractionCurveMin - 0.4 
        local addTofTractionCurveLateral = lastDriftValues.fTractionCurveLateral + 2.5  
        local addTofLowSpeedTractionLossMult = lastDriftValues.fLowSpeedTractionLossMult - 0.57  
    
    
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDragCoeff', addTofInitialDragCoeff)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDriveInertia', addTofDriveInertia)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock', addTofSteeringLock)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveMax', addTofTractionCurveMax)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveMin', addTofTractionCurveMin)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveLateral', addTofTractionCurveLateral)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fLowSpeedTractionLossMult', addTofLowSpeedTractionLossMult)
    end

end

function DisableDriftMode(vehicle)
    if Config.VehicleModes["drift"].changeHandling then
        local removeFromfInitialDragCoeff = lastDriftValues.fInitialDragCoeff
        local removeFromfDriveInertia = lastDriftValues.fDriveInertia
        local removeFromfSteeringLock = lastDriftValues.fSteeringLock
        local removeFromfTractionCurveMax = lastDriftValues.fTractionCurveMax
        local removeFromfTractionCurveMin = lastDriftValues.fTractionCurveMin
        local removeFromfTractionCurveLateral = lastDriftValues.fTractionCurveLateral
        local removeFromfLowSpeedTractionLossMult = lastDriftValues.fLowSpeedTractionLossMult
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDragCoeff', removeFromfInitialDragCoeff)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDriveInertia', removeFromfDriveInertia)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock', removeFromfSteeringLock)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveMax', removeFromfTractionCurveMax)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveMin', removeFromfTractionCurveMin)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionCurveLateral', removeFromfTractionCurveLateral)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fLowSpeedTractionLossMult', removeFromfLowSpeedTractionLossMult)
        resetVeh(vehicle)
    end
end

RegisterNUICallback('setVehicleMode', function(data, cb)
    local type = data.type
    local vehicle = Vehicle
    if currentMode == type then
        return
    end
    if type == 'default' then
        if currentMode == 'drift' then
            DisableDriftMode(vehicle)
        end
        if currentMode == 'sport' then
            resetVeh(vehicle)
        end
        currentMode = type            
        local vehtype = GetVehicleType(vehicle)
        nuiMessage("IN_VEHICLE", {
            value = true,
            type = vehtype
        })  
        cb(true)
    else
        if Config.VehicleModes[type] then

            local allowed = false
            for k,v in pairs(Config.VehicleModes[type].allowedVehicles.classes) do
                if GetVehicleClass(vehicle) == v then
                    allowed = true
                end
            end
           
            for k,v in pairs(Config.VehicleModes[type].allowedVehicles.hash) do
                if GetEntityModel(vehicle) == v then
                    allowed = true
                end
            end
            if allowed then
                if Config.VehicleModes[type].itemCheck.enable then
                    local hasItem = TriggerCallback("mHud:DeleteItem", {
                        name = Config.VehicleModes[type].itemCheck.name,
                        reqAmount = Config.VehicleModes[type].itemCheck.reqAmount,
                    })
                    if not hasItem then            
                        Config.Notification(string.format(Config.Notifications["YOU_DONT_HAVE_ITEM"].message, Config.VehicleModes[type].itemCheck.label), Config.Notifications["YOU_DONT_HAVE_ITEM"].type)                    
                        cb(false)                    
                        return
                    end
                end
                if type == 'sport' then                
                    if currentMode == 'drift' then
                        DisableDriftMode(vehicle)
                    end
                    setVehData(vehicle)
                end
                if type == 'drift' then
                    if currentMode == 'sport' then
                        resetVeh(vehicle)
                    end
                    EnableDriftMode(vehicle)
                end
                currentMode = type        
                local vehtype = GetVehicleType(vehicle)
                nuiMessage("IN_VEHICLE", {
                    value = true,
                    type = vehtype
                })       
                cb(true)
    
            else
                cb(false)
            end
        end
    end
end)