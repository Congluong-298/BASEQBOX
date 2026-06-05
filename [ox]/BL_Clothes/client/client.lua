QBCore = exports['qb-core']:GetCoreObject()
playerconnected = true 
local savedOutfit = nil 
tmpCamera = nil

local isBagVisible = true 

RegisterNUICallback('TatBalo', function(data)
    isBagVisible = not isBagVisible
    TriggerServerEvent("gin:server:HienBalo", isBagVisible) 
end)

function getSkinParts(componentId)
    local mapping = {
        [0] = {'face', 'face_1'},
        [1] = {'mask_1', 'mask_2'},
        [2] = {'hair_1', 'hair_2'},
        [3] = {'torso_1', 'torso_2'},
        [4] = {'pants_1', 'pants_2'},
        [5] = {'bags_1', 'bags_2'},
        [6] = {'shoes_1', 'shoes_2'},
        [7] = {'chain_1', 'chain_2'},
        [8] = {'tshirt_1', 'tshirt_2'},
        [9] = {'bproof_1', 'bproof_2'},
        [10] = {'decals_1', 'decals_2'},
        [11] = {'torso_1', 'torso_2'}
    }
    
    return table.unpack(mapping[componentId] or {'', ''})
end

function getPropParts(propId)
    local mapping = {
        [0] = {'helmet_1', 'helmet_2'},
        [1] = {'glasses_1', 'glasses_2'},
        [2] = {'ears_1', 'ears_2'},
        [6] = {'watches_1', 'watches_2'},
        [7] = {'bracelets_1', 'bracelets_2'},
    }
    
    return table.unpack(mapping[propId] or {'', ''})
end

function getAllClothes()
    local ped = PlayerPedId()
    local clothes = {}
    
    for category, mapping in pairs(componentMapping) do
        if mapping.prop then
            local currentIndex = GetPedPropIndex(ped, mapping.component)

           clothes[category] = {
               max = GetNumberOfPedPropDrawableVariations(ped, mapping.component),
               current = currentIndex,
               currentTexture = GetPedPropTextureIndex(ped, mapping.component),
               maxTextures = GetNumberOfPedPropTextureVariations(ped, mapping.component, currentIndex)
           }

        else
            local currentIndex = GetPedDrawableVariation(ped, mapping.component)
            
            clothes[category] = {
                max = GetNumberOfPedDrawableVariations(ped, mapping.component),
                current = currentIndex,
                currentTexture = GetPedTextureVariation(ped, mapping.component),
                maxTextures = GetNumberOfPedTextureVariations(ped, mapping.component, currentIndex)
            }

        end
    end
    return clothes
end



function toggleNuiFrame(shouldShow, category)
    if Config.Animation then
        PlayAnimation(Config.AnimationName, Config.AnimationName2)
    end
    getAllPriceClothes()
    SetNuiFocus(shouldShow, shouldShow)
    SendReactMessage('setVisible', shouldShow)

    if shouldShow then
        QBCore.Functions.TriggerCallback('clothes:isstaff', function(isStaff)
            SendReactMessage('setIsStaff', isStaff)
        end)

        SendReactMessage('SaveOutfit', Config.SaveOutfit)
        
        SendReactMessage('setBlackListClothes', Config.BlackList)
        SendReactMessage('setUrl', Config.Url)
        SendReactMessage('setExtension', Config.Extension)
        -- SendReactMessage('setServerLogo', Config.ServerLogo)
        SendReactMessage('setCategory', category)
        SendReactMessage('setDefaultPrice', Config.DefaultPrice)
        local playerPed = PlayerPedId()
        local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
        SendReactMessage('setGender', { isFemale = isFemale })
        local clothes = getAllClothes()
        SendReactMessage('setClothingData', clothes)
        SendReactMessage('setDefaultOutfit', Config.DefaultOutfit)
        SendReactMessage('setScreenshot', Config.UseScreenshot)
        SendReactMessage('setScreenshotUrl', Config.ScreenshotGetUrl)
        SendReactMessage('setServerName', Config.ServerName)
    end
end


