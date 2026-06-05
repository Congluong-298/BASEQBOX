PlayerSex = {}
RegisterServerEvent('clothes:changeslotclothes')
AddEventHandler('clothes:changeslotclothes', function(metadata, slot, name, label)
    local player = QBCore.Functions.GetPlayer(source)
    if not player or not player.PlayerData then
        return
    end

    local componentIndex = -1
    for i, componentName in ipairs(clothesComponentNames) do
        if componentName == name then
            componentIndex = i
            break
        end
    end

    if componentIndex == -1 then
        return
    end

    local slotID = clothesSlotID[componentIndex]

    local itemInSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, slotID)

    if itemInSlot and json.encode(itemInSlot.metadata) == json.encode(metadata) then
        TriggerClientEvent('QBCore:Notify', player.PlayerData.source, 'Bạn đã có mặt hàng này trên người', 'error')
        return
    end

    exports.ox_inventory:RemoveItem(player.PlayerData.source, name, 1, metadata, slotID)

    if itemInSlot and itemInSlot.name then
        local oldItemName = itemInSlot.name
        local oldItemMetadata = itemInSlot.metadata or {}

        exports.ox_inventory:RemoveItem(player.PlayerData.source, oldItemName, 1, oldItemMetadata, slotID)

        Wait(200)

        exports.ox_inventory:AddItem(player.PlayerData.source, oldItemName, 1, oldItemMetadata)
    end

    exports.ox_inventory:AddItem(player.PlayerData.source, name, 1, metadata, slotID)

    GetPlayerClothesAndStock(player.PlayerData.source)
    TriggerClientEvent('RefreshArmsAndTShirt', player.PlayerData.source)
end)


local isProcessing = {} 
local isMonitoring = {} 



local UseExports = Config.UseExports
local canCC


local defaultClothingWoman = {
    [1] = { draw = 0, text = 0 },
    [2] = { draw = -1, text = -1 },
    [3] = { draw = -1, text = -1 },
    [4] = { draw = -1, text = -1 },
    [5] = { draw = 9, text = 0 },
    [6] = { draw = 15, text = 0 },
    [7] = { draw = 15, text = 0 },
    [8] = { draw = 0, text = 0 },
    [9] = { draw = -1, text = -1 },
    [10] = { draw = -1, text = -1 },
    [11] = { draw = 0, text = 0 },
    [12] = { draw = 15, text = 0 },
    [13] = { draw = 35, text = 0 },
    [14] = { draw = 15, text = 0 },
    [15] = { draw = 15, text = 0 }
}

