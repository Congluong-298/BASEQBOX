exports.qbx_core.CreateUseableItem("sleeping_bag", function(source, item)
    local durabilityLoss = {
        [1] = 0,
        [2] = item.metadata.durability - 34,
        [3] = item.metadata.durability - 17,
        [4] = item.metadata.durability - 9,
        [5] = item.metadata.durability - 4
    }

    local loss = durabilityLoss[item.metadata.level] or item.metadata.durability
    exports.ox_inventory:SetDurability(source, item.slot, loss)
    TriggerClientEvent('QBCore:GotoSleep', source, "bag")
end)

exports.qbx_core.CreateUseableItem("sua_chua_sleeping_bag", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    local sleepingBag = Player.Functions.GetItemByName("sleeping_bag")

    if not sleepingBag then
        TriggerClientEvent('QBCore:Notify', source, 'Bạn không có túi ngủ để sửa', 'error')
        return
    end

    if not sleepingBag.metadata or not sleepingBag.metadata.level or sleepingBag.metadata.level < 5 then
        TriggerClientEvent('QBCore:Notify', source, 'Chỉ có thể sửa túi ngủ cấp 5', 'error')
        return
    end

    exports.ox_inventory:SetDurability(source, sleepingBag.slot, 100)

    Player.Functions.RemoveItem("sua_chua_sleeping_bag", 1)
    TriggerClientEvent('QBCore:Notify', source, 'Đã sửa chữa túi ngủ về độ bền tối đa', 'success')
end)