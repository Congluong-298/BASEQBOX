local QBCore = exports['qb-core']:GetCoreObject()
local Config = require 'config.config'

local function CheckSlotItem(source, itemName)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return nil end

    local items = Player.Functions.GetItemsByName(itemName)
    return items
end

local function ActiveRemoveDurability(source, name)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local items = CheckSlotItem(source, name)
    if items and items[1] then
        local item = items[1]
        local metadata = item.info or {}
        local currentDurability = tonumber(metadata.durability) or 100
        local newDurability = math.max(currentDurability - (Config.RemoveDurabilityQuanlity[name] or 10), 0)

        metadata.durability = newDurability
        Player.Functions.SetItemSlot(item.slot, name, 1, metadata)

        if newDurability <= 1 then
            Player.Functions.RemoveItem(name, 1, item.slot)
        end
    end
end

local function ActiveAddDurability(source, name, number)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local items = CheckSlotItem(source, name)
    if items and items[1] then
        local item = items[1]
        local metadata = item.info or {}
        local currentDurability = tonumber(metadata.durability) or 100
        local newDurability = math.min(currentDurability + number, 100)

        metadata.durability = newDurability
        Player.Functions.SetItemSlot(item.slot, name, 1, metadata)
    end
end

local function ActiveCheckDurability(source, name)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end

    local items = CheckSlotItem(source, name)
    if items and items[1] then
        local item = items[1]
        local metadata = item.info or {}
        if metadata.durability ~= nil then
            return tonumber(metadata.durability) > 0.1
        else
            TriggerClientEvent('QBCore:Notify', source, 'Vật phẩm đã được cập nhật lại độ bền, hãy thử lại', 'info')
            metadata.durability = 100
            Player.Functions.SetItemSlot(item.slot, name, 1, metadata)
        end
    end

    return false
end

RegisterNetEvent('BL_DevMode:cb:ActiveAddDurability', function(itemname, number)
    local src = source
    ActiveAddDurability(src, itemname, number)
end)

RegisterNetEvent('BL_DevMode:cb:ActiveRemoveDurability', function(itemname)
    local src = source
    ActiveRemoveDurability(src, itemname)
end)

-- Xuất hàm
exports("ActiveAddDurability", ActiveAddDurability)
exports("ActiveRemoveDurability", ActiveRemoveDurability)
exports("ActiveCheckDurability", ActiveCheckDurability)