function saveCurrentOutfit()
    local playerPed = PlayerPedId()
    local outfit = {
        components = {},
        props = {}
    }
    
    for i = 0, 11 do
        outfit.components[i] = {
            drawable = GetPedDrawableVariation(playerPed, i),
            texture = GetPedTextureVariation(playerPed, i),
            palette = GetPedPaletteVariation(playerPed, i)
        }
    end
    

    for i = 0, 7 do
        outfit.props[i] = {
            drawable = GetPedPropIndex(playerPed, i),
            texture = GetPedPropTextureIndex(playerPed, i)
        }
    end
    
    return outfit
end

function restoreOutfit(outfit)
    local playerPed = PlayerPedId()
    
    for component, data in pairs(outfit.components) do
        SetPedComponentVariation(playerPed, tonumber(component), data.drawable, data.texture, data.palette)
    end
    
    for prop, data in pairs(outfit.props) do
        if data.drawable == -1 then
            ClearPedProp(playerPed, tonumber(prop))
        else
            SetPedPropIndex(playerPed, tonumber(prop), data.drawable, data.texture, true)
        end
    end
end


RegisterNUICallback('hideFrame', function(_, cb)
    toggleNuiFrame(false)
    
    

    if savedOutfit then
        restoreOutfit(savedOutfit)
        savedOutfit = nil
    end
    restoreCamera()
    FreezeEntityPosition(PlayerPedId(), false)
    Wait(100)

    if Config.Animation then
        StopAnimTask(PlayerPedId(), Config.AnimationName, Config.AnimationName2, 2.0)
        ClearPedTasks(PlayerPedId())
    end

    if tmpCamera then
        DeleteEntity(tmpCamera)
    end

    cb({})
end)

RegisterNUICallback('getClothingData', function(data, cb)
  local clothingCounts = {
    tops = GetNumberOfPedDrawableVariations(PlayerPedId(), 11),     
    pants = GetNumberOfPedDrawableVariations(PlayerPedId(), 4),     
    shoes = GetNumberOfPedDrawableVariations(PlayerPedId(), 6),     
    accessories = GetNumberOfPedDrawableVariations(PlayerPedId(), 7)
  }
  
  cb(clothingCounts)
end)

RegisterNUICallback('changeClothing', function(data, cb)
    local ped = PlayerPedId()
    local category = data.category
    local index = data.index
    PlaySound()
    if componentMapping[category] then
        if componentMapping[category].prop then
            if Config.UseIllenium then
                exports['illenium-appearance']:setPedProps(ped, {
                    {
                        prop_id = componentMapping[category].component,
                        drawable = index,
                        texture = 0
                    }
                })
            else
                SetPedPropIndex(ped, componentMapping[category].component, index, 0, true)
            end
        else
            if Config.UseIllenium then
                exports['illenium-appearance']:setPedComponents(ped, {
                    {
                        component_id = componentMapping[category].component,
                        drawable = index,
                        texture = 0
                    }
                })
            else
                SetPedComponentVariation(ped, componentMapping[category].component, index, 0, 0)
            end
        end
    end

    local clothes = getAllClothes()
    SendReactMessage('setClothingData', clothes)
    
    cb({})
end)

RegisterNUICallback('changeClothingTexture', function(data, cb)
    local ped = PlayerPedId()
    local category = data.category
    local index = data.index
    local texture = data.texture
    PlaySound()
    
    if componentMapping[category] then
        if componentMapping[category].prop then
            if Config.UseIllenium then
                exports['illenium-appearance']:setPedProps(ped, {
                    {
                        prop_id = componentMapping[category].component,
                        drawable = index,
                        texture = texture
                    }
                })
            else
                SetPedPropIndex(ped, componentMapping[category].component, index, texture, true)
            end
        else
            if Config.UseIllenium then
                exports['illenium-appearance']:setPedComponents(ped, {
                    {
                        component_id = componentMapping[category].component,
                        drawable = index,
                        texture = texture
                    }
                })
            else   
                SetPedComponentVariation(ped, componentMapping[category].component, index, texture, 0)
            end
        end
    end

    local clothes = getAllClothes()
    SendReactMessage('setClothingData', clothes)
    
    cb({})
end)



function PlayAnimation(anim, animName)
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), anim, animName, 2.0, -2.0, -1, 1, 0, false, false, false)
end


