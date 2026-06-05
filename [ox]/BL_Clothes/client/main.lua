local ox_inventory = exports.ox_inventory
local on = {}
local lastOutfitUsed = nil


function SendReactMessage(action, data)
	SendNUIMessage({
	  action = action,
	  data = data
	})
end

function getSkinParts(type)
	local parts = {
		[1] = {'mask_1', 'mask_2'},
		[4] = {'pants_1', 'pants_2'},
		[6] = {'shoes_1', 'shoes_2'},
		[8] = {'tshirt_1', 'tshirt_2'},
		[11] = {'torso_1', 'torso_2'},
		[9] = {'bproof_1', 'bproof_2'},
		[5] = {'bags_1', 'bags_2'},
		[3] = {'arms', 'arms_2'},
		[7] = {'chain_1', 'chain_2'},
	}
	return parts[type] and parts[type][1], parts[type] and parts[type][2]
end

function getPropParts(type)
	local parts = {
		[0] = {'helmet_1', 'helmet_2'},
		[1] = {'glasses_1', 'glasses_2'},
        [2] = {'ears_1', 'ears_2'},
		[6] = {'watches_1', 'watches_2'},
        [7] = {'bracelets_1', 'bracelets_2'}
    
	}
	return parts[type] and parts[type][1], parts[type] and parts[type][2]
end