local defaultClothingMen = {
    [1] = { draw = 0, text = 0 },
    [2] = { draw = -1, text = -1 },
    [3] = { draw = -1, text = -1 },
    [4] = { draw = -1, text = -1 },
    [5] = { draw = 9, text = 1 },
    [6] = { draw = 15, text = 0 },
    [7] = { draw = 15, text = 0 },
    [8] = { draw = 0, text = 0 },
    [9] = { draw = -1, text = -1 },
    [10] = { draw = -1, text = -1 },
    [11] = { draw = 15, text = 0 },
    [12] = { draw = 61, text = 0 },
    [13] = { draw = 34, text = 0 },
    [14] = { draw = 15, text = 0 },
    [15] = { draw = 15, text = 0 }
}
local BlockedSlots = {
    [6] = true, [7] = true, [8] = true, [9] = true,
    [10] = true, [11] = true, [12] = true, [13] = true,
    [16] = true, [18] = true, [19] = true, [20] = true, [21] = true
}
local checkMovingItems = exports.ox_inventory:registerHook('swapItems', function(payload)
    local source_ = payload.source
    local action = payload.action
    local czSlotsfrom = payload.fromSlot.slot
    local czSlots = payload.toSlot
    local metadata = payload.fromSlot.metadata
    local itemName = payload.fromSlot.name
    if type(payload.toInventory) == "number" then
        if BlockedSlots[payload.toSlot] then
            if metadata.sex and metadata.sex ~= PlayerSex[source_] then
                TriggerClientEvent('QBCore:Notify', source_, 'Không thể di chuyển vật phẩm khác giới tính vào slot này!')
                return false
            end
        end
    end


    if type(payload.toInventory) ~= "number" then
        return true
    end
    if action == 'swap' then
        if czSlotsfrom ~= nil then 
            if (czSlots.slot >= 45 and czSlots.slot <= 60 and czSlots.slot == componentMapping.clothes.clothesSlotID) or
            (czSlotsfrom >= 45 and czSlotsfrom <= 60 and czSlotsfrom == componentMapping.clothes.clothesSlotID )  then
                TriggerClientEvent('QBCore:Notify', source_, Config.Notification.cannotechange)
                return false
            end 
        end 
    end

    if czSlots == Config.CamSlotUpdate then 
        return false
    end


    if metadata.sex and metadata.sex ~= PlayerSex[source_] then
        for index, searchingClothingName in pairs(componentMapping) do
            if czSlots == searchingClothingName.clothesSlotID then
                TriggerClientEvent('QBCore:Notify', source_, Config.Notification.cannotcarry)
                return false
            end
        end
    end

    
    for _, mapping in pairs(componentMapping) do
        if czSlots == mapping.clothesSlotID then
            if itemName ~= mapping.itemname then
                TriggerClientEvent('QBCore:Notify', source_, Config.Notification.reservedto .. mapping.label)
                return false
            end
        end
    end
     
    if czSlotsfrom == componentMapping.clothes.clothesSlotID then 
        ClothesMoved(source_, czSlots)
    end 

    if czSlots == componentMapping.clothes.clothesSlotID then 
        if metadata.sex == PlayerSex[source_] then 
            ClothesMovedToGood(source_)
        else 
            return false
        end
    end


    if action == 'move' then
        
        Citizen.CreateThread(function()

            if czSlots >= Config.MinClothesSlot and czSlots <= Config.MaxClothesSlot then
                if czSlots == componentMapping.clothes.clothesSlotID then 
                    return
                end
                GetPlayerClothesAndStock(source_)
            end
     
            if czSlotsfrom >= Config.MinClothesSlot and czSlotsfrom <= Config.MaxClothesSlot then
                if czSlotsfrom == componentMapping.clothes.clothesSlotID then 
                    return
                end
                GetPlayerClothesAndStock(source_)
            end
        end)


    end
    

    if (action == 'swap') then
        local fromSlotMoved = payload.fromSlot.slot
        local toSlotMoved = payload.toSlot.slot

        local CurrentItemNames = { payload.fromSlot.name, payload.toSlot.name }
        local CurrentItemMetadata = { payload.fromSlot.metadata, payload.toSlot.metadata }

        local cItemMoved = false
        local cItemMovedIndex = -1

        local cSlotToDetect = false
        local cSlotToIndex = -1

        local cSlotFromDetect = false
        local cSlotFromIndex = -1

        for index, searchingClothingName in ipairs(clothesComponentNames) do
            if CurrentItemNames[1] == searchingClothingName or CurrentItemNames[2] == searchingClothingName then
                cItemMoved = true
                cItemMovedIndex = index
                break
            end
        end

        for index, searchingClothingSlot in ipairs(clothesSlotID) do
            if toSlotMoved == searchingClothingSlot then
                cSlotToDetect = true
                cSlotToIndex = index
                break
            end
        end

        for index, searchingClothingSlot in ipairs(clothesSlotID) do
            if fromSlotMoved == searchingClothingSlot then
                cSlotFromDetect = true
                cSlotFromIndex = index
                break
            end
        end

        local isComponent
        if cItemMovedIndex == 2 or cItemMovedIndex == 4 or cItemMovedIndex == 3 or cItemMovedIndex == 10 or cItemMovedIndex == 9 then
            isComponent = false
        else
            isComponent = true
        end

        if (cItemMoved) then
            if (UseExports) then
                canCC = Player(source_).state.canChangeClothes
            else
                canCC = true
            end

            if(CurrentItemNames[1] == CurrentItemNames[2]) then
                if (cSlotFromIndex == cItemMovedIndex) then
                    if (canCC) then
                        if (isComponent) then
                            if clothesComponentNames[cItemMovedIndex] == 'cloth_bags' then
                                local suc = BagAdd(source_, CurrentItemMetadata[1], false)
                                if suc then
                                    local suc2 = BagAdd(source_, CurrentItemMetadata[2], true)
                                    if suc2 == false then
                                        return false
                                    end
                                else
                                    return false
                                end
                            end
                            local components = {
                                texture = CurrentItemMetadata[2].texture,
                                drawable = CurrentItemMetadata[2].drawable,
                                component_id = clothesComponentID[cItemMovedIndex]
                            }
                            TriggerClientEvent('setPedComponent', source_, components)
                        else
                            local props = {
                                texture = CurrentItemMetadata[2].texture,
                                drawable = CurrentItemMetadata[2].drawable,
                                prop_id = clothesComponentID[cItemMovedIndex]
                            }
                            TriggerClientEvent('setPedProp', source_, props)
                        end
                        TriggerClientEvent('savePlayer', source_)
                    else
                        return false
                    end
                elseif(cSlotToIndex == cItemMovedIndex) then
                    if (canCC) then
                        if (isComponent) then
                            if clothesComponentNames[cItemMovedIndex] == 'cloth_bags' then
                                local suc = BagAdd(source_, CurrentItemMetadata[2], false)
                                if suc then
                                    local suc2 = BagAdd(source_, CurrentItemMetadata[1], true)
                                    if suc2 == false then
                                        return false
                                    end
                                else
                                    return false
                                end
                            end
                            local components = {
                                texture = CurrentItemMetadata[1].texture,
                                drawable = CurrentItemMetadata[1].drawable,
                                component_id = clothesComponentID[cItemMovedIndex]
                            }
                            TriggerClientEvent('setPedComponent', source_, components)
                        else
                            local props = {
                                texture = CurrentItemMetadata[1].texture,
                                drawable = CurrentItemMetadata[1].drawable,
                                prop_id = clothesComponentID[cItemMovedIndex]
                            }
                            TriggerClientEvent('setPedProp', source_, props)
                        end

                        TriggerClientEvent('savePlayer', source_)
                    else
                        return false
                    end
                end
            else
                return false
            end
        else
            if (cSlotFromDetect or cSlotToDetect) then
                return false
            end
        end
    elseif (action == 'move') then
        local fromSlotMoved = payload.fromSlot.slot
        local toSlotMoved = payload.toSlot

        local CurrentItemName = payload.fromSlot.name
        local CurrentItemMetadata = payload.fromSlot.metadata

        local MovedCitem = false
        local MovedCitemIndex = -1


        local MovedToCslot = false
        local MovedToCslotIndex = -1

        local MovedFromCslot = false

        for index, searchingClothingName in ipairs(clothesComponentNames) do
            if CurrentItemName == searchingClothingName then
                MovedCitem = true
                MovedCitemIndex = index
                break
            end
        end

        local isComponent
        if MovedCitemIndex == 2 or MovedCitemIndex == 4 or MovedCitemIndex == 3 or MovedCitemIndex == 10 or MovedCitemIndex == 9 then
            isComponent = false
        else
            isComponent = true
        end

        for index, searchingClothingSlot in ipairs(clothesSlotID) do
            if toSlotMoved == searchingClothingSlot then
                MovedToCslot = true
                MovedToCslotIndex = index
                break
            end
        end

        for _, searchingClothingSlot in ipairs(clothesSlotID) do
            if fromSlotMoved == searchingClothingSlot then
                MovedFromCslot = true
                break
            end
        end

        if (MovedCitem) then
            if (UseExports) then
                canCC = Player(source_).state.canChangeClothes
            else
                canCC = true
            end
            if (MovedToCslot) then
                if (MovedCitemIndex == MovedToCslotIndex) then
                    if (canCC) then
                        if (isComponent) then
                            if clothesComponentNames[MovedCitemIndex] == 'cloth_bags' then
                                local suc = BagAdd(source_, CurrentItemMetadata, true)
                                if suc == false then
                                    return false
                                end
                            end
                            local components = {
                                texture = CurrentItemMetadata.texture,
                                drawable = CurrentItemMetadata.drawable,
                                component_id = clothesComponentID[MovedCitemIndex]
                            }
                            TriggerClientEvent('setPedComponent', source_, components)
                        else
                            local props = {
                                texture = CurrentItemMetadata.texture,
                                drawable = CurrentItemMetadata.drawable,
                                prop_id = clothesComponentID[MovedCitemIndex]
                            }
                            TriggerClientEvent('setPedProp', source_, props)
                        end
                        TriggerClientEvent('savePlayer', source_)
                    else
                        return false
                    end
                else
                    if payload.toType ~= 'player' then

 
                        return true
                    else
                        return false
                    end
                end
            elseif (MovedFromCslot) then
                if (payload.fromInventory ~= payload.toInventory and payload.fromType == 'player' and payload.toType == 'player') then
                    local fromSource = payload.fromInventory
                    local ped = GetPlayerPed(fromSource)
                    local hash = GetEntityModel(ped)
                    if (hash == 1885233650) then
                        if (isComponent) then
                            if clothesComponentNames[MovedCitemIndex] == 'cloth_bags' then
                                local suc = BagAdd(fromSource, CurrentItemMetadata, false)
                                if suc == false then
                                    return false
                                end
                            end

                            local components = Config.DefaultClothes[clothesComponentNames[MovedCitemIndex]].components
                            TriggerClientEvent('setPedComponent', fromSource, components)
                        else
                            local props = {
                                texture = defaultClothingMen[MovedCitemIndex].text,
                                drawable = defaultClothingMen[MovedCitemIndex].draw,
                                prop_id = clothesComponentID[MovedCitemIndex]
                            }
                            TriggerClientEvent('setPedProp', fromSource, props)
                        end
                    else
                        if (isComponent) then
                            if clothesComponentNames[MovedCitemIndex] == 'cloth_bags' then
                                local suc = BagAdd(fromSource, CurrentItemMetadata, false)
                                if suc == false then
                                    return false
                                end
                            end
                            local components = {
                                texture = defaultClothingWoman[MovedCitemIndex].text,
                                drawable = defaultClothingWoman[MovedCitemIndex].draw,
                                component_id = clothesComponentID[MovedCitemIndex]
                            }
                            TriggerClientEvent('setPedComponent', fromSource, components)
                        else
                            local props = {
                                texture = defaultClothingWoman[MovedCitemIndex].text,
                                drawable = defaultClothingWoman[MovedCitemIndex].draw,
                                prop_id = clothesComponentID[MovedCitemIndex]
                            }
                            TriggerClientEvent('setPedProp', fromSource, props)
                        end
                    end
                    TriggerClientEvent('savePlayer', fromSource)

                    

                    return true
                end
                if (canCC) then
                    local ped = GetPlayerPed(source_)
                    local hash = GetEntityModel(ped)
                    if (hash == 1885233650) then
                        if (isComponent) then
                            if clothesComponentNames[MovedCitemIndex] == 'cloth_bags' then
                                local suc = BagAdd(source_, CurrentItemMetadata, false)
                                if suc == false then
                                    return false
                                end
                            end
                            local components = {
                                texture = defaultClothingMen[MovedCitemIndex].text,
                                drawable = defaultClothingMen[MovedCitemIndex].draw,
                                component_id = clothesComponentID[MovedCitemIndex]
                            }
                            TriggerClientEvent('setPedComponent', source_, components)
                        else
                            local props = {
                                texture = defaultClothingMen[MovedCitemIndex].text,
                                drawable = defaultClothingMen[MovedCitemIndex].draw,
                                prop_id = clothesComponentID[MovedCitemIndex]
                            }
                            
                            TriggerClientEvent('setPedProp', source_, props)
                        end
                    else
                        if (isComponent) then
                            if clothesComponentNames[MovedCitemIndex] == 'cloth_bags' then
                                local suc = BagAdd(source_, CurrentItemMetadata, false)
                                if suc == false then
                                    return false
                                end
                            end
                            local components = {
                                texture = defaultClothingWoman[MovedCitemIndex].text,
                                drawable = defaultClothingWoman[MovedCitemIndex].draw,
                                component_id = clothesComponentID[MovedCitemIndex]
                            }
                            TriggerClientEvent('setPedComponent', source_, components)
                        else
                            local props = {
                                texture = defaultClothingWoman[MovedCitemIndex].text,
                                drawable = defaultClothingWoman[MovedCitemIndex].draw,
                                prop_id = clothesComponentID[MovedCitemIndex]
                            }
                            TriggerClientEvent('setPedProp', source_, props)
                        end
                    end
                    TriggerClientEvent('savePlayer', source_)
                else
                    return false
                end
            end
        else
            if (MovedToCslot) then
                return false
            end
        end
    
    end
end, {
    print = false,
})


