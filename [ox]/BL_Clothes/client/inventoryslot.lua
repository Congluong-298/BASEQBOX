RegisterNetEvent('setPedComponent', function(components)
    if components.component_id == 53 then 
        return 
    end

    local playerPed = cache.ped or PlayerPedId()
    local compId = components.component_id
    local drawable = components.drawable or 0
    local texture = components.texture or 0

    local maxDrawable = GetNumberOfPedDrawableVariations(playerPed, compId)
    if tonumber(drawable) >= tonumber(maxDrawable)   then
        print(("❌ Drawable %s không hợp lệ cho component %s (max %s)"):format(drawable, compId, maxDrawable))
        return
    end
    print(compId, drawable)
    local maxTexture = GetNumberOfPedTextureVariations(playerPed, tonumber(compId), tonumber(drawable))
    print(texture, maxTexture  )
    if tonumber(texture) >= tonumber(maxTexture) then
        print(("❌ Texture %s không hợp lệ cho component %s drawable %s (max %s)"):format(texture, compId, drawable, maxTexture))
        return
    end

    -- ✅ Nếu hợp lệ thì tiếp tục
    local skinPart, skinColor = getSkinParts(compId)
    
    if Config.UseIllenium then
        if compId == 11 then
            if drawable == 15 then
                TorsoDefault()
            else
                exports["illenium-appearance"]:setPedComponent(playerPed, components)
                TriggerServerEvent('RefreshArmsAndTShirt')
            end
        else 
            exports["illenium-appearance"]:setPedComponent(playerPed, components)
        end

        local appearance = exports["illenium-appearance"]:getPedAppearance(playerPed)
        TriggerServerEvent('illenium-appearance:server:saveAppearance', appearance)
    end
end)

RegisterNetEvent('setPedProp', function(props) 

    if Config.UseIllenium then
        exports["illenium-appearance"]:setPedProp(PlayerPedId(), props)
    else
        local propName, propColor = getPropParts(props.prop_id)
        QBCore.Functions.TriggerCallback('esx_skin:getPlayerSkin', function(skin)
            skin[propName] = props.drawable
            skin[propColor] = props.texture
            TriggerEvent('skinchanger:loadClothes', skin)
            TriggerServerEvent('esx_skin:save', skin)
        end)
    end

    --ResetPedScreen()
   
end)


function TorsoDefault()
    local ped = PlayerPedId()
    local isFemale = IsPedModel(ped, `mp_f_freemode_01`)
    local sex = isFemale and "default_female" or "default_male"

    if Config.UseIllenium then
        for _, comp in ipairs(Config.DefaultClothes.torso.components) do
            exports["illenium-appearance"]:setPedComponent(ped, {
                component_id = comp.component,
                    drawable = comp[sex],
                    texture = 0
            })
        end
    else 
        for _, comp in ipairs(Config.DefaultClothes.torso.components) do
            TriggerEvent('skinchanger:change', "torso_1", comp.default_male)
        end
    end

end
 
local startPedScreen, clonedPed = false, nil

local playerPed = cache.ped
lib.onCache('ped', function(ped)
	playerPed = ped
end)

local function createPed(model, locationx, locationy, locationz)
    lib.requestModel(model, 1)
    return CreatePed(26, model, locationx, locationy, locationz, 0, false, false)
end

function PedScreenDelete()
    startPedScreen = false 
    
    if clonedPed and DoesEntityExist(clonedPed) then
        SetEntityAsMissionEntity(clonedPed, true, true)
        DeleteEntity(clonedPed)

        local timeout = 100
        while DoesEntityExist(clonedPed) and timeout > 0 do
            Wait(10)
            timeout = timeout - 1
        end
    end

    DisableIdleCamera(false)


    clonedPed = nil
end


function RenderCam()
    local totalTime = 1000 
    local elapsed = 0
    local startingPitch = GetGameplayCamRelativePitch() 
    local targetPitch = 0.0
    local rate = 1.0
    local pitchThreshold = 30.00  
    
    if math.abs(startingPitch + 7.0) < pitchThreshold then
        return
    end

    if LocalPlayer.state.invOpen then 
        if math.abs(startingPitch - targetPitch) > 0.01 then
            CreateThread(function()
                while elapsed < totalTime and startPedScreen do
                    Wait(3)
                    elapsed = elapsed + 10 
                    local progress = elapsed / totalTime
                    local currentPitch = (1.0 - progress) * startingPitch + progress * targetPitch
                    SetGameplayCamRelativePitch(currentPitch, rate)
                end
            end)
        end
    end
end

RegisterNetEvent('clothes:animPed')
AddEventHandler('clothes:animPed', function()
    local name = "michael_tux_fidget"
    local dict = "missmic4"
    
    lib.requestAnimDict(dict)
    TaskPlayAnim(clonedPed, dict, name, 5.0, 5.0, -1, 1)
    TaskPlayAnim(PlayerPedId(), dict, name, 5.0, 5.0, -1, 48)
    Wait(3000)
    ClearPedTasks(clonedPed)
    ClearPedTasks(PlayerPedId())
end)

