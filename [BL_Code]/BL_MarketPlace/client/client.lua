local QBCore = exports['qb-core']:GetCoreObject()
local isMarketplaceOpen = false

function SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

local function ToggleMarketplace(show)
    isMarketplaceOpen = show
    SetNuiFocus(show, show)
    SendReactMessage('setVisible', show)
    
    if show then
        LoadMarketplaceData()
    end
end

local function GetItemImageUrl(itemName, metadata)
    if metadata and type(metadata) == "table" then
        if metadata.imageurl then
            return metadata.imageurl
        elseif metadata.imageUrl then
            return metadata.imageUrl
        end
    end
    
    if Config.ItemImageUrl and itemName then
        return string.format(Config.ItemImageUrl, itemName)
    end
    
    return nil
end

local function GetRarityFromMetadata(metadata)
    if not metadata or type(metadata) ~= "table" then
        return "common"
    end
    
    local rarityValue = metadata.rare or metadata.Rarity or metadata.rarity or metadata.RarityLevel or metadata.rarityLevel
    
    if not rarityValue then
        return "common"
    end
    
    if type(rarityValue) == "string" then
        local lowerRarity = string.lower(rarityValue)
        if lowerRarity == "common" or lowerRarity == "uncommon" or lowerRarity == "rare" or 
           lowerRarity == "epic" or lowerRarity == "legendary" then
            return lowerRarity
        end
    end
    
    if type(rarityValue) == "number" then
        if rarityValue == 0 then return "common"
        elseif rarityValue == 1 then return "uncommon"
        elseif rarityValue == 2 then return "rare"
        elseif rarityValue == 3 then return "epic"
        elseif rarityValue == 4 then return "legendary"
        else return "common"
        end
    end
    
    return "common"
end

function LoadMarketplaceData()
    CreateThread(function()
        local items = {}
        local playerItems = exports.ox_inventory:GetPlayerItems()
        
        local blacklistLookup = {}
        if Config.BlackList then
            for _, blacklistedItem in ipairs(Config.BlackList) do
                blacklistLookup[blacklistedItem] = true
            end
        end
        print("???")
        if playerItems then
            for slot, item in pairs(playerItems) do
                if item and item.name and item.count and item.count > 0 then
                    local slotNum = tonumber(slot)
                    if not (slotNum and slotNum >= 5 and slotNum <= 21) then
                        if not blacklistLookup[item.name] then
                            local itemData = exports.ox_inventory:Items(item.name)
                            if itemData then
                                local itemLabel = itemData.label or item.name
                                local rarity = "common"
                                
                                if item.metadata and type(item.metadata) == "table" then
                                    if item.metadata.label then
                                        itemLabel = item.metadata.label
                                    end
                                    rarity = GetRarityFromMetadata(item.metadata)
                                end
                                
                                local itemImage = GetItemImageUrl(item.name, item.metadata)
                                
                                table.insert(items, {
                                    name = item.name,
                                    label = itemLabel,
                                    image = itemImage,
                                    quantity = item.count,
                                    rarity = rarity,
                                    slot = tonumber(slot),
                                    metadata = item.metadata or {}
                                })
                            end
                        end
                    end
                end
            end
        end
        local listings = lib.callback.await('marketplace:getListings', false)
        local orders = lib.callback.await('marketplace:getMyOrders', false)
        local favorites = lib.callback.await('marketplace:getFavorites', false)
        local playerInfo = lib.callback.await('marketplace:getPlayerInfo', false)
        print("???")
        SendReactMessage('marketplace:data', {
            inventory = items,
            listings = listings,
            orders = orders,
            itemsPerPage = Config.Marketplace.ItemsPerPage or 16,
            categories = Config.Categories or {},
            itemCategories = Config.ItemCategories or {},
            favorites = favorites or {},
            playerInfo = playerInfo or {}
        })
    end)
end

function ReloadMarketplaceListings()
    CreateThread(function()
        local listings = lib.callback.await('marketplace:getListings', false)
        local orders = lib.callback.await('marketplace:getMyOrders', false)
        local favorites = lib.callback.await('marketplace:getFavorites', false)
        local playerInfo = lib.callback.await('marketplace:getPlayerInfo', false)
        
        SendReactMessage('marketplace:updateListings', {
            listings = listings,
            orders = orders,
            favorites = favorites,
            playerInfo = playerInfo
        })
    end)