function BagAdd(source, itemMetadata, isEquip)

    Citizen.SetTimeout(100, function()
        local slotData = exports.ox_inventory:GetSlot(source, Config.SlotBalo) 
        if itemMetadata then 
            if slotData and slotData.name then
                local drawable = slotData.metadata and slotData.metadata.drawable 
                if drawable and Config.TuiDo[drawable] then 
                    
                    local so_Slot = Config.TuiDo[drawable]["so_Slot"]
                    local so_Ky = Config.TuiDo[drawable]["so_Ky"]
                    exports.ox_inventory:SetSlotCount(source, so_Slot) 
                    exports.ox_inventory:SetMaxWeight(source, so_Ky)
                else
                    exports.ox_inventory:SetSlotCount(source, Config.MaxTuiDo) 
                    exports.ox_inventory:SetMaxWeight(source, Config.MaxCanNang)
                end
            else
                exports.ox_inventory:SetSlotCount(source, Config.MaxTuiDo) 
                exports.ox_inventory:SetMaxWeight(source, Config.MaxCanNang)
            end
        else 
            exports.ox_inventory:SetSlotCount(source, Config.MaxTuiDo)
            exports.ox_inventory:SetMaxWeight(source, Config.MaxCanNang)
        end 
        TriggerClientEvent('gin:dong:inven', source)
    end)