exports('clothes', function(data)
    local ped = cache.ped

    ox_inventory:useItem(data, function(data)
        if data then
            if Config.UseCustomOXInventory == false then
                local clotheConfig = Config.DefaultClothes[data.name]
                on[data.name] = not on[data.name]

                if clotheConfig then
                    if on[data.name] then
                        playAnimationAndChange(ped, data, data.metadata.type, data.metadata.drawable, data.metadata.texture, false, true)
                    else
                        local isFemale = IsPedModel(ped, `mp_f_freemode_01`)

                        RequestAnimDict(Config.Clothes[data.name].dict)
                        while not HasAnimDictLoaded(Config.Clothes[data.name].dict) do
                            Citizen.Wait(100)
                        end
                
                        TaskPlayAnim(ped, Config.Clothes[data.name].dict, Config.Clothes[data.name].anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        Citizen.Wait(1500)

                        for _, comp in ipairs(clotheConfig.components) do
                            local defaultValue
                            if comp.default_male and comp.default_female then
                                defaultValue = isFemale and comp.default_female or comp.default_male
                            else
                                defaultValue = comp.default
                            end
                            
                            local componentData = {
                                name = data.name,
                                metadata = {
                                    type = comp.component,
                                    drawable = defaultValue,
                                    texture = 0
                                }
                            }
                            
                            playAnimationAndChange(ped, componentData, comp.component, defaultValue, 0, false, false)
                        end
                    end
                end
            else 

                for category, mapping in pairs(componentMapping) do
                    if mapping.itemname == data.name then
                        local component = mapping.component
                        local isProp = mapping.prop
                        local expectedDrawable = data.metadata.drawable
                        local expectedTexture = data.metadata.texture
                        local expectedSlot = mapping.clothesSlotID

                        if data.slot == expectedSlot then

                            QBCore.Functions.Notify("Bạn đã có mục này trong ô này.", 'error')
                            return

                        end
                
                        break
                    end
                end
                
                
                

                if Config.UseIllenium then
                    local component = nil
                    for category, mapping in pairs(componentMapping) do
                        if mapping.itemname == data.name then
                            component = mapping
                            break
                        end
                    end

                    if component then
                        if component.prop then
                            exports['illenium-appearance']:setPedProps(cache.ped, {
                                {
                                    prop_id = component.component,
                                    drawable = data.metadata.drawable,
                                    texture = data.metadata.texture
                                }
                            })
                        else
                            exports['illenium-appearance']:setPedComponents(cache.ped, {
                                {
                                    component_id = component.component,
                                    drawable = data.metadata.drawable,
                                    texture = data.metadata.texture
                                }
                            })
                        end
                        TriggerServerEvent('RefreshArmsAndTShirt')
                        local appearance = exports['illenium-appearance']:getPedAppearance(cache.ped)
                        TriggerServerEvent('illenium-appearance:server:saveAppearance', appearance)
                        --ResetPedScreen()
                    end
                else

                    local skinPart, skinColor = getSkinParts(data.metadata.type)
        
                    TriggerEvent('skinchanger:getData', function(components, maxVals)
                        for k, v in pairs(components) do
                            if v.name == skinPart then
                                TriggerEvent('skinchanger:change', skinPart, data.metadata.drawable)
                                TriggerEvent('skinchanger:change', skinColor, data.metadata.texture)
        
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    TriggerServerEvent('esx_skin:save', skin)
                                end)
                            end
                        end
                    end)
                end 

                --ResetPedScreen()
                TriggerServerEvent('RefreshArmsAndTShirt')
                if Config.UseCustomOXInventory then 
                    TriggerServerEvent('clothes:changeslotclothes', data.metadata, data.slot, data.name, data.label)
                    
                end
            end 
        end
    end)
end)
exports('accessories', function(data)
    local ped = cache.ped

    ox_inventory:useItem(data, function(data)
        if data then
            local clotheConfig = Config.DefaultClothes[data.name]
            on[data.name] = not on[data.name]

            if clotheConfig then
                if on[data.name] then
                    playAnimationAndChange(ped, data, data.metadata.type, data.metadata.drawable, data.metadata.texture, true, true)
                else
                    local isFemale = IsPedModel(ped, `mp_f_freemode_01`)

                    RequestAnimDict(Config.Clothes[data.name].dict)
                    while not HasAnimDictLoaded(Config.Clothes[data.name].dict) do
                        Citizen.Wait(100)
                    end
            
                    TaskPlayAnim(ped, Config.Clothes[data.name].dict, Config.Clothes[data.name].anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
                    Citizen.Wait(1500)
                    ClearPedTasks(ped)

                    for _, comp in ipairs(clotheConfig.components) do
                        if comp.prop then
                            local defaultValue
                            if comp.default_male and comp.default_female then
                                defaultValue = isFemale and comp.default_female or comp.default_male
                            else
                                defaultValue = comp.default
                            end
                            
                            local componentData = {
                                name = data.name,
                                metadata = {
                                    type = comp.component,
                                    drawable = defaultValue,
                                    texture = 0
                                }
                            }
                            playAnimationAndChange(ped, componentData, comp.component, defaultValue, 0, true, false)
                        end
                    end
                end
            end
        end
    end)
end)

function ResetPed()
    local ped = cache.ped
    if Config.UseCustomOXInventory then 
        TriggerServerEvent('clothes:DeleteClothes')
    end
    if Config.UseIllenium then
        local isFemale = IsPedModel(ped, `mp_f_freemode_01`)

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
end

RegisterNetEvent('clothes:resetPed')
AddEventHandler('clothes:resetPed', function()
    ResetPed()
    Wait(100)
    --ResetPedScreen()
end)


function updateSkinchanger(data, drawable, texture)

    local skinPart, skinColor = getSkinParts(data.metadata.type)
    local playerPed = cache.ped


    if skinPart and skinColor then

        if Config.UseIllenium then
            exports['illenium-appearance']:setPedComponents(cache.ped, {
                {
                    component_id = data.metadata.type,
                    drawable = drawable,
                    texture = texture
                }
            })
            
            local appearance = exports['illenium-appearance']:getPedAppearance(playerPed)

            TriggerServerEvent('illenium-appearance:server:saveAppearance', appearance)
            TriggerServerEvent('RefreshArmsAndTShirt')

        else

            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for k, v in pairs(components) do
                    if v.name == skinPart then
                        TriggerEvent('skinchanger:change', skinPart, drawable)
                        TriggerEvent('skinchanger:change', skinColor, texture)

                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end
            end)
        end 
    end
end



function playAnimationAndChange(ped, data, type, drawable, texture, prop, anim)

    if anim then
        RequestAnimDict(Config.Clothes[data.name].dict)
        while not HasAnimDictLoaded(Config.Clothes[data.name].dict) do
            Citizen.Wait(100)
        end

        TaskPlayAnim(ped, Config.Clothes[data.name].dict, Config.Clothes[data.name].anim, 8.0, -8, -1, 49, 0, 0, 0, 0)
        Citizen.Wait(1500)
    end

    if prop then
        updateSkinchangerAccessories(data, drawable, texture)
    else
        updateSkinchanger(data, drawable, texture)
    end

    ClearPedTasks(ped)

end

function updateSkinchangerAccessories(data, drawable, texture)
    local skinPart, skinColor = getPropParts(data.metadata.type)
    local playerPed = cache.ped

    if skinPart and skinColor then


        if Config.UseIllenium then
            exports['illenium-appearance']:setPedProps(playerPed, {
                {
                    prop_id = data.metadata.type,
                    drawable = drawable,
                    texture = texture
                }
            })
            local appearance = exports['illenium-appearance']:getPedAppearance(playerPed)

            TriggerServerEvent('illenium-appearance:server:saveAppearance', appearance)
            --ResetPedScreen()

        else
            TriggerEvent('skinchanger:getData', function(components, maxVals)
                for k, v in pairs(components) do
                    if v.name == skinPart then
                        TriggerEvent('skinchanger:change', skinPart, drawable)
                        TriggerEvent('skinchanger:change', skinColor, texture)

                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end
                end

                --ResetPedScreen()
            end)
        end 
    end
