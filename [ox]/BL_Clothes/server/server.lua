QBCore = exports['qb-core']:GetCoreObject()

Config.DeleteScreenshotUrl = "https://api2.discordtools.lol/deleteimage" 

RegisterServerEvent('clothes:purchase')
AddEventHandler('clothes:purchase', function(items, sex)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local money = xPlayer.Functions.GetMoney("cash")
    local totalPrice = 0

    for _, item in pairs(items) do
        totalPrice = totalPrice + item.price
    end

    if money < totalPrice then
        TriggerClientEvent('QBCore:Notify', source, Config.Notification.notenoughtmoney, "error")
        return
    end

    xPlayer.Functions.RemoveMoney("cash", totalPrice, "achat-vetements")

    for _, item in pairs(items) do
        if componentMapping[item.category] then
            local imagename

            if Config.NoImage then
                imagename = componentMapping[item.category].itemname
            else
                local propPrefix = componentMapping[item.category].prop and '_prop_' or '_'

                if Config.UrlInventory then
                    imagename = Config.Url .. "/" .. sex .. propPrefix .. componentMapping[item.category].component .. '_' .. item.index .. '.' .. Config.Extension
                else
                    imagename = sex .. propPrefix .. componentMapping[item.category].component .. '_' .. item.index
                end
            end

            AddItem(xPlayer.PlayerData.source, componentMapping[item.category].itemname, { 
                type = componentMapping[item.category].component,
                drawable = item.index,
                id = componentMapping[item.category].component,
                description = Config.Decription .. (sex == "male" and "Homme" or "Femme"),
                texture = item.texture,
                label = item.customName or (item.category .. ' ' .. item.index),
                imageUrl = imagename
            })
        else
            print('Danh mục không hợp lệ: ' .. item.category)
        end
    end
end)


QBCore.Functions.CreateCallback('clothes:getOutfits', function(source, cb, sex)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local identifier = xPlayer.PlayerData.citizenid

    if sex == "male" then
        sex = 1
    else
        sex = 0
    end

    MySQL.Async.fetchAll('SELECT * FROM BL_Clothes WHERE identifier = ? AND male = ?', {identifier, sex}, function(result)
        cb(result)
    end)
end)

RegisterServerEvent('clothes:deleteOutfit')
AddEventHandler('clothes:deleteOutfit', function(outfitId)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local identifier = xPlayer.PlayerData.citizenid

    MySQL.Async.execute('DELETE FROM BL_Clothes WHERE id = ? AND identifier = ?', {outfitId, identifier})

    PerformHttpRequest(
        Config.DeleteScreenshotUrl .. '/' .. Config.ServerName .. '/outfit_' .. outfitId .. '.jpg',
        function(err, text, headers) end,
        'DELETE'
    )

    TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, Config.Notification.outfitdeleted, "success")
    TriggerClientEvent('clothes:getOutfits', xPlayer.PlayerData.source)
end)

RegisterServerEvent('clothes:saveOutfit')
AddEventHandler('clothes:saveOutfit', function(outfitName, sex)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local identifier = xPlayer.PlayerData.citizenid
    local name = outfitName
    local price = Config.SaveOutfitPrice

    local clothes = GetPlayerClothes(xPlayer.PlayerData.source)

    if #outfitName < 3 then
        TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, Config.Notification.outfitnamelength, "error")
        return
    end

    local existingOutfit = MySQL.Sync.fetchScalar('SELECT id FROM BL_Clothes WHERE identifier = ? AND name = ?', {identifier, name})
    if existingOutfit then
        TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, Config.Notification.outfitnameexists, "error")
        return
    end

    if xPlayer.Functions.GetMoney("cash") < price then
        TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, Config.Notification.notenoughtmoney, "error")
        return
    end

    if not next(clothes) then
        TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, "Bạn phải có quần áo được trang bị để lưu một bộ trang phục", "error")
        return
    end

    xPlayer.Functions.RemoveMoney("cash", price, "achat-tenue")

    if sex == "male" then
        sex = 1
    else
        sex = 0
    end

    MySQL.Async.execute('INSERT INTO BL_Clothes (identifier, clothes, name, male) VALUES (?, ?, ?, ?)', {
        identifier,
        json.encode(clothes),
        name,
        sex
    })

    Wait(200)
    if Config.UseScreenshot then
        MySQL.Async.fetchAll('SELECT id FROM BL_Clothes WHERE identifier = ? AND name = ?', {identifier, name}, 
        function(result)
            if result and result[1] then
                TriggerClientEvent('clothes:uploadScreenshot', xPlayer.PlayerData.source, result[1].id)
            end
        end)
    end 

    TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, Config.Notification.outfitsaved, "success")
    TriggerClientEvent('clothes:getOutfits', xPlayer.PlayerData.source)