end

function ReloadInventoryAndListings()
    CreateThread(function()
        local items = {}
        local itemsMap = {} 
        local playerItems = exports.ox_inventory:GetPlayerItems()
        
        local blacklistLookup = {}
        if Config.BlackList then
            for _, blacklistedItem in ipairs(Config.BlackList) do
                blacklistLookup[blacklistedItem] = true
            end
        end
        
        local function createItemKey(itemName, metadata)
            local key = itemName
            if metadata and type(metadata) == "table" then
                local keyParts = {}
                
                if metadata.drawable then
                    table.insert(keyParts, "d" .. tostring(metadata.drawable))
                end
                if metadata.texture then
                    table.insert(keyParts, "t" .. tostring(metadata.texture))
                end
                if metadata.id then
                    table.insert(keyParts, "id" .. tostring(metadata.id))
                end
                if metadata.imageUrl then
                    local urlHash = string.match(metadata.imageUrl, "([^/]+)$") or ""
                    if urlHash ~= "" then
                        table.insert(keyParts, urlHash)
                    end
                elseif metadata.imageurl then
                    local urlHash = string.match(metadata.imageurl, "([^/]+)$") or ""
                    if urlHash ~= "" then
                        table.insert(keyParts, urlHash)
                    end
                end
                if metadata.rarity then
                    table.insert(keyParts, "r" .. tostring(metadata.rarity))
                end
                if metadata.label then
                    local labelHash = string.sub(metadata.label, 1, 20)
                    if labelHash ~= "" then
                        table.insert(keyParts, "l" .. labelHash)
                    end
                end
                
                if #keyParts > 0 then
                    key = key .. "_" .. table.concat(keyParts, "_")
                else
                    local metaStr = json.encode(metadata)
                    if #metaStr > 50 then
                        metaStr = string.sub(metaStr, 1, 50)
                    end
                    key = key .. "_" .. tostring(#metaStr)
                end
            end
            return key
        end
        
        if playerItems then
            for slot, item in pairs(playerItems) do
                if item and item.name and item.count and item.count > 0 then
                    local slotNum = tonumber(slot)
                    if slotNum and slotNum >= 5 and slotNum <= 21 then
                        goto continue
                    end
                    
                    if not blacklistLookup[item.name] then
                        local itemData = exports.ox_inventory:Items(item.name)
                        if itemData then
                            local itemKey = createItemKey(item.name, item.metadata)
                            
                            local itemLabel = itemData.label or item.name
                            local rarity = "common"
                            
                            if item.metadata and type(item.metadata) == "table" then
                                if item.metadata.label then
                                    itemLabel = item.metadata.label
                                end
                                rarity = GetRarityFromMetadata(item.metadata)
                            end
                            
                            local itemImage = GetItemImageUrl(item.name, item.metadata)
                            
                            if itemsMap[itemKey] then
                                itemsMap[itemKey].quantity = itemsMap[itemKey].quantity + item.count
                            else
                                itemsMap[itemKey] = {
                                    name = item.name,
                                    label = itemLabel,
                                    image = itemImage,
                                    quantity = item.count,
                                    rarity = rarity,
                                    slot = slot,
                                    metadata = item.metadata or {}
                                }
                            end
                        end
                    end
                    ::continue::
                end
            end
        end
        
        for key, itemData in pairs(itemsMap) do
            table.insert(items, itemData)
        end
        
        local listings = lib.callback.await('marketplace:getListings', false)
        local orders = lib.callback.await('marketplace:getMyOrders', false)
        local favorites = lib.callback.await('marketplace:getFavorites', false)
        local playerInfo = lib.callback.await('marketplace:getPlayerInfo', false)
        
        SendReactMessage('marketplace:data', {
            inventory = items,
            listings = listings,
            orders = orders,
            itemsPerPage = Config.Marketplace.ItemsPerPage or 16,
            categories = Config.Categories or {},
            itemCategories = Config.ItemCategories or {},
            favorites = favorites or {},
            playerInfo = playerInfo or {}
        })
    end)
end

local marketplacePed = nil
local textUIShown = false

local function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z + 1.0)
    local camCoords = GetGameplayCamCoord()
    local distance = #(camCoords - coords)
    
    if onScreen then
        local scale = (1 / distance) * 2
        local fov = (1 / GetGameplayCamFov()) * 100
        scale = scale * fov
        
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