function PedScreenCreate(animation, control, type, data)
    if not control then 
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if GetEntitySpeed(vehicle) * 3.5 > 80 then 
            return
        else 
            SetEntityNoCollisionEntity(clonedPed, vehicle, false)
        end 
    end

    SetGameplayCamRelativePitch(1.0, 1.0)
    PedScreenDelete()
    RenderCam()

    local screenX = GetDisabledControlNormal(0, 239)
    local screenY = GetDisabledControlNormal(0, 240)
    clonedPed = ClonePed(PlayerPedId())
    if animation.dict and animation.anim then
        lib.requestAnimDict(animation.dict)
    
        TaskPlayAnimAdvanced(
            clonedPed,
            animation.dict,
            animation.anim,
            GetEntityCoords(clonedPed).x,
            GetEntityCoords(clonedPed).y,
            GetEntityCoords(clonedPed).z,
            0.0, 0.0, GetEntityHeading(clonedPed),
            8.0,
            8.0, 
            -1,    
            1,    
            0.0,    
            0, 0    
        )
    end
    
    SetEntityCompletelyDisableCollision(clonedPed, false, true)
    SetEntityInvincible(clonedPed, true)
    NetworkSetEntityInvisibleToNetwork(clonedPed, false)
    SetBlockingOfNonTemporaryEvents(clonedPed, true)
    DisableIdleCamera(true)



    startPedScreen = true 
    CreateThread(function()
        local positionBuffer = {}
        local bufferSize, scaleWidth, upTempOffset, depth
        local screenCoordX, screenCoordY
        local slotsClothes = exports['ox_inventory']:getslotsclothes()

        if type ~= "animation" then
            depth = Config.PedDepth
            bufferSize = 1 
            scaleWidth = 0.50
            upTempOffset = -0.55
            if slotsClothes == 'middle' then
                screenCoordX, screenCoordY = 0.5, 0.450 
            elseif slotsClothes == 'left' then
                screenCoordX, screenCoordY = 0.2, 0.450 
            elseif slotsClothes == 'right' then
                screenCoordX, screenCoordY = 0.8, 0.450 
            end
        end

        while startPedScreen do 
            local world, normal
            if type == "animation" then 
                depth = data.depth
                bufferSize = data.bufferSize
                scaleWidth = data.scaleWidth
                upTempOffset = data.upTempOffset
                world, normal = GetWorldCoordFromScreenCoord(0.7003, 0.2587)
            else
                world, normal = GetWorldCoordFromScreenCoord(screenCoordX, screenCoordY)
            end
            local target = world + normal * depth
            local camRot = GetGameplayCamRot(2)
            local rotZ = camRot.z + 180.0

            SetEntityCoordsNoOffset(clonedPed, target.x, target.y, target.z, true, true, true)
            SetEntityRotation(clonedPed, 0.0, 0.0, rotZ, 2, true)
            local forward, right, up = GetEntityMatrix(clonedPed)
            SetEntityMatrix(clonedPed, forward, right * scaleWidth, up + vector3(0, 0, upTempOffset), target)
            if control then DisableAllControlActions(0) end
            
            Wait(0) 
        end
    end)
end

function ResetPedScreen()
    -- local wasInventoryOpen = LocalPlayer.state.invOpen
    -- PedScreenDelete()
    -- if wasInventoryOpen then
    --     if LocalPlayer.state.invOpen then
    --         PedScreenCreate({
    --             dict = "anim@amb@nightclub@peds@", 
    --             anim = "rcmme_amanda1_stand_loop_cop"
    --         })
    --     end
    -- end
end

RegisterNetEvent('refreshaandtshirt')
AddEventHandler('refreshaandtshirt', function(armsData, tShirtData)
    if Config.UseIllenium then
        if armsData then
            exports["illenium-appearance"]:setPedComponent(PlayerPedId(), {
                component_id = armsData.component_id,
                drawable = armsData.drawable,
                texture = armsData.texture
            })
        end

        if tShirtData then
            exports["illenium-appearance"]:setPedComponent(PlayerPedId(), {
                component_id = tShirtData.component_id,
                drawable = tShirtData.drawable,
                texture = tShirtData.texture
            })
        end
    else
        QBCore.Functions.TriggerCallback('esx_skin:getPlayerSkin', function(skin)
            if armsData then
                TriggerEvent('skinchanger:change', "arms", armsData.drawable)
            end
            
            if tShirtData then
                TriggerEvent('skinchanger:change', "torso_1", tShirtData.drawable)
                TriggerEvent('skinchanger:change', "torso_2", tShirtData.texture)
            end
            
            TriggerServerEvent('esx_skin:save', skin)
        end)
    end

    --ResetPedScreen()
end)

AddEventHandler('onResourceStop', function(resourceName)
    --PedScreenDelete()
end)

exports('ResetPedScreen', ResetPedScreen)
exports('PedScreenDelete', PedScreenDelete)
exports('PedScreenCreate', PedScreenCreate)