function changeCamera(camera)
    if not Config.Camera[camera] then
        return
    end

    local coords, point = table.unpack(Config.Camera[camera])
    local reverseFactor = reverseCamera and -1 or 1

    if tmpCamera then
        local camCoords = GetOffsetFromEntityInWorldCoords(cache.ped, coords.x * reverseFactor, coords.y * reverseFactor, coords.z * reverseFactor)
        local camPoint = GetOffsetFromEntityInWorldCoords(cache.ped, point.x, point.y, point.z)

        SetCamCoord(tmpCamera, camCoords.x, camCoords.y, camCoords.z)
        PointCamAtCoord(tmpCamera, camPoint.x, camPoint.y, camPoint.z)
    else
        local camCoords = GetOffsetFromEntityInWorldCoords(cache.ped, coords.x * reverseFactor, coords.y * reverseFactor, coords.z * reverseFactor)
        local camPoint = GetOffsetFromEntityInWorldCoords(cache.ped, point.x, point.y, point.z)

        tmpCamera = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, 0.0, 49.0, false, 0)
        PointCamAtCoord(tmpCamera, camPoint.x, camPoint.y, camPoint.z)
        SetCamActiveWithInterp(tmpCamera, cameraHandle, 1000, 1, 1)
    end

    isCameraInterpolating = true
end

RegisterNUICallback('changeCamera', function(data, cb)
    changeCamera(data.camera)
    cb({})
end)

function createCameraForPlayer()
    local coords, point = vector3(0.3, 2.5, 0.2), vector3(0, 0, -0.05)
    local reverseFactor = reverseCamera and -1 or 1

    local camCoords = GetOffsetFromEntityInWorldCoords(cache.ped, coords.x * reverseFactor, coords.y * reverseFactor, coords.z * reverseFactor)
    local camPoint = GetOffsetFromEntityInWorldCoords(cache.ped, point.x, point.y, point.z)

    tmpCamera = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, 0.0, 49.0, false, 0)

    PointCamAtCoord(tmpCamera, camPoint.x, camPoint.y, camPoint.z)

    SetCamActiveWithInterp(tmpCamera, cameraHandle, 1000, 1, 1)

    isCameraInterpolating = true

    RenderScriptCams(true, true, 500, true, true)
end


RegisterNUICallback('resetPed', function(data, cb)
    if savedOutfit then
        restoreOutfit(savedOutfit)
    end
    cb({})
end)


RegisterNUICallback('rotatePed', function(data, cb)
    if data.direction == 'left' or data.direction == 'right' then
        local rotationAmount = data.direction == 'left' and -10.0 or 10.0
        local headingplayer = GetEntityHeading(PlayerPedId())
        SetEntityHeading(PlayerPedId(), headingplayer + rotationAmount)
        cb({})
    elseif data.direction == 'up' or data.direction == 'down' then
        local rotationAmount = data.direction == 'up' and -10.0 or 0
        local coords, point = vector3(0.3, 2.5, 0.2), vector3(0, 0, -0.05)
        local reverseFactor = reverseCamera and -1 or 1

        local camCoords = GetOffsetFromEntityInWorldCoords(cache.ped, coords.x * reverseFactor, coords.y * reverseFactor, coords.z * reverseFactor)
        local camPoint = GetOffsetFromEntityInWorldCoords(cache.ped, point.x, point.y, point.z)
        SetCamFov(tmpCamera, 49.0 + rotationAmount)
        cb({})
    end
end)

RegisterNUICallback('holdup', function(data, cb)
    if holdup then
        holdup = false
        ClearPedTasks(PlayerPedId())
    else
        holdup = true
        local dict = "missminuteman_1ig_2"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
        TaskPlayAnim(PlayerPedId(), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)

    end
    cb({})
end)

function restoreCamera()
    RenderScriptCams(false, true, 500, true, true)
    SetEntityVisible(PlayerPedId(), true, false) 
    if tmpCamera then
        DeleteEntity(tmpCamera)
    end
end 

RegisterNUICallback('purchaseClothes', function(data, cb)
    local playerPed = PlayerPedId()
    local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
    local sex = isFemale and "female" or "male"

    TriggerServerEvent('clothes:purchase', data.items, sex)

    cb({success = true})
end)

RegisterNUICallback('purchaseClothesoutfit', function(data, cb)
    local playerPed = PlayerPedId()
    local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
    local sex = isFemale and "female" or "male"

    TriggerServerEvent('clothes:purchaseClothesoutfit', data)

    cb({success = true})
end)