end)

QBCore.Functions.CreateCallback('clothes:getOutfitById', function(source, cb, outfitId, sex)
    local player = QBCore.Functions.GetPlayer(source)
    local identifier = player.PlayerData.citizenid
    local playermoney = player.Functions.GetMoney('cash')

    if playermoney < Config.TakeOutfitPrice then
        TriggerClientEvent('QBCore:Notify', source, Config.Notification.notenoughtmoney, "error")
        return
    else
        player.Functions.RemoveMoney('cash', Config.TakeOutfitPrice)
    end

    MySQL.Async.fetchAll('SELECT * FROM BL_Clothes WHERE id = ? AND identifier = ? LIMIT 1', {outfitId, identifier}, function(result)
        if result and #result > 0 then
            local metadata = json.decode(result[1].clothes)
            metadata.sex = sex
            metadata.label = result[1].name
            local item = exports.ox_inventory:GetSlot(player.PlayerData.source, componentMapping.clothes.clothesSlotID)


            if item then
                exports.ox_inventory:RemoveItem(player.PlayerData.source, item.name, 1, item.metadata, componentMapping.clothes.clothesSlotID)
                exports.ox_inventory:AddItem(player.PlayerData.source, item.name, 1, item.metadata)

                for _, component in pairs(componentMapping) do
                    if component.clothesSlotID then
                        local itemInSlot = exports.ox_inventory:GetSlot(player.PlayerData.source, component.clothesSlotID)
                        if itemInSlot then
                            exports.ox_inventory:RemoveItem(player.PlayerData.source, itemInSlot.name, 1, itemInSlot.metadata, component.clothesSlotID)
                        end
                    end
                end
            end

            exports.ox_inventory:AddItem(player.PlayerData.source, 'clothes', 1, metadata, componentMapping.clothes.clothesSlotID)
            Wait(100)
            ClothesMovedToGood(player.PlayerData.source)
        else
            cb(nil)
        end
    end)
end)

RegisterServerEvent('clothes:copyOutfit')
AddEventHandler('clothes:copyOutfit', function(outfitId, sex)
    local player = QBCore.Functions.GetPlayer(source)
    local identifier = player.PlayerData.citizenid
    local price = Config.CopyOutfitPrice

    MySQL.Async.fetchAll('SELECT * FROM BL_Clothes WHERE id = ?', {outfitId}, function(result)
        if result and #result > 0 then
            local outfitData = result[1].clothes
            local name = result[1].name
            local sexs = result[1].male

            sexs = (sexs == 1) and "male" or "female"

            if sex ~= sexs then
                TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.othersex, "error")
                return
            end

            if player.Functions.GetMoney('cash') < price then
                TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.notenoughtmoney, "error")
                return
            else
                player.Functions.RemoveMoney('cash', price)
            end

            MySQL.Async.execute('INSERT INTO BL_Clothes (identifier, clothes, name) VALUES (?, ?, ?)', {identifier, outfitData, name})
            TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.outfitsaved, "success")
            TriggerClientEvent('clothes:getOutfits', player.PlayerData.source)
        else
            TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.outfitnotfound, "error")
        end
    end)
end)

RegisterServerEvent('clothes:exportOutfit')
AddEventHandler('clothes:exportOutfit', function(outfitId, sex)
    local player = QBCore.Functions.GetPlayer(source)
    local identifier = player.PlayerData.citizenid

    MySQL.Async.fetchAll('SELECT clothes, name, male FROM BL_Clothes WHERE id = ?', {outfitId}, function(result)
        if result and #result > 0 then
            local outfitData = result[1].clothes
            local name = result[1].name
            local sexs = result[1].male == 1 and "male" or "female"

            if sex ~= sexs then
                TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.othersex, "error")
                return
            end

            local success, response = exports.ox_inventory:AddItem(player.PlayerData.source, 'clothes', 1, {
                outfit = outfitData,
                name = name,
                description = Config.Description .. (sex == "male" and "Homme" or "Femme"),
                label = name,
                sex = sex
            })

            if success then
                TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.outfitexported, "success")
                MySQL.Async.execute('DELETE FROM BL_Clothes WHERE id = ?', {outfitId})
            else
                TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.outfitexporterror, "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.outfitnotfound, "error")
        end
    end)