end



exports('useClothes', function(data)
    return true
end)


function PlaySound()
    local audioId
    local Library = "HUD_FRONTEND_DEFAULT_SOUNDSET"
    local Sound = "SELECT"
    local IsLooped = false 
    if Config.EnableSound then 
        if not IsLooped then
            PlaySoundFrontend(-1, Sound, Library, true)
        else
            if not audioId then
                Citizen.CreateThread(function()
                    audioId = GetSoundId()
                    PlaySoundFrontend(audioId, Sound, Library, true)
                    Citizen.Wait(0.01)
                    StopSound(audioId)
                    ReleaseSoundId(audioId)
                    audioId = nil
                end)
            end
        end
    end 
end
    
RegisterNetEvent('clothes:getPrice')
AddEventHandler('clothes:getPrice', function()
    getAllPriceClothes()
end)

function getAllPriceClothes()
    QBCore.Functions.TriggerCallback('clothes:getAllPriceClothes', function(priceClothes)
        SendReactMessage('setPriceClothes', priceClothes)
    end)
end

local isStaff = false

QBCore.Functions.TriggerCallback('clothes:isstaff', function(result)
    isStaff = result
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000) 
        QBCore.Functions.TriggerCallback('clothes:isstaff', function(result)
            isStaff = result
        end)
    end
end)

RegisterNUICallback('handleClothingRightClick', function(data, cb)
    if not isStaff then 
        cb({})
        return 
    end

    local input = lib.inputDialog('Set Price', {
        {
            type = 'number',
            label = 'Price',
            description = 'Enter the price for this item',
            required = true,
            min = 1
        }
    })
    
    if input then
        local price = input[1]
        if data.sex == "male" then
            TriggerServerEvent('clothes:setPrice', data.index, data.component, price, 0, data.prop)
        else
            TriggerServerEvent('clothes:setPrice', data.index, data.component, price, 1, data.prop)
        end
    end

    cb({})
end)

RegisterNetEvent('clothes:refreshClothes')
AddEventHandler('clothes:refreshClothes', function(clothesList)
    for _, data in pairs(clothesList) do
        if type(data) == "table" and data.component_id then  
            local componentId = data.component_id
            local drawable = data.drawable
            local texture = data.texture
            local propId = data.prop_id

            if propId == false then 
                exports['illenium-appearance']:setPedComponents(cache.ped, {
                    {
                        component_id = componentId,
                        drawable = drawable,
                        texture = texture
                    }
                })
            else
                exports['illenium-appearance']:setPedProps(cache.ped, {
                    {
                        prop_id = componentId,
                        drawable = drawable,
                        texture = texture
                    }
                })
            end

            local appearance = exports['illenium-appearance']:getPedAppearance(cache.ped)
            TriggerServerEvent('illenium-appearance:server:saveAppearance', appearance)
        end
    end
end)

exports('bag', function(data)

    exports.ox_inventory:useItem(data, function(data)
        if data then
            local item = data.name
            local count = data.count
            local metadata = data.metadata
            local player = data.player
            local itemslot = data.slot
            local pass = false

            for _, data in pairs(Config.DataBag) do
                if data.index == metadata.drawable then
                    pass = true
                end
            end
            if pass then
                for category, mapping in pairs(componentMapping) do
                    if mapping.itemname == item then
                        if mapping.clothesSlotID == itemslot then
                            if metadata.token then
                                exports.ox_inventory:closeInventory()
                                Wait(200)
                                success = exports.ox_inventory:openInventory('stash', 'bag_' .. metadata.token)
                                if not success then
                                    TriggerServerEvent('clothes:createbag', metadata.token, metadata.drawable)
                                end
                            else 
                                local token = math.random(1, 1000000)
                                metadata.token = token
                                TriggerServerEvent('clothes:createBag', item, count, metadata, player, itemslot)
                            end
                        else 
                            QBCore.Functions.Notify("Veuillez mettre le sac sur vous", 'error')
                        end
                    end
                end
            else 
                QBCore.Functions.Notify("Ce sac n'a pas de capiciter de stockage", 'error')
            end
        end
    end)
end)
