local QBCore = exports['qb-core']:GetCoreObject()
local SuGiaPed = nil

local npcCoords = vec4(-2033.8, -480.46, 10.63, 325.0) -- x, y, z, heading
local npcModel = `a_m_m_bevhills_02`

CreateThread(function()
    local SuGia_Blip = AddBlipForCoord(-2045.0, -489.38, 11.68)
    SetBlipSprite (SuGia_Blip, 304)
    SetBlipDisplay(SuGia_Blip, 5)
    SetBlipScale  (SuGia_Blip, 0.7)
    SetBlipAsShortRange(SuGia_Blip, true)
    SetBlipColour(SuGia_Blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("SỨ GIẢ SỰ KIỆN")
    EndTextCommandSetBlipName(SuGia_Blip)
end)

CreateThread(function()
    exports.ox_target:addBoxZone({
        coords = vec3(-2033.8, -480.46, 11.63),
        size = vec3(1, 1, 4),
        rotation = 325,
        debug = false,
        options = {
            {
                name = 'target_sugiasukien_option',
                event = 'BL_DevMode:client:sugia_sukien',
                icon = 'fa-solid fa-star',
                label = 'Nói chuyện',
                distance = 2.5
            },
        }
    })
end)

RegisterNetEvent("BL_DevMode:client:sugia_sukien", function()
    local pData = QBCore.Functions.GetPlayerData()
    local nTextTask = pData.metadata["task_questdolly"] or 0

    lib.registerContext({
        id = 'menu_sugia_main',
        title = 'SỨ GIẢ SỰ KIỆN',
        options = {
            {
                title = 'Đổi Gacha nhiệm vụ',
                description = 'Hiện có: '..nTextTask..' điểm',
                icon = 'shop',
                iconColor = '#FFA500',
                event = 'BL_DevMode:client:tuongtac_gachanhiemvu'
            },
            {
                title = 'Sự kiện: Tiêu diệt Zombie',
                description = 'Kiểm tra chi tiết về sự kiện',
                icon = 'biohazard',
                event = 'dt-zombie:client:MenuPed'
            },
            {
                title = 'Đến khu vực Câu cá biển',
                description = 'Di chuyển đến khu vực Câu cá biển',
                icon = 'fish',
                event = 'dt-cauca:client:nLen_KhuCauCa'
            },
            {
                title = 'Tham gia: Cướp Thùng Thính',
                description = 'Di chuyển đến khu vực Cướp Thùng Thính',
                icon = 'box-open',
                event = 'dt-airdrop:client:nGo_CuopThungThinh'
            }
        }
    })
    lib.showContext('menu_sugia_main')
end)

RegisterNetEvent("BL_DevMode:client:tuongtac_gachanhiemvu", function()
    lib.registerContext({
        id = 'menu_gacha_tasks',
        title = 'SỨ GIẢ SỰ KIỆN',
        menu = 'menu_sugia_main', -- Nút quay lại menu chính
        options = {
            {
                title = 'Gacha (Thường)',
                description = 'Cần: 120 điểm',
                icon = 'gift',
                event = 'BL_DevMode:client:doi_gachanhiemvu',
                args = 'gacha_thuong'
            },
            {
                title = 'Gacha (Đặc biệt)',
                description = 'Cần: 150 điểm',
                icon = 'star',
                event = 'BL_DevMode:client:doi_gachanhiemvu',
                args = 'gacha_dacbiet'
            },
            {
                title = 'Đổi xe lấy quà',
                description = 'Đổi phương tiện lấy quà tặng',
                icon = 'car',
                event = 'BL_DevMode:client:doi_phuongtien'
            }
        }
    })
    lib.showContext('menu_gacha_tasks')
end)

-- XỬ LÝ ĐỔI PHƯƠNG TIỆN (Dạng Loop)
RegisterNetEvent("BL_DevMode:client:doi_phuongtien", function()
    QBCore.Functions.TriggerCallback("BL_DevMode:server:nCheck_ListVehicle", function(nListVehicle)
        if not nListVehicle or next(nListVehicle) == nil then
            QBCore.Functions.Notify("Bạn không có phương tiện chính chủ nào", "error")
            return
        end

        local options = {}
        for k, v in pairs(nListVehicle) do
            local vehName = QBCore.Shared.Vehicles[v.model] and QBCore.Shared.Vehicles[v.model].name or v.model
            table.insert(options, {
                title = "Phương tiện: "..vehName,
                description = "Biển số: "..v.plate,
                icon = 'car-side',
                event = 'BL_DevMode:client:OptionsVehicle',
                args = { model = v.model, plate = v.plate }
            })
        end

        lib.registerContext({
            id = 'menu_list_xe',
            title = 'XÁC NHẬN ĐỔI PHƯƠNG TIỆN',
            menu = 'menu_gacha_tasks',
            options = options
        })
        lib.showContext('menu_list_xe')
    end)
end)

-- XÁC NHẬN CUỐI CÙNG
RegisterNetEvent("BL_DevMode:client:OptionsVehicle", function(data)
    local vehName = QBCore.Shared.Vehicles[data.model] and QBCore.Shared.Vehicles[data.model].name or data.model
    
    lib.registerContext({
        id = 'menu_confirm_exchange',
        title = 'XÁC NHẬN ĐỔI',
        menu = 'menu_list_xe',
        options = {
            {
                title = 'Đồng ý đổi '..vehName,
                description = 'Biển số: '..data.plate..'\nLưu ý: Không hoàn tác sau khi đổi!',
                icon = 'check',
                iconColor = '#2ecc71',
                event = 'BL_DevMode:client:DongY_Doi',
                args = { name = data.model, plate = data.plate }
            },
            {
                title = 'Hủy bỏ',
                icon = 'xmark',
                iconColor = '#e74c3c',
                onSelect = function()
                    lib.showContext('menu_list_xe')
                end
            }
        }
    })
    lib.showContext('menu_confirm_exchange')
end)

RegisterNetEvent("BL_DevMode:client:DongY_Doi", function(data)
    if data.name == "faggio" or data.name == "blista" or data.name == "faggio3" then
        TriggerServerEvent("BL_DevMode:server:Sv_DongY", data.name, data.plate)
    else
        QBCore.Functions.Notify("Chỉ cho phép đổi Faggio, Faggio Mod và Blista", "error")
    end
end)

RegisterNetEvent("BL_DevMode:client:doi_gachanhiemvu", function(status)
    local pData = QBCore.Functions.GetPlayerData()
    local points = pData.metadata["task_questdolly"] or 0
    local required = (status == "gacha_thuong") and 120 or 150

    if points >= required then
        TriggerServerEvent("BL_DevMode:server:xacnhan_doigacha", status)
    else
        QBCore.Functions.Notify("Bạn không đủ điểm (Cần " .. required .. ")", "error")
    end
end)

RegisterNetEvent("BL_DevMode:client:doi_gachanhiemvu", function(status)
    if status == "gacha_thuong" then
        if not QBCore.Functions.GetPlayerData().metadata["task_questdolly"] then
            TriggerServerEvent("dt-quest:server:XacNhan_Task")
        else
            if QBCore.Functions.GetPlayerData().metadata["task_questdolly"] >= 120 then
                TriggerServerEvent("BL_DevMode:server:xacnhan_doigacha", "gacha_thuong")
            else
                QBCore.Functions.Notify("Cần ít nhất 120 điểm để đổi Gacha này", "error")
            end
        end
    elseif status == "gacha_dacbiet" then
        if not QBCore.Functions.GetPlayerData().metadata["task_questdolly"] then
            TriggerServerEvent("dt-quest:server:XacNhan_Task")
        else
            if QBCore.Functions.GetPlayerData().metadata["task_questdolly"] >= 150 then
                TriggerServerEvent("BL_DevMode:server:xacnhan_doigacha", "gacha_dacbiet")
            else
                QBCore.Functions.Notify("Cần ít nhất 150 điểm để đổi Gacha này", "error")
            end
        end
    end
end)