end)


AddEventHandler('onResourceStart', function(resource)   
    if resource == GetCurrentResourceName() then
        local urlWithCacheBuster = Config.MajUrl .. "?timestamp=" .. os.time()
        
        PerformHttpRequest(urlWithCacheBuster, function(err, text, headers)
            if err and err ~= 200 then
                print('^1[ERROR] Kiểm tra xem URL có đúng và có thể truy cập được không^7')
                return
            end

            local success, data = pcall(function()
                return json.decode(text)
            end)

            if not success then
                print('^1[ERROR] Lỗi khi giải mã JSON^7')
                return
            end

            if data then
                local serverVersion = tonumber(data.version)
                local clientVersion = tonumber(Config.Version)

                if not serverVersion or not clientVersion then
                    -- print('^1[ERROR] Phiên bản không chính xác (không phải số) trong tệp JSON hoặc Config^7')
                    return
                end

                if serverVersion > clientVersion then
                --     print('^1[UPDATE] Một phiên bản mới đã có sẵn!^7')
                --     print('^1[UPDATE] Thay đổi: ' .. data.change .. '^7')
                -- else
                --     print('^2[VERSION] Bạn đang sử dụng phiên bản mới nhất^7')
                end
            -- else
            --     print('^1[ERROR] Lỗi khi đọc dữ liệu phiên bản^7')
            end
        end, 'GET')
    end
end)

function GetSlotId(componentId, isProp)
    for key, value in pairs(componentMapping) do
        if value.component == componentId then
            if isProp then
                if value.prop == true then
                    return value.clothesSlotID
                end
            else
                if value.prop == false then
                    return value.clothesSlotID
                end
            end
        end
    end
end

function getItemNameByComponentId(componentId, isProp)
    for key, value in pairs(componentMapping) do
        if value.component == componentId then
            if isProp then
                if value.prop == true then
                    return value.itemname
                end
            else
                if value.prop == false then
                    return value.itemname
                end
            end
        end
    end
    return nil
end