end


RegisterNetEvent('gin:server:HienBalo', function(isBagVisible)
    local source_ = source
    if not source_ then return end
    local components2 = {}
    Citizen.SetTimeout(100, function()
        local slotData = exports.ox_inventory:GetSlot(source_, Config.SlotBalo) -- Lấy dữ liệu slot 19
        -- print(isBagVisible)
        if slotData then
            local drawable = slotData.metadata
            if isBagVisible then 
                components2 = {
                    texture = drawable.texture,
                    drawable = drawable.drawable,
                    component_id = 5
                }
            else 
                components2 = {
                    texture = 0,
                    drawable = 0,
                    component_id = 5
                }
            end 
        end
        TriggerClientEvent('setPedComponent', source_, components2)
    end)
end)



local function onPlayerLoaded(source)
    local bagSlot = exports.ox_inventory:GetSlot(source, Config.SlotBalo)
    if bagSlot then
        BagAdd(source, bagSlot.metadata, true)
    else 
        BagAdd(source, nil, true)
    end

end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    Wait(1000)

    local players = GetPlayers() 
    for _, playerId in ipairs(players) do
        print("PlayerID:", playerId)
        onPlayerLoaded(tonumber(playerId)) 
    end
end)


RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
    onPlayerLoaded(source)
end)


