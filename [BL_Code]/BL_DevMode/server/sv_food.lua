RegisterNetEvent('cigarettes:server:RemoveCigarette', function(hp, data)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)

    if hp == 1 then
        Player.Functions.RemoveItem('redwoodcigs', 1, data.slot)
        TriggerClientEvent("cigarettes:client:removeCigPack")
    else
        Player.PlayerData.items[data.slot].metadata.uses = Player.PlayerData.items[data.slot].metadata.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('cigarettes:server:RemoveCigarette', function(hp, data)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)

    if hp == 1 then
        Player.Functions.RemoveItem('yukoncigs', 1, data.slot)
        TriggerClientEvent("cigarettes:client:removeCigPack")
    else
        Player.PlayerData.items[data.slot].metadata.uses = Player.PlayerData.items[data.slot].metadata.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('cigarettes:server:RemoveCigarette', function(hp, data)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)

    if hp == 1 then
        Player.Functions.RemoveItem('cardiaquecigs', 1, data.slot)
        TriggerClientEvent("cigarettes:client:removeCigPack")
    else
        Player.PlayerData.items[data.slot].metadata.uses = Player.PlayerData.items[data.slot].metadata.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

exports.qbx_core.CreateUseableItem("vodka", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("coronabeer", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona", src, item.name)
end)

exports.qbx_core.CreateUseableItem("finlandia", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona2", src, item.name)
end)

exports.qbx_core.CreateUseableItem("beluga", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona3", src, item.name)
end)

exports.qbx_core.CreateUseableItem("colazero", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona4", src, item.name)
end)

exports.qbx_core.CreateUseableItem("blu", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:Drinkblu", src, item.name)
end)

exports.qbx_core.CreateUseableItem("gregos", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona5", src, item.name)
end)

exports.qbx_core.CreateUseableItem("yellowvodka", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona89", src, item.name)
end)

exports.qbx_core.CreateUseableItem("vangoghacai", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCorona6", src, item.name)
end)

exports.qbx_core.CreateUseableItem("redwoodcigs", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent('cigarettes:client:UseCigPack', src, item)
end)

exports.qbx_core.CreateUseableItem("cardiaquecigs", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent('cigarettes:client:UseCigPack', src, item)
end)

exports.qbx_core.CreateUseableItem("yukoncigs", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent('cigarettes:client:UseCigPack', src, item)
end)

exports.qbx_core.CreateUseableItem("whiskey", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("adrenaline", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:adrenaline12", src, item.name)
end)

--VU
exports.qbx_core.CreateUseableItem("v-class", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:Drink", src, item.name)
end)

exports.qbx_core.CreateUseableItem("v-hulk", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("v-dancerz", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("v-unicorn", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("v-sparkles", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("v-oldfashioned", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("v-manhattan", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("v-espressomartini", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("v-margarita", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("shot-absinthe", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("shot-fireball", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("shot-snakebite", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

exports.qbx_core.CreateUseableItem("shot-redsnapper", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

--Burger Shot

exports.qbx_core.CreateUseableItem("burgershot_bigking", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_bleeder", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_goatwrap", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatGoat", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_macaroon", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eatmacaroon", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_patatob", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatFries", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_patatos", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatFries", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_shotnuggets", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_shotrings", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatRings", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_thesmurfsicecream", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream4", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_smurfetteicecream", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_matchaicecream", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream4", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_ubeicecream", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_unicornicecream", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_vanillaicecream", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream3", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_chocolateicecream", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream2", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_strawberryicecream", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:ICECream", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_colab", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Cola2", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_colas", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Cola2", source, item.name)
end)

exports.qbx_core.CreateUseableItem("kurkakola", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Cola", source, item.name)
end)

exports.qbx_core.CreateUseableItem("burgershot_coffee", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:DrinkCoffee2", source, item.name)
end)

----------- / Eat

exports.qbx_core.CreateUseableItem("sandwich", function(source, item)
    if GlobalState.CountJobOnDuty['taco'] > 0 then 
        TriggerClientEvent("QBCore:Notify", source, "Không thể sử dụng khi nhà hàng đang hoạt động")
        return
    end
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("keo_chong_chong", function(source, item)
    if GlobalState.CountJobOnDuty['taco'] > 0 then 
        TriggerClientEvent("QBCore:Notify", source, "Không thể sử dụng khi nhà hàng đang hoạt động")
        return
    end
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:keochongchong", src, item.name)
    end
end)


exports.qbx_core.CreateUseableItem("tiramisu", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatCake", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("margherita", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("quinoa", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eatquinoa", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("chocolate", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatChocolate", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("medfruits", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatBeans", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("vegetariana", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("capricciosa", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizzaShalosh", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("diavola", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("prosciuttio", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("marinara", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizzaShalosh", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("twerks_candy", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatChocolate", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("tosti", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand", src, item.name)
    end
end)

-- CLUB77

exports.qbx_core.CreateUseableItem("clubedamame", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("clubhummus", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("clubschnitzels", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("clubchips", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("clubfriedplatter", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("tripcucumber", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:tripcucumber", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("clubfruitstray", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("clubvegetableplatter", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("clubarais", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("clubtrailmix", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatSand6", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("gelato", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Cream", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("cheesecake", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatCup", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("crisps", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatCrisps", src, item.name)
    end
end)


exports.qbx_core.CreateUseableItem("donut", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizzaDonut", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("croissant", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:croissant", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("cupchocolate", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:cupchocolate", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("cookie", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:cookie", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("snikkel_candy", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:snikkel_candy", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("water_bottle", function(source, item)
    if GlobalState.CountJobOnDuty['coolbeans'] > 0 then 
        TriggerClientEvent("QBCore:Notify", source, "Không thể sử dụng khi nhà hàng đang hoạt động")
        return
    end
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("beer", function(source, item)
    if GlobalState.CountJobOnDuty['coolbeans'] > 0 then 
        TriggerClientEvent("QBCore:Notify", source, "Không thể sử dụng khi nhà hàng đang hoạt động")
        return
    end
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkBeer", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("coke", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("coffee", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("ecocoffee", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("bigfruit", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:sipshake", src, item.name)
    end
end)


exports.qbx_core.CreateUseableItem("highnoon", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("speedball", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("gunkaccino", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("bratte", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("flusher", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("caffeagra", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("wings", function(source, item)
    TriggerClientEvent("qb-food:useFood", source, "wings")
end)

exports.qbx_core.CreateUseableItem("churro", function(source, item)
    TriggerClientEvent("qb-food:useFood", source, "churro")
end)

exports.qbx_core.CreateUseableItem("burrito", function(source, item)
    TriggerClientEvent("qb-food:useFood", source, "burrito")
end)

exports.qbx_core.CreateUseableItem("lsd", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:uselsd", src)
end)

exports.qbx_core.CreateUseableItem("joint", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint", src)
    end
end)

exports.qbx_core.CreateUseableItem("joint2", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint2", src)
    end
end)

exports.qbx_core.CreateUseableItem("joint3", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint3", src)
    end
end)

exports.qbx_core.CreateUseableItem("joint4", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint4", src)
    end
end)

exports.qbx_core.CreateUseableItem("joint5", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint5", src)
    end
end)

exports.qbx_core.CreateUseableItem("marijuana_joint3g", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    if Player.Functions.GetItemByName('lighter') ~= nil then
        TriggerClientEvent("consumables:client:UseWeed4g", src)
        Player.Functions.RemoveItem('marijuana_joint3g', 1)
    else
        TriggerClientEvent('QBCore:Notify', source, "You need a lighter", "error")
    end
end)

exports.qbx_core.CreateUseableItem("cigar", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.GetItemByName('lighter') ~= nil then
        TriggerClientEvent("consumables:client:Usecigar", source, item)
    else
        TriggerClientEvent('QBCore:Notify', source, "You need a lighter", "error")
    end
end)

RegisterServerEvent('smoke:cigar', function(item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    local info = {}
    info.uses = math.random(5,7)
    if Player.PlayerData.items[item.slot].metadata.uses - 1 == 0 then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['cigar'], "remove")
        Player.Functions.RemoveItem('cigar', 1)
    else
        Player.PlayerData.items[item.slot].metadata.uses = Player.PlayerData.items[item.slot].metadata.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)


exports.qbx_core.CreateUseableItem("coke_baggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:Cokebaggy", src)
end)

exports.qbx_core.CreateUseableItem("weed_baggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:weedbaggy", src)
end)

exports.qbx_core.CreateUseableItem("crack_baggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:Crackbaggy", src)
end)

exports.qbx_core.CreateUseableItem("xtcbaggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:EcstasyBaggy", src)
end)

exports.qbx_core.CreateUseableItem("oxy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:oxy", src)
end)

exports.qbx_core.CreateUseableItem("meth", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:meth", src)
end)

exports.qbx_core.CreateUseableItem("armor", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:UseArmor", src)
end)

exports.qbx_core.CreateUseableItem("heavyarmor", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:UseHeavyArmor", src)
end)

-- QBCore.Commands.Add("resetarmor", "Resets Vest (Police Only)", {}, false, function(source, args)
--     local src = source
--     local Player = exports.qbx_core.GetPlayer(src)
--     if Player.PlayerData.job.name == "police" then
--         TriggerClientEvent("consumables:client:ResetArmor", src)
--     else
--         TriggerClientEvent('QBCore:Notify', src,  "Chỉ dành cho cảnh sát", "error")
--     end
-- end)

exports.qbx_core.CreateUseableItem("binoculars", function(source, item)
    local src = source
    TriggerClientEvent("binoculars:Toggle", src)
end)

exports.qbx_core.CreateUseableItem("parachute", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseParachute", src)
    end
end)

-- QBCore.Commands.Add("resetparachute", "Resets Parachute", {}, false, function(source, args)
--     local src = source
-- 	TriggerClientEvent("consumables:client:ResetParachute", src)
-- end)

RegisterNetEvent('qb-smallpenis:server:AddParachute', function()
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    Player.Functions.AddItem("parachute", 1)
end)

exports.qbx_core.CreateUseableItem("firework1", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework")
end)

exports.qbx_core.CreateUseableItem("firework2", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework_v2")
end)

exports.qbx_core.CreateUseableItem("firework3", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_xmas_firework")
end)

exports.qbx_core.CreateUseableItem("firework4", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "scr_indep_fireworks")
end)

----------- / Lockpicking

exports.qbx_core.CreateUseableItem("uconnectair", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpickair", source, false)
end)

exports.qbx_core.CreateUseableItem("lockpick", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

exports.qbx_core.CreateUseableItem("pd_lockpick", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

exports.qbx_core.CreateUseableItem("advancedlockpick", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)

-- Create the cigarette
exports.qbx_core.CreateUseableItem("cigarette", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    if Player.Functions.GetItemByName("lighter") then
			if Player.Functions.RemoveItem(item.name, 1, item.slot) then
				TriggerClientEvent("cigarettes:client:UseCigarette", src)
			end
    else
        TriggerClientEvent("QBCore:Notify", source, "Bạn không có bật lửa", "error")
    end
end)

----------- / Unused

-- exports.qbx_core.CreateUseableItem("smoketrailred", function(source, item)
--     local Player = exports.qbx_core.GetPlayer(source)
-- 	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
--         TriggerClientEvent("consumables:client:UseRedSmoke", source)
--     end
-- end)

---------- / Thermal
exports.qbx_core.CreateUseableItem("thermalvision", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(src)
    TriggerClientEvent("consumables:client:useThermalVision", src, item.name)
end)

---------- / Ifak 
exports.qbx_core.CreateUseableItem("ifak",function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("consumables:client:UseiFak", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

exports.qbx_core.CreateUseableItem("bandage2",function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("consumables:client:bandage2", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

exports.qbx_core.CreateUseableItem("xanax",function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("consumables:client:xanax", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

exports.qbx_core.CreateUseableItem("yod",function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("consumables:client:yod", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

exports.qbx_core.CreateUseableItem("aspirin",function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("consumables:client:aspirin", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)

exports.qbx_core.CreateUseableItem("centrum",function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    TriggerClientEvent("consumables:client:centrum", source, item.name)
    Player.Functions.RemoveItem(item.name, 1)
end)


--------------------burgershot---------------------------------------------------

--Drinks
exports.qbx_core.CreateUseableItem("burger-softdrink", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("burger-mshake", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkShake", src, item.name)
    end
end)

--Food
exports.qbx_core.CreateUseableItem("burger-bleeder", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("taco-bleeder", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("burger-moneyshot", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("taco", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatTaco", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("chicken-burrito", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eatmacaroon2", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("nachos", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatCrisps", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("quesadilla", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eatquesadilla", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("beef-taco", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPho", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("banh_mi_thit_heo", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eatquinoa", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("pizza_ngon", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatPizza", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("nuoc_do", function(source, item)
    local Player = exports.qbx_core.GetPlayer(source)
    if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:DrinkHealthyTea", source, item.name)
end)
exports.qbx_core.CreateUseableItem("taco-moneyshot", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("burger-torpedo", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("taco-torpedo", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("burger-heartstopper", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("taco-heartstopper", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("burger-meatfree", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("taco-meatfree", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("burger-fries", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:EatFries", src, item.name)
    end
end)

------------Project Pangash
--restro
exports.qbx_core.CreateUseableItem("pangash_bhat", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("morog_polao", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("dim_polao", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("kacci", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("bengali_platter", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("roshomalai", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

exports.qbx_core.CreateUseableItem("cha", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("cocacola", function(source, item)
    if GlobalState.CountJobOnDuty['coolbeans'] > 0 then 
        TriggerClientEvent("QBCore:Notify", source, "Không thể sử dụng khi nhà hàng đang hoạt động")
        return
    end
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Cola", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("ecola", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Cola3", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("clubcola", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Cola3", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("sprunk", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Sprite", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("clubsprite", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Sprite", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("borhani", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("zirapani", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)
exports.qbx_core.CreateUseableItem("fuchka", function(source, item)
    local src = source
    local Player = exports.qbx_core.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
         TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)