function GiveClothes(id, outfit, sexs)
    local player = QBCore.Functions.GetPlayer(id)
    if not player then
        return
    end

    if not outfit then
        return
    end

    if Config.UseCustomOXInventory == false then
        return
    end

    if type(outfit) == "string" then
        outfit = json.decode(outfit)
    end

    local ClothesItem = exports.ox_inventory:GetSlot(player.PlayerData.source, 53)
    if ClothesItem then
        exports.ox_inventory:RemoveItem(player.PlayerData.source, ClothesItem.name, 1, ClothesItem.metadata, 53)
        exports.ox_inventory:AddItem(player.PlayerData.source, ClothesItem.name, 1, ClothesItem.metadata)
    end

    for _, slotId in pairs(clothesSlotID) do
        local existingItem = exports.ox_inventory:GetSlot(player.PlayerData.source, slotId)
        if existingItem then
            local deleteSuccess = exports.ox_inventory:RemoveItem(player.PlayerData.source, existingItem.name, 1)
            if not deleteSuccess then
                -- print("^1[ERROR] Không thể xóa item tồn tại :", existingItem.name)
            end
        end
    end

    Wait(200)

    if outfit.components then
        for i, component in ipairs(outfit.components) do
            local componentId = component.component_id
            local componentDrawable = component.drawable
            local componentTexture = component.texture

            local slotId = GetSlotId(componentId, false)
            local itemName = getItemNameByComponentId(componentId, false)

            if not itemName then
                goto continue
            end

            local imagenamess
            if sexs == "male" then
                if Config.UrlInventory then
                    imagenamess = Config.Url .. "/male_" .. componentId .. "_" .. componentDrawable .. "." .. Config.Extension
                else
                    imagenamess = "male_" .. componentId .. "_" .. componentDrawable
                end
            else
                if Config.UrlInventory then
                    imagenamess = Config.Url .. "/female_" .. componentId .. "_" .. componentDrawable .. "." .. Config.Extension
                else
                    imagenamess = "female_" .. componentId .. "_" .. componentDrawable
                end
            end

            if component.drawable == 0 or component.drawable == -1 then
                goto continue
            end

            AddItem(player.PlayerData.source, itemName, {
                type = "component",
                drawable = componentDrawable,
                id = componentId,
                texture = componentTexture,
                label = itemName .. " " .. componentId .. "-" .. componentDrawable .. "-" .. math.random(1, 1000),
                description = Config.Decription .. (sexs == "male" and "Homme" or "Femme"),
                imageurl = imagenamess
            }, slotId)

            ::continue::
        end
    end

    Wait(200)
    if outfit.props then
        for i, prop in ipairs(outfit.props) do
            local propId = prop.prop_id
            local propDrawable = prop.drawable
            local propTexture = prop.texture

            local slotId = GetSlotId(propId, true)
            local itemName = getItemNameByComponentId(propId, true)

            if not itemName then
                goto continueProps
            end

            local imagenamess
            if sexs == "male" then
                imagenamess = Config.Url .. "/male_prop_" .. propId .. "_" .. propDrawable .. "." .. Config.Extension
            else
                imagenamess = Config.Url .. "/female_prop_" .. propId .. "_" .. propDrawable .. "." .. Config.Extension
            end

            if prop.drawable == -1 then
                goto continueProps
            end

            AddItem(player.PlayerData.source, itemName, {
                type = "prop",
                drawable = propDrawable,
                id = propId,
                texture = propTexture,
                label = itemName .. " " .. propId .. "-" .. propDrawable .. "-" .. math.random(1, 1000),
                description = Config.Decription .. (sexs == "male" and "Homme" or "Femme"),
                imageurl = imagenamess
            }, slotId)

            ::continueProps::
        end
    end

    GetPlayerClothesAndStock(player.PlayerData.source)
    TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.outfitequipped, "success")
end


RegisterServerEvent('clothes:setPrice')
AddEventHandler('clothes:setPrice', function(index, component, price, sex, prop)
    local player = QBCore.Functions.GetPlayer(source)
    local identifier = player.PlayerData.license
    local isstaff = false
    for _, license in ipairs(Config.StaffGroup) do
        if identifier == license then
            isstaff = true
            break
        end
    end

    if not isstaff then
        DropPlayer(player.PlayerData.source, 'Bạn không có quyền thay đổi giá cả.')
        return
    end

    MySQL.Async.fetchAll('SELECT * FROM BL_Clothes_price WHERE componentNumber = ? AND prop = ? AND sex = ?', {
        component,
        prop,
        sex
    }, function(result)
        if result and #result > 0 then
            for _, row in ipairs(result) do
                local existingIndexes = json.decode(row.clothes_index) or {}
                if table.contains(existingIndexes, index) then
                    local newIndexes = {}
                    for _, existingIndex in ipairs(existingIndexes) do
                        if existingIndex ~= index then
                            table.insert(newIndexes, existingIndex)
                        end
                    end

                    if #newIndexes > 0 then
                        MySQL.Async.execute('UPDATE BL_Clothes_price SET clothes_index = ? WHERE id = ?', {
                            json.encode(newIndexes),
                            row.id
                        })
                    else
                        MySQL.Async.execute('DELETE FROM BL_Clothes_price WHERE id = ?', {row.id})
                    end
                end
            end

            local found = false
            for _, row in ipairs(result) do
                if row.price == price then
                    local existingIndexes = json.decode(row.clothes_index) or {}
                    if not table.contains(existingIndexes, index) then
                        table.insert(existingIndexes, index)
                        MySQL.Async.execute('UPDATE BL_Clothes_price SET clothes_index = ? WHERE id = ?', {
                            json.encode(existingIndexes),
                            row.id
                        })
                        found = true
                        break
                    end
                end
            end

            if not found then
                local indexList = {index}
                MySQL.Async.execute('INSERT INTO BL_Clothes_price (componentNumber, prop, price, clothes_index, sex) VALUES (?, ?, ?, ?, ?)', {
                    component,
                    prop,
                    price,
                    json.encode(indexList),
                    sex
                })
            end
        else
            local indexList = {index}
            MySQL.Async.execute('INSERT INTO BL_Clothes_price (componentNumber, prop, price, clothes_index, sex) VALUES (?, ?, ?, ?, ?)', {
                component,
                prop,
                price,
                json.encode(indexList),
                sex
            })
        end
    end)

    Wait(100)
    

    TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Config.Notification.priceupdated, "success")
    TriggerClientEvent('clothes:getPrice', -1)