RegisterNetEvent('BL_Clothes:server:UpdateBag', function()
    local src = source
    local bagSlot = exports.ox_inventory:GetSlot(src, Config.SlotBalo)
    if bagSlot then
        BagAdd(src, bagSlot.metadata, true)
    else 
        BagAdd(src, nil, true)
    end
end)

RegisterServerEvent('RefreshArmsAndTShirt')
AddEventHandler('RefreshArmsAndTShirt', function()
    local player = QBCore.Functions.GetPlayer(source)
    if not player or not player.PlayerData then
        return
    end

    local armsSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, componentMapping.gloves.clothesSlotID)
    local tShirtSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, componentMapping.shirt.clothesSlotID)

    TriggerClientEvent('refreshaandtshirt', player.PlayerData.source, 
        armsSlot and armsSlot.metadata or nil,
        tShirtSlot and tShirtSlot.metadata or nil
    )
end)



RegisterServerEvent('sex:loadPlayer')
AddEventHandler('sex:loadPlayer',function(sex)
    PlayerSex[source] = sex 
end)


function GetPlayerClothes(source)
    local player = QBCore.Functions.GetPlayer(source)
    if not player or not player.PlayerData then
        return
    end

    local ClothesData = {}
    ClothesData.sex = PlayerSex[source]

    for _, item in pairs(componentMapping) do
        if item.clothesSlotID ~= componentMapping.clothes.clothesSlotID then
            local itemInSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, item.clothesSlotID)
            if itemInSlot and itemInSlot.metadata then
                local metadata = itemInSlot.metadata
                local itemData = {
                    name = item.itemname,
                    sex = PlayerSex[source],
                    drawable = metadata.drawable,
                    texture = metadata.texture,
                    component_id = item.component,
                    prop_id = item.prop,
                    camera = item.camera
                }
                if metadata.token then
                    itemData.token = metadata.token
                end
                table.insert(ClothesData, itemData)
            end
        end
    end

    if #ClothesData == 0 then
        local itemInSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, componentMapping.clothes.clothesSlotID)
        if itemInSlot and itemInSlot.name == 'clothes' then
            exports.ox_inventory:RemoveItem(player.PlayerData.source, 'clothes', 1, itemInSlot.metadata, componentMapping.clothes.clothesSlotID)
        end
    end

    return ClothesData