RegisterNUICallback('saveOutfit', function(data, cb)
    local outfitName = data.name
    local playerPed = PlayerPedId()
    local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
    local sex = isFemale and "female" or "male"

    TriggerServerEvent('clothes:saveOutfit', outfitName, sex)
    
    cb({success = true})
end)

RegisterNUICallback('loadOutfit', function(data, cb)
    local outfitId = data.outfitId
    ResetPed()

    if outfitId == nil then 
        if Config.DefaultOutfit then
            if Config.UseIllenium then
                local isFemale = IsPedModel(cache.ped, `mp_f_freemode_01`)
                local sex = isFemale and "female" or "male"
                if sex == "female" then
                    exports['illenium-appearance']:setPedComponents(cache.ped, Config.DefaultOutfitWoman.components)
                    exports['illenium-appearance']:setPedProps(cache.ped, Config.DefaultOutfitWoman.props)
                else
                    exports['illenium-appearance']:setPedComponents(cache.ped, Config.DefaultOutfit.components)
                    exports['illenium-appearance']:setPedProps(cache.ped, Config.DefaultOutfit.props)
                end

                local appearance = exports['illenium-appearance']:getPedAppearance(cache.ped)
                TriggerServerEvent('illenium-appearance:server:saveAppearance', appearance)
            else


                for _, data1 in pairs(Config.DefaultOutfit.components) do
                    local skinPart, skinColor = getSkinParts(data1.component_id)
                    if skinPart and skinPart ~= '' then
                        TriggerEvent('skinchanger:change', skinPart, data1.drawable)
                        TriggerEvent('skinchanger:change', skinColor, data1.texture)
                    end
                end

                for _, data in pairs(Config.DefaultOutfit.props) do
                    local propPart, propColor = getPropParts(data.prop_id)
                    if propPart and propPart ~= '' then
                        TriggerEvent('skinchanger:change', propPart, data.drawable)
                        TriggerEvent('skinchanger:change', propColor, data.texture)
                    end
                end


                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
            end

            Wait(100)

            TriggerServerEvent('clothes:defaultoutfit')
    
            if savedOutfit then
                savedOutfit = nil
                savedOutfit = saveCurrentOutfit()
            end
            cb({success = true})
            return
        end
    end


    local playerPed = PlayerPedId()
    local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
    local sex = isFemale and "female" or "male"

    QBCore.Functions.TriggerCallback('clothes:getOutfitById', function(outfit)
        if outfit then
            local outfitData = json.decode(outfit)
            if Config.UseIllenium then
                exports['illenium-appearance']:setPedComponents(cache.ped, outfitData.components)
                
                exports['illenium-appearance']:setPedProps(cache.ped, outfitData.props)
                local appearance = exports['illenium-appearance']:getPedAppearance(cache.ped)

                TriggerServerEvent('illenium-appearance:server:saveAppearance', appearance)
            else
                for componentId, data in pairs(outfitData.components) do
                    local skinPart, skinColor = getSkinParts(tonumber(componentId))
                    if skinPart and skinColor then
                        TriggerEvent('skinchanger:change', skinPart, data.drawable)
                        TriggerEvent('skinchanger:change', skinColor, data.texture)
                    end
                end
                for propId, data in pairs(outfitData.props) do
                    local propPart, propColor = getPropParts(tonumber(propId))
                    if propPart and propColor then
                        if data.drawable == -1 then
                            TriggerEvent('skinchanger:change', propPart, 0)
                            TriggerEvent('skinchanger:change', propColor, 0)
                        else
                            TriggerEvent('skinchanger:change', propPart, data.drawable)
                            TriggerEvent('skinchanger:change', propColor, data.texture)
                        end
                    end
                end

                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
            end
        else
            QBCore.Functions.Notify(Config.Notification.outfitnotfound, 'error')
        end
    end, outfitId, sex)
    
    Wait(500)
    
    if savedOutfit then
        savedOutfit = nil
        savedOutfit = saveCurrentOutfit()
    end

    cb({})
end)

