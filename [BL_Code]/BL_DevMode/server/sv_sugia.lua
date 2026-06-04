-- local QBCore = exports['qb-core']:GetCoreObject()

-- RegisterServerEvent("BL_DevMode:server:Sv_DongY", function(nNameVeh, nPlateVeh, nPoint)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)

--     local garageresult = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid})

--     for a, b in pairs(garageresult) do
--         if b.vehicle == nNameVeh and b.plate == nPlateVeh then
--             MySQL.query('DELETE FROM player_vehicles WHERE plate = ? AND vehicle = ?', {nPlateVeh, nNameVeh})
--             -- Player.Functions.SetMetaData("task_questdolly", Player.PlayerData.metadata["task_questdolly"] + nPoint)
--             if nNameVeh == "faggio" then
--                 Player.Functions.AddItem("chiakhoa_khobau", 1)
--                 Player.Functions.AddItem("hom_yaz", 1)
--                 TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chiakhoa_khobau"], "add")
--                 TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hom_yaz"], "add")
--                 TriggerClientEvent('QBCore:Notify', src, "Đổi thành công "..QBCore.Shared.Vehicles[nNameVeh].name.." - Biển số: "..nPlateVeh.."", "success", 5000)
--                 TriggerEvent('qb-log:server:CreateLog', 'log_doixe', '**ĐỔI XE LẤY QUÀ**', 'orange', 
--                 '\n- Tên nhân vật: `'..Player.PlayerData.charinfo.firstname..''..Player.PlayerData.charinfo.lastname..
--                 '`\n- CitizenID: `'..Player.PlayerData.citizenid..
--                 '`\n- ID hiện tại: `'..Player.PlayerData.source..
--                 '`\n- Đã đổi: `'..QBCore.Shared.Vehicles[nNameVeh].name..
--                 '`\n- Biển số: `'..nPlateVeh..
--                 '`\n- Số điểm nhận được: **x1 Chìa khóa kho báu & x1 Hòm yaz**', false) -- True là tag @everyone
--             elseif nNameVeh == "faggio3" then
--                 Player.Functions.AddItem("chiakhoa_khobau", 1)
--                 Player.Functions.AddItem("hom_sieucap", 1)
--                 TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chiakhoa_khobau"], "add")
--                 TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hom_sieucap"], "add")
--                 TriggerClientEvent('QBCore:Notify', src, "Đổi thành công "..QBCore.Shared.Vehicles[nNameVeh].name.." - Biển số: "..nPlateVeh.."", "success", 5000)
--                 TriggerEvent('qb-log:server:CreateLog', 'log_doixe', '**ĐỔI XE LẤY QUÀ**', 'orange', 
--                 '\n- Tên nhân vật: `'..Player.PlayerData.charinfo.firstname..''..Player.PlayerData.charinfo.lastname..
--                 '`\n- CitizenID: `'..Player.PlayerData.citizenid..
--                 '`\n- ID hiện tại: `'..Player.PlayerData.source..
--                 '`\n- Đã đổi: `'..QBCore.Shared.Vehicles[nNameVeh].name..
--                 '`\n- Biển số: `'..nPlateVeh..
--                 '`\n- Số điểm nhận được: **x1 Chìa khóa kho báu & x1 Hòm siêu cấp**', false) -- True là tag @everyone
--             elseif nNameVeh == "blista" then
--                 Player.Functions.AddItem("chiakhoa_khobau", 2)
--                 Player.Functions.AddItem("hom_yaz", 1)
--                 TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chiakhoa_khobau"], "add")
--                 TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hom_yaz"], "add")
--                 TriggerClientEvent('QBCore:Notify', src, "Đổi thành công "..QBCore.Shared.Vehicles[nNameVeh].name.." - Biển số: "..nPlateVeh.."", "success", 5000)
--                 TriggerEvent('qb-log:server:CreateLog', 'log_doixe', '**ĐỔI XE LẤY QUÀ**', 'orange', 
--                 '\n- Tên nhân vật: `'..Player.PlayerData.charinfo.firstname..''..Player.PlayerData.charinfo.lastname..
--                 '`\n- CitizenID: `'..Player.PlayerData.citizenid..
--                 '`\n- ID hiện tại: `'..Player.PlayerData.source..
--                 '`\n- Đã đổi: `'..QBCore.Shared.Vehicles[nNameVeh].name..
--                 '`\n- Biển số: `'..nPlateVeh..
--                 '`\n- Số điểm nhận được: **x2 Chìa khóa kho báu & x1 Hòm yaz**', false) -- True là tag @everyone
--             end
--         end
--     end
-- end)