end



function ClothesMoved(source, toSlot)
    Citizen.CreateThread(function()
        Wait(200)
        local player = QBCore.Functions.GetPlayer(source)
        if not player or not player.PlayerData then
            return
        end

        local itemInSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, toSlot)
        if itemInSlot and itemInSlot.metadata then
            local clothesdata = GetPlayerClothes(source)

            if clothesdata and #clothesdata > 0 then
                clothesdata.label = itemInSlot.metadata.label
                exports.ox_inventory:SetMetadata(player.PlayerData.source, toSlot, clothesdata)
            end
        end
        for _, item in pairs(componentMapping) do
            local itemInSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, item.clothesSlotID)
            if itemInSlot then 
                exports.ox_inventory:RemoveItem(player.PlayerData.source, item.itemname, 1, itemInSlot.metadata, item.clothesSlotID)
                if item.itemname == 'cloth_bags' then 
                    BagAdd(player.PlayerData.source, nil, true)
                end
            end 
        end

        TriggerClientEvent('clothes:resetPed', player.PlayerData.source)
    end)
end


function ClothesMovedToGood(source)
    Citizen.CreateThread(function()
        Wait(200)
        local player = QBCore.Functions.GetPlayer(source)
        if not player then 
            return 
        end

        local itemInSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, componentMapping.clothes.clothesSlotID)
        if itemInSlot and itemInSlot.name == 'clothes' and itemInSlot.metadata then
            local clothesList = itemInSlot.metadata
            TriggerClientEvent('clothes:refreshClothes', player.PlayerData.source, clothesList)
            
            if not clothesList.sex then
                clothesList.sex = PlayerSex[player.PlayerData.source]
            end
        
            for _, clothing in pairs(clothesList) do
                if type(clothing) == "table" then  
                    for _, mapping in pairs(componentMapping) do
                        local isMatchingComponent = mapping.component == clothing.component_id
                        local isMatchingProp = mapping.prop == clothing.prop_id
                        local sameSex = PlayerSex[player.PlayerData.source] == (clothing.sex or clothesList.sex)
                        
                        if not sameSex then
                            return 
                        end 

                        if isMatchingComponent and isMatchingProp and mapping.itemname == clothing.name then
                            if Config.NoImage then
                                local itemData = {
                                    name = clothing.name,
                                    label = clothing.label,
                                    drawable = clothing.drawable,
                                    texture = clothing.texture,
                                    component_id = clothing.component_id,
                                    prop_id = clothing.prop_id,
                                    sex = PlayerSex[player.PlayerData.source],
                                    camera = clothing.camera
                                }

                                if clothing.name == 'cloth_bags' then
                                    itemData.metadata = clothing.metadata
                                    itemData.token = clothing.token
                                end
    
                                exports.ox_inventory:AddItem(
                                    player.PlayerData.source,
                                    clothing.name,
                                    1,
                                    itemData,
                                    mapping.clothesSlotID
                                )
                            else
                                local imagename
                                if clothing.prop_id then
                                    imagename = Config.Url .. "/".. PlayerSex[player.PlayerData.source].."_prop_"..clothing.component_id..'_'..clothing.drawable..'.'..Config.Extension
                                else
                                    imagename = Config.Url .. "/".. PlayerSex[player.PlayerData.source].."_" ..clothing.component_id..'_'..clothing.drawable..'.'..Config.Extension
                                end
                                local itemData = {
                                    name = clothing.name,
                                    label = clothing.label,
                                    drawable = clothing.drawable,
                                    texture = clothing.texture,
                                    component_id = clothing.component_id,
                                    prop_id = clothing.prop_id,
                                    sex = PlayerSex[player.PlayerData.source],
                                    imageurl = imagename,
                                    camera = clothing.camera
                                }

                                if clothing.name == 'cloth_bags' then
                                    itemData.metadata = clothing.metadata
                                    itemData.token = clothing.token
                                end
    
                                exports.ox_inventory:AddItem(
                                    player.PlayerData.source,
                                    clothing.name,
                                    1,
                                    itemData,
                                    mapping.clothesSlotID
                                )
                            end
                                local bagSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, Config.SlotBalo)
                                if bagSlot then
                                    BagAdd(source, bagSlot.metadata, true)
                                else 
                                    BagAdd(source, nil, true)
                                end
                        end
                    end
                end
            end
        end
    end)
