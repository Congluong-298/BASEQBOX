QBCore = exports['qb-core']:GetCoreObject()

lib.addCommand('admin', {
    help = 'Open the admin menu',
    restricted = 'qbcore.mod'
}, function(source)
    if not QBCore.Functions.IsOptin(source) then TriggerClientEvent('QBCore:Notify', source, 'You are not on admin duty', 'error'); return end
    TriggerClientEvent('sgx-adminmenu:client:OpenUI', source)
end)
lib.addCommand('setfuel', {
    help = 'Set vehicle fuel amount',
    params = {
        {
            name = 'amount',
            type = 'number',
            help = 'Fuel amount (0-100)',
            optional = true
        },
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player ID (optional)',
            optional = true
        }
    },
    restricted = 'qbcore.mod'
}, function(source, args)
    if not QBCore.Functions.IsOptin(source) then 
        TriggerClientEvent('QBCore:Notify', source, 'You are not on admin duty', 'error')
        return 
    end
    
    local amount = args.amount or 100
    local targetId = args.target or source
    
    -- Validate fuel amount
    if amount < 0 or amount > 100 then
        TriggerClientEvent('QBCore:Notify', source, locale("fuel_invalid_amount"), 'error')
        return
    end
    
    -- Check if target player exists
    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    if not targetPlayer then
        TriggerClientEvent('QBCore:Notify', source, locale("not_online"), 'error')
        return
    end
    
    -- Trigger client event to set fuel
    TriggerClientEvent('sgx-adminmenu:client:SetFuel', targetId, amount, source)
end)

-- Command: Xóa nhân vật bằng player id hoặc citizenid
lib.addCommand('delchar', {
    help = 'Xóa nhân vật khỏi database bằng player id hoặc citizenid',
    params = {
        {
            name = 'id',
            type = 'string',
            help = 'Player ID hoặc citizenid',
            optional = false
        }
    },
    restricted = 'admin'
}, function(source, args)
    if not QBCore.Functions.IsOptin(source) then
        TriggerClientEvent('QBCore:Notify', source, 'Bạn chưa vào admin duty', 'error')
        return
    end

    local id = args.id
    local citizenid = nil
    local targetPlayer = QBCore.Functions.GetPlayer(tonumber(id))
    if targetPlayer then
        citizenid = targetPlayer.PlayerData.citizenid
    else
        citizenid = id
    end

    if not citizenid or #citizenid < 4 then
        TriggerClientEvent('QBCore:Notify', source, 'Không tìm thấy citizenid hợp lệ', 'error')
        return
    end

    -- Xóa nhân vật khỏi bảng players
    MySQL.Async.execute('DELETE FROM players WHERE citizenid = @citizenid', {['@citizenid'] = citizenid}, function(affectedRows)
        if affectedRows > 0 then
            -- Xóa các dữ liệu liên quan (xe, inventory, v.v. nếu cần)
            MySQL.Async.execute('DELETE FROM player_vehicles WHERE citizenid = @citizenid', {['@citizenid'] = citizenid})
            -- Thêm các bảng khác nếu cần
            TriggerClientEvent('QBCore:Notify', source, 'Đã xóa nhân vật và dữ liệu liên quan!', 'success')
        else
            TriggerClientEvent('QBCore:Notify', source, 'Không tìm thấy nhân vật với citizenid này!', 'error')
        end
    end)
end)

-- Command: Set Stress cho player
lib.addCommand('setstress', {
    help = 'Đặt mức stress cho người chơi',
    params = {
        {
            name = 'id',
            type = 'playerId',
            help = 'ID của người chơi',
            optional = false
        },
        {
            name = 'amount',
            type = 'number',
            help = 'Mức stress (0-100)',
            optional = false
        }
    },
    restricted = 'qbcore.mod'
}, function(source, args)
    if not QBCore.Functions.IsOptin(source) then
        TriggerClientEvent('QBCore:Notify', source, 'Bạn chưa vào admin duty', 'error')
        return
    end

    local targetId = args.id
    local amount = args.amount

    -- Validate stress amount
    if amount < 0 or amount > 100 then
        TriggerClientEvent('QBCore:Notify', source, 'Mức stress phải từ 0-100', 'error')
        return
    end

    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    if not targetPlayer then
        TriggerClientEvent('QBCore:Notify', source, locale("not_online"), 'error')
        return
    end

    -- Set stress
    targetPlayer.Functions.SetMetaData('stress', amount)
    TriggerClientEvent('hud:client:UpdateStress', targetId, amount)

    TriggerClientEvent('QBCore:Notify', source, 'Đã set stress cho player ' .. targetId .. ' = ' .. amount, 'success')
    -- TriggerClientEvent('QBCore:Notify', targetId, 'Admin đã set stress của bạn = ' .. amount, 'info')
end)

-- Command: Set Metadata cho player - mở menu
lib.addCommand('setmetadata', {
    help = 'Mở menu chỉnh sửa metadata người chơi',
    params = {
        {
            name = 'id',
            type = 'playerId',
            help = 'ID của người chơi',
            optional = false
        }
    },
    restricted = 'admin'
}, function(source, args)
    if not QBCore.Functions.IsOptin(source) then
        TriggerClientEvent('QBCore:Notify', source, 'Bạn chưa vào admin duty', 'error')
        return
    end

    local targetId = args.id
    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    
    if not targetPlayer then
        TriggerClientEvent('QBCore:Notify', source, locale("not_online"), 'error')
        return
    end

    -- Lấy thông tin player
    local playerData = {
        id = targetId,
        name = targetPlayer.PlayerData.charinfo.firstname .. ' ' .. targetPlayer.PlayerData.charinfo.lastname,
        citizenid = targetPlayer.PlayerData.citizenid,
        charinfo = {
            firstname = targetPlayer.PlayerData.charinfo.firstname,
            lastname = targetPlayer.PlayerData.charinfo.lastname,
            birthdate = targetPlayer.PlayerData.charinfo.birthdate,
            phone = targetPlayer.PlayerData.charinfo.phone,
            account = targetPlayer.PlayerData.charinfo.account or "N/A"
        }
    }

    -- Gửi dữ liệu đến client để mở menu
    TriggerClientEvent('sgx-adminmenu:client:OpenMetadataMenu', source, playerData)
end)

-- Server event để cập nhật thông tin player
RegisterNetEvent('sgx-adminmenu:server:UpdatePlayerInfo', function(targetId, data)
    local src = source
    
    if not QBCore.Functions.IsOptin(src) then
        TriggerClientEvent('QBCore:Notify', src, 'Bạn chưa vào admin duty', 'error')
        return
    end

    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    if not targetPlayer then
        TriggerClientEvent('QBCore:Notify', src, locale("not_online"), 'error')
        return
    end

    -- Cập nhật thông tin charinfo
    if data.firstname then
        targetPlayer.PlayerData.charinfo.firstname = data.firstname
    end
    if data.lastname then
        targetPlayer.PlayerData.charinfo.lastname = data.lastname
    end
    if data.birthdate then
        targetPlayer.PlayerData.charinfo.birthdate = data.birthdate
    end
    if data.phone then
        targetPlayer.PlayerData.charinfo.phone = data.phone
    end
    if data.account then
        targetPlayer.PlayerData.charinfo.account = data.account
    end

    -- Lưu charinfo vào database và sync
    targetPlayer.Functions.Save()

    TriggerClientEvent('QBCore:Notify', src, 'Đã cập nhật thông tin người chơi', 'success')
    TriggerClientEvent('QBCore:Notify', targetId, 'Thông tin của bạn đã được cập nhật bởi admin', 'info')
end)

-- Callbacks