-- QBCore.Functions.CreateCallback('BL_DevMode:server:nCheck_ListVehicle', function(source, cb)
--     local Player = QBCore.Functions.GetPlayer(source)
--     local CitizenId = Player.PlayerData.citizenid

--     local garageresult = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid})
--     if garageresult[1] ~= nil then
--         for k, v in pairs(garageresult) do
--             local vehicleModel = v.vehicle
--             if (QBCore.Shared.Vehicles[vehicleModel] ~= nil) then
--                 v.model = QBCore.Shared.Vehicles[vehicleModel].model
--             end
--         end
--     end
--     cb(garageresult)
-- end)

-- RegisterServerEvent("BL_DevMode:server:xacnhan_doigacha", function(nStatus)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local nCheck_TaskGacha = Player.PlayerData.metadata["task_questdolly"]

--     if nCheck_TaskGacha ~= nil then
--         if nStatus == "gacha_thuong" then
--             if nCheck_TaskGacha >= 120 then
--                 Player.Functions.SetMetaData("task_questdolly", Player.PlayerData.metadata["task_questdolly"] - 120)
--                 TriggerClientEvent("dt-ruongkhobau:opencase", src, "gacha_nhiemvu_thuong", "CJZXHCJH7873874ERHJSD")
--             else
--                 TriggerClientEvent('QBCore:Notify', src, "Cần ít nhất 120 điểm để đổi Gacha này", "error", 3000)
--             end
--         elseif nStatus == "gacha_dacbiet" then
--             if nCheck_TaskGacha >= 150 then
--                 Player.Functions.SetMetaData("task_questdolly", Player.PlayerData.metadata["task_questdolly"] - 150)
--                 TriggerClientEvent("dt-ruongkhobau:opencase", src, "gacha_nhiemvu_dacbiet", "CJZXHCJH7873874ERHJSD")
--             else
--                 TriggerClientEvent('QBCore:Notify', src, "Cần ít nhất 150 điểm để đổi Gacha này", "error", 3000)
--             end
--         end
--     else
--         TriggerClientEvent('QBCore:Notify', src, "Bạn không có điểm để đổi", "error", 3000)
--     end
-- end)

-- -- QBCore.Commands.Add("addpoint", "AP", {}, false, function(source, args)
-- -- 	local src = source
-- --     local Player = QBCore.Functions.GetPlayer(src)
-- --     Player.Functions.SetMetaData("task_questdolly", 100)
-- -- end, "admin")