end



function GetPlayerClothesAndStock(source)
    
    Citizen.CreateThread(function()
        Wait(200)
        local player = QBCore.Functions.GetPlayer(source)
        if not player then
            return
        end

        local itemInSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, componentMapping.clothes.clothesSlotID)
        local clothesdata = GetPlayerClothes(source)
        
        if clothesdata and itemInSlot then  
            clothesdata.label = itemInSlot.metadata.label
        end 
        if itemInSlot == nil then
            if clothesdata then  
                -- exports.ox_inventory:AddItem(
                --     player.PlayerData.source,
                --     'clothes',
                --     1,
                --     clothesdata,
                --     componentMapping.clothes.clothesSlotID
                -- )
            end
            
        elseif itemInSlot and itemInSlot.name == 'clothes' then
            exports.ox_inventory:SetMetadata(player.PlayerData.source, componentMapping.clothes.clothesSlotID, clothesdata)
            Wait(200)
        end
    end)
end



RegisterServerEvent('clothes:defaultoutfit')
AddEventHandler('clothes:defaultoutfit', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local isoutfit = exports.ox_inventory:GetSlot(xPlayer.PlayerData.source, componentMapping.clothes.clothesSlotID)
    -- if isoutfit and isoutfit.name == 'clothes' then
    --     exports.ox_inventory:RemoveItem(xPlayer.PlayerData.source, 'clothes', 1, isoutfit.metadata, componentMapping.clothes.clothesSlotID) 
    --     exports.ox_inventory:AddItem(xPlayer.PlayerData.source, 'clothes', 1, isoutfit.metadata)
    -- end

    for _, item in pairs(componentMapping) do
        if item.clothesSlotID ~= componentMapping.clothes.clothesSlotID then
            local itemInSlot = exports.ox_inventory:GetSlot(xPlayer.PlayerData.source, item.clothesSlotID)
            if itemInSlot then 
                exports.ox_inventory:RemoveItem(xPlayer.PlayerData.source, item.itemname, 1, itemInSlot.metadata, item.clothesSlotID)
            end 
        end
    end
end)

