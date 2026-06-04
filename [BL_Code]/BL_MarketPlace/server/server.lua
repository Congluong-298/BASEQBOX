local QBCore = exports['qb-core']:GetCoreObject()

local function GetPlayerFullname(Player)
    if not Player or not Player.PlayerData or not Player.PlayerData.charinfo then return "Unknown Player" end
    return Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
end

lib.callback.register('marketplace:getListings', function(source)
    local result = MySQL.query.await('SELECT * FROM marketplace_listings ORDER BY created_at DESC')
    for i=1, #result do
        result[i].metadata = json.decode(result[i].metadata)
    end
    return result
end)

lib.callback.register('marketplace:getMyOrders', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return {} end 

    local result = MySQL.query.await('SELECT * FROM marketplace_listings WHERE citizenid = ?', {Player.PlayerData.citizenid})
    for i=1, #result do
        result[i].metadata = json.decode(result[i].metadata)
    end
    return result
end)

lib.callback.register('marketplace:getFavorites', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return {} end 

    local result = MySQL.query.await('SELECT item_name FROM marketplace_favorites WHERE citizenid = ?', {Player.PlayerData.citizenid})
    local favs = {}
    for _, v in ipairs(result) do
        favs[v.item_name] = true
    end
    return favs
end)

lib.callback.register('marketplace:getPlayerInfo', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return nil end 

    return {
        name = GetPlayerFullname(Player),
        cash = Player.PlayerData.money['cash'],
        bank = Player.PlayerData.money['bank'],
        citizenid = Player.PlayerData.citizenid
    }
end)

lib.callback.register('marketplace:createListing', function(source, itemName, quantity, unitPrice, slot)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return { success = false, message = "Không tìm thấy dữ liệu người chơi!" } end

    local citizenid = Player.PlayerData.citizenid
    
    local currentListings = MySQL.scalar.await('SELECT COUNT(*) FROM marketplace_listings WHERE citizenid = ?', {citizenid})
    if currentListings >= (Config.Marketplace.MaxListingsPerPlayer or 5) then
        return { success = false, message = "Bạn đã đạt giới hạn bài đăng!" }
    end

    if unitPrice < Config.Marketplace.MinPrice or unitPrice > Config.Marketplace.MaxPrice then
        return { success = false, message = "Giá không hợp lệ!" }
    end

    local item = exports.ox_inventory:GetSlot(source, slot)
    if not item or item.name ~= itemName or item.count < quantity then
        return { success = false, message = "Bạn không đủ vật phẩm này!" }
    end

    local itemData = exports.ox_inventory:Items(itemName)
    local itemLabel = item.metadata.label or itemData.label or itemName

    if exports.ox_inventory:RemoveItem(source, itemName, quantity, item.metadata, slot) then
        MySQL.insert.await('INSERT INTO marketplace_listings (citizenid, seller_name, item_name, item_label, quantity, price, metadata) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            citizenid,
            GetPlayerFullname(Player),
            itemName,
            itemLabel,
            quantity,
            unitPrice,
            json.encode(item.metadata)
        })
        return { success = true, message = "Đã đăng bán thành công!" }
    end

    return { success = false, message = "Có lỗi xảy ra khi xóa vật phẩm!" }
end)

lib.callback.register('marketplace:buyItem', function(source, listingId, buyType, customQuantity)
    local Buyer = QBCore.Functions.GetPlayer(source)
    if not Buyer then return { success = false, message = "Không tìm thấy dữ liệu người chơi!" } end

    local listing = MySQL.single.await('SELECT * FROM marketplace_listings WHERE id = ?', {listingId})

    if not listing then
        return { success = false, message = "Vật phẩm này không còn tồn tại!" }
    end

    local quantityToBuy = (buyType == 'all') and listing.quantity or tonumber(customQuantity)
    if not quantityToBuy or quantityToBuy <= 0 or quantityToBuy > listing.quantity then
        return { success = false, message = "Số lượng không hợp lệ!" }
    end

    local totalPrice = quantityToBuy * listing.price
    local commission = math.floor(totalPrice * (Config.Marketplace.CommissionPercent / 100))
    local totalCost = totalPrice 

    if Buyer.PlayerData.money['bank'] < totalCost then
        if Buyer.PlayerData.money['cash'] < totalCost then
            return { success = false, message = "Bạn không đủ tiền!" }
        else
            Buyer.Functions.RemoveMoney('cash', totalCost, "Marketplace-Buy")
        end
    else
        Buyer.Functions.RemoveMoney('bank', totalCost, "Marketplace-Buy")
    end

    if quantityToBuy == listing.quantity then
        MySQL.query.await('DELETE FROM marketplace_listings WHERE id = ?', {listingId})
    else
        MySQL.query.await('UPDATE marketplace_listings SET quantity = quantity - ? WHERE id = ?', {quantityToBuy, listingId})
    end

    local metadata = json.decode(listing.metadata)
    exports.ox_inventory:AddItem(source, listing.item_name, quantityToBuy, metadata)

    local sellerMoney = totalPrice - commission
    local Seller = QBCore.Functions.GetPlayerByCitizenId(listing.citizenid)
    
    if Seller then
        Seller.Functions.AddMoney('bank', sellerMoney, "Marketplace-Sold")
        TriggerClientEvent('ox_lib:notify', Seller.PlayerData.source, {
            title = 'Marketplace',
            description = string.format("Bạn đã bán %dx %s và nhận được $%s", quantityToBuy, listing.item_label, sellerMoney),
            type = 'success'
        })
    else
        MySQL.query.await('UPDATE players SET money = JSON_SET(money, "$.bank", JSON_EXTRACT(money, "$.bank") + ?) WHERE citizenid = ?', {sellerMoney, listing.citizenid})
    end

    return { success = true, message = "Mua hàng thành công!" }
end)

lib.callback.register('marketplace:cancelOrder', function(source, orderId)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return { success = false, message = "Lỗi xác thực người chơi!" } end

    local listing = MySQL.single.await('SELECT * FROM marketplace_listings WHERE id = ? AND citizenid = ?', {orderId, Player.PlayerData.citizenid})

    if not listing then
        return { success = false, message = "Không tìm thấy đơn hàng!" }
    end

    MySQL.query.await('DELETE FROM marketplace_listings WHERE id = ?', {orderId})
    local metadata = json.decode(listing.metadata)
    exports.ox_inventory:AddItem(source, listing.item_name, listing.quantity, metadata)

    return { success = true, message = "Đã hủy bài đăng và hoàn vật phẩm!" }
end)

lib.callback.register('marketplace:toggleFavorite', function(source, itemName)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return { success = false } end

    local citizenid = Player.PlayerData.citizenid
    local exists = MySQL.scalar.await('SELECT id FROM marketplace_favorites WHERE citizenid = ? AND item_name = ?', {citizenid, itemName})
    
    if exists then
        MySQL.query.await('DELETE FROM marketplace_favorites WHERE id = ?', {exists})
        return { success = true, isFavorite = false }
    else
        MySQL.insert.await('INSERT INTO marketplace_favorites (citizenid, item_name) VALUES (?, ?)', {citizenid, itemName})
        return { success = true, isFavorite = true }
    end
end)