local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("BL_DevMode:server:Sv_DongY", function(nNameVeh, nPlateVeh, nPoint)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Đã đổi MySQL.Sync thành MySQL.query.await cho chuẩn oxmysql mới
    local garageresult = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid})

    for a, b in pairs(garageresult) do
        if b.vehicle == nNameVeh and b.plate == nPlateVeh then
            
            if nNameVeh == "faggio" then
                -- Kiểm tra xem túi đồ có đủ chỗ trống không (ox_inventory)
                if exports.ox_inventory:CanCarryItem(src, "chiakhoa_khobau", 1) and exports.ox_inventory:CanCarryItem(src, "hom_yaz", 1) then
                    MySQL.query('DELETE FROM player_vehicles WHERE plate = ? AND vehicle = ?', {nPlateVeh, nNameVeh})
                    
                    exports.ox_inventory:AddItem(src, "chiakhoa_khobau", 1)
                    exports.ox_inventory:AddItem(src, "hom_yaz", 1)
                    
                    TriggerClientEvent('QBCore:Notify', src, "Đổi thành công "..QBCore.Shared.Vehicles[nNameVeh].name.." - Biển số: "..nPlateVeh.."", "success", 5000)
                    TriggerEvent('qb-log:server:CreateLog', 'log_doixe', '**ĐỔI XE LẤY QUÀ**', 'orange', 
                    '\n- Tên nhân vật: `'..Player.PlayerData.charinfo.firstname..''..Player.PlayerData.charinfo.lastname..
                    '`\n- CitizenID: `'..Player.PlayerData.citizenid..
                    '`\n- ID hiện tại: `'..Player.PlayerData.source..
                    '`\n- Đã đổi: `'..QBCore.Shared.Vehicles[nNameVeh].name..
                    '`\n- Biển số: `'..nPlateVeh..
                    '`\n- Số điểm nhận được: **x1 Chìa khóa kho báu & x1 Hòm yaz**', false)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Túi đồ của bạn quá đầy, không thể nhận quà!", "error", 5000)
                end

            elseif nNameVeh == "faggio3" then
                if exports.ox_inventory:CanCarryItem(src, "chiakhoa_khobau", 1) and exports.ox_inventory:CanCarryItem(src, "hom_sieucap", 1) then
                    MySQL.query('DELETE FROM player_vehicles WHERE plate = ? AND vehicle = ?', {nPlateVeh, nNameVeh})
                    
                    exports.ox_inventory:AddItem(src, "chiakhoa_khobau", 1)
                    exports.ox_inventory:AddItem(src, "hom_sieucap", 1)
                    
                    TriggerClientEvent('QBCore:Notify', src, "Đổi thành công "..QBCore.Shared.Vehicles[nNameVeh].name.." - Biển số: "..nPlateVeh.."", "success", 5000)
                    TriggerEvent('qb-log:server:CreateLog', 'log_doixe', '**ĐỔI XE LẤY QUÀ**', 'orange', 
                    '\n- Tên nhân vật: `'..Player.PlayerData.charinfo.firstname..''..Player.PlayerData.charinfo.lastname..
                    '`\n- CitizenID: `'..Player.PlayerData.citizenid..
                    '`\n- ID hiện tại: `'..Player.PlayerData.source..
                    '`\n- Đã đổi: `'..QBCore.Shared.Vehicles[nNameVeh].name..
                    '`\n- Biển số: `'..nPlateVeh..
                    '`\n- Số điểm nhận được: **x1 Chìa khóa kho báu & x1 Hòm siêu cấp**', false)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Túi đồ của bạn quá đầy, không thể nhận quà!", "error", 5000)
                end

            elseif nNameVeh == "blista" then
                if exports.ox_inventory:CanCarryItem(src, "chiakhoa_khobau", 2) and exports.ox_inventory:CanCarryItem(src, "hom_yaz", 1) then
                    MySQL.query('DELETE FROM player_vehicles WHERE plate = ? AND vehicle = ?', {nPlateVeh, nNameVeh})
                    
                    exports.ox_inventory:AddItem(src, "chiakhoa_khobau", 2)
                    exports.ox_inventory:AddItem(src, "hom_yaz", 1)
                    
                    TriggerClientEvent('QBCore:Notify', src, "Đổi thành công "..QBCore.Shared.Vehicles[nNameVeh].name.." - Biển số: "..nPlateVeh.."", "success", 5000)
                    TriggerEvent('qb-log:server:CreateLog', 'log_doixe', '**ĐỔI XE LẤY QUÀ**', 'orange', 
                    '\n- Tên nhân vật: `'..Player.PlayerData.charinfo.firstname..''..Player.PlayerData.charinfo.lastname..
                    '`\n- CitizenID: `'..Player.PlayerData.citizenid..
                    '`\n- ID hiện tại: `'..Player.PlayerData.source..
                    '`\n- Đã đổi: `'..QBCore.Shared.Vehicles[nNameVeh].name..
                    '`\n- Biển số: `'..nPlateVeh..
                    '`\n- Số điểm nhận được: **x2 Chìa khóa kho báu & x1 Hòm yaz**', false)
                else
                    TriggerClientEvent('QBCore:Notify', src, "Túi đồ của bạn quá đầy, không thể nhận quà!", "error", 5000)
                end
            end
            
            break -- Rất quan trọng: Ngắt vòng lặp sau khi đã tìm thấy và xóa xe để tránh bug nhân đôi
        end
    end
end)

QBCore.Functions.CreateCallback('BL_DevMode:server:nCheck_ListVehicle', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid

    local garageresult = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ?', {CitizenId})
    if garageresult and garageresult[1] ~= nil then
        for k, v in pairs(garageresult) do
            local vehicleModel = v.vehicle
            if (QBCore.Shared.Vehicles[vehicleModel] ~= nil) then
                v.model = QBCore.Shared.Vehicles[vehicleModel].model
            end
        end
    end
    cb(garageresult)
end)

RegisterServerEvent("BL_DevMode:server:xacnhan_doigacha", function(nStatus)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local nCheck_TaskGacha = Player.PlayerData.metadata["task_questdolly"]

    if nCheck_TaskGacha ~= nil then
        if nStatus == "gacha_thuong" then
            if nCheck_TaskGacha >= 120 then
                Player.Functions.SetMetaData("task_questdolly", Player.PlayerData.metadata["task_questdolly"] - 120)
                TriggerClientEvent("dt-ruongkhobau:opencase", src, "gacha_nhiemvu_thuong", "CJZXHCJH7873874ERHJSD")
            else
                TriggerClientEvent('QBCore:Notify', src, "Cần ít nhất 120 điểm để đổi Gacha này", "error", 3000)
            end
        elseif nStatus == "gacha_dacbiet" then
            if nCheck_TaskGacha >= 150 then
                Player.Functions.SetMetaData("task_questdolly", Player.PlayerData.metadata["task_questdolly"] - 150)
                TriggerClientEvent("dt-ruongkhobau:opencase", src, "gacha_nhiemvu_dacbiet", "CJZXHCJH7873874ERHJSD")
            else
                TriggerClientEvent('QBCore:Notify', src, "Cần ít nhất 150 điểm để đổi Gacha này", "error", 3000)
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Bạn không có điểm để đổi", "error", 3000)
    end
end)

-- QBCore.Commands.Add("addpoint", "AP", {}, false, function(source, args)
-- 	local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     Player.Functions.SetMetaData("task_questdolly", 100)
-- end, "admin")