RegisterServerEvent('clothes:purchaseClothesoutfit')
AddEventHandler('clothes:purchaseClothesoutfit', function(data)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then
        return
    end

    if xPlayer.Functions.GetMoney('cash') < data.totalPrice then
        TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, Config.Notification.notenoughmoney, "error")
        return
    end

    xPlayer.Functions.RemoveMoney('cash', data.totalPrice)

    local ClothesData = {}
    ClothesData.sex = PlayerSex[xPlayer.PlayerData.source]

    for _, item in pairs(data.items) do
        local category = item.category
        if componentMapping[category] then
            local itemData = {
                name = componentMapping[category].itemname,
                sex = PlayerSex[xPlayer.PlayerData.source],
                drawable = item.index,
                texture = item.texture,
                component_id = componentMapping[category].component,
                prop_id = componentMapping[category].prop,
                camera = componentMapping[category].camera
            }
            table.insert(ClothesData, itemData)
        end
    end

    -- if #ClothesData > 0 then
    --     local success = exports.ox_inventory:AddItem(xPlayer.PlayerData.source, 'clothes', 1, ClothesData)
    --     if success then
    --         TriggerClientEvent('clothes:refreshClothes', xPlayer.PlayerData.source, ClothesData)
    --         TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, Config.Notification.outfitexported, "success")
    --     else
    --         xPlayer.Functions.AddMoney('cash', data.totalPrice)
    --         TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, "Erreur lors de l'achat", "error")
    --     end
    -- end
end)


lib.addCommand('addbalo', {
    help = 'Thêm balo cho người chơi',
    restricted = 'group.admin',
    args = {
        { name = 'id', type = 'number', help = 'ID người chơi' },
        { name = 'label', type = 'string', help = 'Tên balo (vd: Balo VIP)' },
        { name = 'drawable', type = 'number', help = 'Drawable ID (vd: 5)' },
        { name = 'texture', type = 'number', help = 'Texture ID (vd: 0)' },
        { name = 'sex', type = 'string', help = 'Giới tính (male/female/unisex)' },
    }
}, function(source, args, raw)

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local playerId   = args[1]
    local label      = args[2]
    local drawable   = args[3]
    local texture    = args[4]
    local sex        = args[5]

    print("step 1", playerId)

    local targetPlayer = ESX.GetPlayerFromId(playerId)
    if not targetPlayer then
        return TriggerClientEvent('esx:showNotification', source, "Không tìm thấy người chơi này.", "error")
    end

    local imagename = ("%s/%s_%s_%s.%s"):format(
        Config.Url,
        sex,
        5,
        drawable,
        Config.Extension
    )

    local itemData = {
        name = "cloth_bags",
        label = label,
        weight = 2.0,
        metadata = {
            category = "bag",
            sex = sex,
            drawable = drawable,
            texture = texture,
            component_id = 5,
            prop_id = false,
            camera = "default",
            imageUrl = imagename
        }
    }
    print(targetPlayer.source, itemData.name, 1, itemData.metadata)
    local success = exports.ox_inventory:AddItem(targetPlayer.source, itemData.name, 1, itemData.metadata)

    if success then
        lib.notify({
            title = 'Thành công',
            description = ('Đã thêm balo "%s" cho %s'):format(itemData.label, targetPlayer.getName()),
            type = 'success'
        }, source)

        lib.notify({
            title = 'Nhận balo',
            description = ('Bạn đã nhận được balo: %s'):format(itemData.label),
            type = 'success'
        }, targetPlayer.source)

        print(('[ADMIN] %s đã thêm balo "%s" cho %s (ID: %s)'):format(
            xPlayer.getName(), itemData.label, targetPlayer.getName(), playerId
        ))
    else
        lib.notify({
            title = 'Lỗi',
            description = ('Không thể thêm balo cho %s'):format(targetPlayer.getName()),
            type = 'error'
        }, source)
    end
end)