end)


function table.contains(table, element)
    if not table then return false end
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

QBCore.Functions.CreateCallback('clothes:getAllPriceClothes', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM BL_Clothes_price', {}, function(result)
        cb(result)
    end)
end)


QBCore.Functions.CreateCallback('clothes:isstaff', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    if not player or not player.PlayerData.source then
        return
    end

    local playerlicense = player.PlayerData.license
    local isStaff = false
    for _, license in ipairs(Config.StaffGroup) do
        if playerlicense == license then
            isStaff = true
            break
        end
    end

    cb(isStaff)
end)

QBCore.Functions.CreateCallback('clothes:getInventoryForOutfit', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    if not player then return cb(nil) end

    local inventory = exports.ox_inventory:GetInventory(source, true)
    if not inventory then return cb(nil) end

    cb(inventory)
end)


function AddItem(xPlayer, itemName, itemData, slotId)
    if PlayerSex[xPlayer] then 
        itemData.sex = PlayerSex[xPlayer]
    end
    if Config.NoImage then
        if itemData.imageurl then
            itemData.imageurl = nil
        end
        if slotId then
            local success, response = exports.ox_inventory:AddItem(xPlayer, itemName, 1, itemData, slotId)
        else
            local success, response = exports.ox_inventory:AddItem(xPlayer, itemName, 1, itemData)
        end
    else
        if slotId then
            local success, response = exports.ox_inventory:AddItem(xPlayer, itemName, 1, itemData, slotId)
        else
            local success, response = exports.ox_inventory:AddItem(xPlayer, itemName, 1, itemData)
        end
    end
end

RegisterServerEvent('clothes:createBag', function(item, count, metadata, player, itemslot)
    local source = source
    local token = math.random(1, 1000000)
    local itemName = item
    local drawable = metadata.drawable

    for _, data in pairs(Config.DataBag) do
        if data.index == drawable then
            slot = data.slot
            weight = data.weight
        end
    end

    metadata.token = token
    exports.ox_inventory:SetMetadata(source, itemslot, metadata)
    exports.ox_inventory:RegisterStash("bag_" .. token, "bag_" .. token, slot, weight)
    Wait(100)
    exports.ox_inventory:forceOpenInventory(source, 'stash', "bag_" .. token)
end)

RegisterServerEvent('clothes:createbag', function(token, drawable)
    local source = source
    local token = token
    

    for _, data in pairs(Config.DataBag) do
        if data.index == drawable then
            slot = data.slot
            weight = data.weight
        end
    end

    exports.ox_inventory:SetMetadata(source, 53, {token = token})
    exports.ox_inventory:RegisterStash("bag_" .. token, "bag_" .. token, slot, weight)
    exports.ox_inventory:forceOpenInventory(source, 'stash', "bag_" .. token)
end)


-- Citizen.CreateThread(function()
--     Citizen.Wait(1000) 

--     local colorCyanLight = "\27[96m"
--     local colorReset = "\27[0m"

--     print(colorCyanLight .. "██╗     ██╗   ██╗ █████╗ ███╗   ██╗███╗   ██╗███████╗████████╗")
--     print(colorCyanLight .. "██║     ██║   ██║██╔══██╗████╗  ██║████╗  ██║██╔════╝╚══██╔══╝")
--     print(colorCyanLight .. "██║     ██║   ██║███████║██╔██╗ ██║██╔██╗ ██║█████╗     ██║")
--     print(colorCyanLight .. "██║     ██║   ██║██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝     ██║")
--     print(colorCyanLight .. "███████╗╚██████╔╝██║  ██║██║ ╚████║██║ ╚████║███████╗   ██║")

--     print(colorCyanLight .. "🌟 Cảm ơn quý khách đã mua hàng tại LuaNest Studio!" .. colorReset)
--     print(colorCyanLight .. "📌 Tham gia Discord: https://discord.gg/4SGgaS3xbb" .. colorReset)
-- end)