local function CreateMarketplacePed()
    if not Config.MarketplacePed or not Config.MarketplacePed.enabled then return end
    
    local pedConfig = Config.MarketplacePed
    local pedModel = pedConfig.model
    local coords = pedConfig.coords
    
    lib.requestModel(pedModel)
    
    marketplacePed = CreatePed(4, pedModel, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
    
    SetEntityAsMissionEntity(marketplacePed, true, true)
    SetEntityInvincible(marketplacePed, true)
    SetBlockingOfNonTemporaryEvents(marketplacePed, true)
    FreezeEntityPosition(marketplacePed, true)
    SetPedFleeAttributes(marketplacePed, 0, 0)
    SetPedCombatAttributes(marketplacePed, 17, 1)
    SetPedCanRagdoll(marketplacePed, false)
    SetModelAsNoLongerNeeded(pedModel)
    
    CreateThread(function()
        while DoesEntityExist(marketplacePed) do
            Wait(0)
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local pedCoords = GetEntityCoords(marketplacePed)
            local distance = #(playerCoords - pedCoords)
            
            if distance < 10.0 then
                local pedHead = GetPedBoneIndex(marketplacePed, 31086)
                local headCoords = GetWorldPositionOfEntityBone(marketplacePed, pedHead)
                DrawText3D(vector3(headCoords.x, headCoords.y, headCoords.z - 0.5), pedConfig.text)
                
                if distance < pedConfig.interactionDistance then
                    if not textUIShown then
                        lib.showTextUI('[E] Mở Marketplace', {
                            position = "left-center",
                            icon = 'fa-solid fa-store',
                            style = {
                                borderRadius = 5,
                                backgroundColor = '#1e1e2e',
                                color = 'white'
                            }
                        })
                        textUIShown = true
                    end
                    
                    if IsControlJustPressed(0, 38) then 
                        if not isMarketplaceOpen then
                            ToggleMarketplace(true)
                        end
                    end
                else
                    if textUIShown then
                        lib.hideTextUI()
                        textUIShown = false
                    end
                end
            else
                if textUIShown then
                    lib.hideTextUI()
                    textUIShown = false
                end
                Wait(500)
            end
        end
        
        if textUIShown then
            lib.hideTextUI()
            textUIShown = false
        end
    end)
end

CreateThread(function()
    Wait(1000)
    CreateMarketplacePed()
end)

RegisterNUICallback('hideFrame', function(_, cb)
    ToggleMarketplace(false)
    cb({})
end)

RegisterNUICallback('marketplace:getInventory', function(_, cb)
    local items = {}
    local playerItems = exports.ox_inventory:GetPlayerItems()
    
    local blacklistLookup = {}
    if Config.BlackList then
        for _, blacklistedItem in ipairs(Config.BlackList) do
            blacklistLookup[blacklistedItem] = true
        end
    end
    
    if playerItems then
        for slot, item in pairs(playerItems) do
            if item and item.name and item.count and item.count > 0 then
                local slotNum = tonumber(slot)
                if slotNum and slotNum >= 5 and slotNum <= 21 then
                    goto continue
                end
                
                if not blacklistLookup[item.name] then
                    local itemData = exports.ox_inventory:Items(item.name)
                    if itemData then
                        local itemLabel = itemData.label or item.name
                        local rarity = "common"
                        
                        if item.metadata and type(item.metadata) == "table" then
                            if item.metadata.label then
                                itemLabel = item.metadata.label
                            end
                            rarity = GetRarityFromMetadata(item.metadata)
                        end
                        
                        local itemImage = GetItemImageUrl(item.name, item.metadata)
                        
                        table.insert(items, {
                            name = item.name,
                            label = itemLabel,
                            image = itemImage,
                            quantity = item.count,
                            rarity = rarity,
                            slot = tonumber(slot),
                            metadata = item.metadata or {}
                        })
                    end
                end
                ::continue::
            end
        end
    end
    
    cb(items)
end)

RegisterNUICallback('marketplace:getListings', function(_, cb)
    local listings = lib.callback.await('marketplace:getListings', 3000)
    cb(listings)
end)

RegisterNUICallback('marketplace:getConfig', function(_, cb)
    cb({
        itemsPerPage = Config.Marketplace.ItemsPerPage or 16,
        categories = Config.Categories or {},
        itemCategories = Config.ItemCategories or {}
    })
end)

RegisterNUICallback('marketplace:getListingsByItem', function(data, cb)
    local itemName = data.itemName
    if not itemName then
        cb({})
        return
    end
    
    local listings = lib.callback.await('marketplace:getListingsByItem', false, itemName)
    cb(listings)
end)

RegisterNUICallback('marketplace:getMyOrders', function(_, cb)
    local orders = lib.callback.await('marketplace:getMyOrders', 3000)
    cb(orders)
end)

RegisterNUICallback('marketplace:getFavorites', function(_, cb)
    local favorites = lib.callback.await('marketplace:getFavorites', 3000)
    cb(favorites)
end)

RegisterNUICallback('marketplace:toggleFavorite', function(data, cb)
    local itemName = data.itemName
    if not itemName then
        cb({ success = false, message = "Tên vật phẩm không hợp lệ" })
        return
    end
    
    local result = lib.callback.await('marketplace:toggleFavorite', 3000, itemName)
    cb(result)
end)

RegisterNUICallback('marketplace:getPlayerInfo', function(_, cb)
    local playerInfo = lib.callback.await('marketplace:getPlayerInfo', 3000)
    cb(playerInfo)
end)

RegisterNUICallback('marketplace:createListing', function(data, cb)
    local itemName = data.itemName
    local quantity = tonumber(data.quantity)
    local unitPrice = tonumber(data.unitPrice)
    local slot = data.slot and tonumber(data.slot) or nil
    
    if not itemName or not quantity or not unitPrice then
        lib.notify({
            type = 'error',
            title = 'Marketplace',
            description = 'Thông tin không hợp lệ'
        })
        cb({ success = false })
        return
    end
    
    local result = lib.callback.await('marketplace:createListing', 3000, itemName, quantity, unitPrice, slot)
    
    if result.success then
        lib.notify({
            type = 'success',
            title = 'Marketplace',
            description = result.message
        })
        ReloadInventoryAndListings()
    else
        lib.notify({
            type = 'error',
            title = 'Marketplace',
            description = result.message
        })
    end
    
    cb(result)
end)

RegisterNUICallback('marketplace:buyItem', function(data, cb)
    local listingId = tonumber(data.listingId)
    local buyType = data.buyType
    local customQuantity = data.customQuantity and tonumber(data.customQuantity) or nil
    
    if not listingId then
        lib.notify({
            type = 'error',
            title = 'Marketplace',
            description = 'Listing ID không hợp lệ'
        })
        cb({ success = false })
        return
    end
    
    local result = lib.callback.await('marketplace:buyItem', 3000, listingId, buyType, customQuantity)
    
    if result.success then
        lib.notify({
            type = 'success',
            title = 'Marketplace',
            description = result.message
        })

        LoadMarketplaceData()
    else
        lib.notify({
            type = 'error',
            title = 'Marketplace',
            description = result.message
        })
    end
    
    cb(result)
end)

RegisterNUICallback('marketplace:cancelOrder', function(data, cb)
    local orderId = tonumber(data.orderId)
    local isListing = data.isListing or false
    
    if not orderId then
        lib.notify({
            type = 'error',
            title = 'Marketplace',
            description = 'Order ID không hợp lệ'
        })
        cb({ success = false })
        return
    end
    
    local result = lib.callback.await('marketplace:cancelOrder', 3000, orderId, isListing)
    
    if result.success then
        lib.notify({
            type = 'success',
            title = 'Marketplace',
            description = result.message
        })
        LoadMarketplaceData()
    else
        lib.notify({
            type = 'error',
            title = 'Marketplace',
            description = result.message
        })
    end
    
    cb(result)
end)

exports('OpenMarketplace', function()
    if not isMarketplaceOpen then
        ToggleMarketplace(true)
    end
end)

exports('CloseMarketplace', function()
    if isMarketplaceOpen then
        ToggleMarketplace(false)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if textUIShown then
            lib.hideTextUI()
            textUIShown = false
        end
        if marketplacePed and DoesEntityExist(marketplacePed) then
            DeleteEntity(marketplacePed)
            marketplacePed = nil
        end
    end
end)