Citizen.CreateThread(function()
    for _, coord in pairs(Config.Coords) do
        if coord.blips then
            local blip = AddBlipForCoord(coord.x, coord.y, coord.z)
            SetBlipSprite(blip, coord.blipsid)
            SetBlipScale(blip, Config.Blips.scale)
            SetBlipColour(blip, coord.blipcolor)
            SetBlipAsShortRange(blip, Config.Blips.shortRange)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(coord.BlipsName)
            EndTextCommandSetBlipName(blip)
        end
    end

    while true do
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        local isPlayerNearMarker = false

        for _, coord in pairs(Config.Coords) do
            local distance = GetDistanceBetweenCoords(coord.x, coord.y, coord.z, pCoords, true)

            if distance < 3.0 then
                isPlayerNearMarker = true

                if Config.DrawMarker.draw then
                    DrawMarker(Config.DrawMarker.type, coord.x, coord.y, coord.z , 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.DrawMarker.scale, Config.DrawMarker.scale, Config.DrawMarker.scale, Config.DrawMarker.color.r, Config.DrawMarker.color.g, Config.DrawMarker.color.b, Config.DrawMarker.color.a, false, true, 2, false, nil, nil, false)
                end 

                ShowHelpNotification(Config.ShowNotificationHelpMessage)

                if IsControlJustPressed(0, 38) then
                    FreezeEntityPosition(playerPed, true)
                    getOutfits()
                    savedOutfit = saveCurrentOutfit()
                    toggleNuiFrame(true, coord.category)
                    createCameraForPlayer()
                end
            end 
        end

        Citizen.Wait(isPlayerNearMarker and 0 or 1000)
    end
end)

function getOutfits()
    local playerPed = PlayerPedId()
    local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
    local sex = isFemale and "female" or "male"
    QBCore.Functions.TriggerCallback('clothes:getOutfits', function(outfits)
        SendReactMessage('setOutfits', outfits)
    end, sex)
end

RegisterNUICallback('deleteOutfit', function(data, cb)
    TriggerServerEvent('clothes:deleteOutfit', data.outfitId)
    cb({})
end)

RegisterNetEvent('clothes:getOutfits')
AddEventHandler('clothes:getOutfits', function(outfits)
    getOutfits()
end)

RegisterNUICallback('copyOutfit', function(data, cb)
    local playerPed = PlayerPedId()
    local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
    local sex = isFemale and "female" or "male"
    TriggerServerEvent('clothes:copyOutfit', data.outfitId, sex)
    cb({})
end)

RegisterNetEvent('clothes:uploadScreenshot')
AddEventHandler('clothes:uploadScreenshot', function(outfitId)
    local playerPed = PlayerPedId()
    local serverName = Config.ServerName
    local screenshotUrl = Config.ScreenshotUrl
    if Config.UseScreenshot then 
        exports['screenshot-basic']:requestScreenshotUpload(screenshotUrl .. '/' .. serverName .. '/' .. outfitId, 'files[]', function(data)
            local resp = json.decode(data)
        end)
    end 
end)


RegisterNUICallback('requestOutfitScreenshot', function(data, cb)
    TriggerEvent('clothes:uploadScreenshot', data.outfitId)
    cb({})
end)

RegisterNUICallback('exportOutfit', function(data, cb)
    local playerPed = PlayerPedId()
    local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
    local sex = isFemale and "female" or "male"
    
    if not data.outfitId then
        QBCore.Functions.Notify('ID de tenue invalide', 'error')
        cb({ success = false })
        return
    end
    
    TriggerServerEvent('clothes:exportOutfit', data.outfitId, sex)
    cb({ success = true })
end)




Citizen.CreateThread(function()
    while true do 
        if playerconnected then 
            local playerPed = PlayerPedId()
            local isFemale = IsPedModel(playerPed, `mp_f_freemode_01`)
            local sex = isFemale and "female" or "male"
            if sex == nil then 
                return
            end
            TriggerServerEvent('sex:loadPlayer', sex)
            Wait(10000)

        end 
    end 
end)

function ShowHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry("esxHelpNotification", '<FONT FACE="Oswald">' .. msg .. '</FONT>')
    if thisFrame then
        DisplayHelpTextThisFrame("esxHelpNotification", false)
    else
        BeginTextCommandDisplayHelp("esxHelpNotification")
        EndTextCommandDisplayHelp(0, false, beep == nil or beep, duration or -1)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(5000)
    TriggerServerEvent('BL_Clothes:server:UpdateBag')
end)