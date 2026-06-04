local QBCore = exports['qb-core']:GetCoreObject()

local function CheckItemDurability(name)
    local PlayerData = QBCore.Functions.GetPlayerData()
    for slot, item in pairs(PlayerData.items or {}) do
        if item.name == name and item.info and item.info.durability then
            local durability = tonumber(item.info.durability)
            if durability and durability > 0.1 then
                return durability
            end
        end
    end
    return 0
end

exports('CheckItemDurability', CheckItemDurability)
