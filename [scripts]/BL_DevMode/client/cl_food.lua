function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1000)
    end
end

function TaskItem(dictionary, animation, typeAnim, timer, message, func, remove,
                  itemid, vehicle)
    loadAnimDict(dictionary)
    TaskPlayAnim(cache.ped, dictionary, animation, 8.0, 1.0, -1, typeAnim, 0, NetworkForceLocalUseOfSyncedSceneCamera(netScene, animDict, animName),
        false, false)
    local timer = tonumber(timer)
    if timer > 0 then
        QBCore.Functions.Progressbar("idkidk", message, timer, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false
        }, {}, {}, {}, function() -- Done
            TriggerEvent(func, itemid)
        end, {})
    else
        TriggerEvent(func, itemid)
    end
end

function AttachPropAndPlayAnimation(dictionary, animation, typeAnim, timer,
                                    message, func, remove, itemid, vehicle)
    if itemid == "burger" or itemid == "burgerz" or itemid == "doubleburgerz" or
        itemid == "tripleburgerz" or itemid == "potatochips" or itemid ==
        "onionrings" or itemid == "heartstopper" or itemid == "bleederburger" or
        itemid == "moneyshot" then
        TriggerEvent("attachItem", "hamburger")
    elseif itemid == "sandwich" or itemid == "noodles" or itemid == "ramen" or
        itemid == "sushi" then
        TriggerEvent("attachItem", "sandwich")
    elseif itemid == "toast" then
        TriggerEvent("attachItem", "sandwich")
    elseif itemid == "donut" or itemid == "pizza" or itemid == "pizza_box" then
    elseif itemid == "beer" or itemid == "vodka" or itemid == "whiskey" or
        itemid == "champagne" or itemid == "tequila" or itemid == "whitewine" or
        itemid == "absinthe" then
        TriggerEvent("attachItem", itemid)
    elseif itemid == "taco" or itemid == "fishtaco" or itemid == "diavola" or
        itemid == "cluckin-balls" or itemid == "tacos" or itemid ==
        "cluckin-fries" or itemid == "little-clucker" or itemid == "torpedo" then
        TriggerEvent("attachItem", "taco", "diavola")
    elseif itemid == "frappuccino" or itemid == "coffee" or itemid ==
        "ecocoffee" or itemid == "bigfruit" or itemid == "highnoon" or itemid ==
        "speedball" or itemid == "gunkaccino" or itemid == "bratte" or itemid ==
        "flusher" or itemid == "caffeagra" or itemid == "latte" or itemid ==
        "capuchino" then
        TriggerEvent("attachItem", "coffee")
    elseif itemid == "twerks_candy" or itemid == "snikkel_candy" then
        TriggerEvent("attachItem", "ego")
    elseif itemid == "greencow" then
        TriggerEvent("attachItem", "energydrink")
    elseif itemid == "glasswine" or itemid == "bloodymary" or itemid ==
        "bluesake" or itemid == "goldsake" or itemid == "pinksake" or itemid ==
        "samuraisake" or itemid == "whitesake" or itemid == "plumsake" then
        TriggerEvent("attachItem", "glasswine")
    elseif itemid == "water_bottle" then
        TriggerEvent("attachItem", "water")
    elseif itemid == "dusche" then
        TriggerEvent("attachItem", "dusche")
    elseif itemid == "glasswhiskey" then
        TriggerEvent("attachItem", "glasswhiskey")
    elseif itemid == "slushy" or itemid == "orangeslushy" or itemid ==
        "greenslushy" or itemid == "blueslushy" or itemid == "yellowslushy" or
        itemid == "cluckin-drink" then
        TriggerEvent("attachItem", "cup")
    elseif itemid == "cocacola" or itemid == "ecola" or itemid == "sprunk" then
        TriggerEvent("attachItem", "cola")
    elseif itemid == "spirte" then
        TriggerEvent("attachItem", "sprunk")
    end
    TaskItem(dictionary, animation, typeAnim, timer, message, func, remove,
        itemid, vehicle)
end

function AddArmor()
    local a = 15
    while a > 0 do
        Citizen.Wait(math.random(750, 1150))
        a = a - 1
        AddArmourToPed(cache.ped, 1)
    end
end

function AddHealth()
    if not healing then
        healing = true
    else
        return
    end

    local count = 30
    while count > 0 do
        Citizen.Wait(1000)
        count = count - 1
        SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) + 1)
    end
    healing = false
end

function AddHealthFruit()
    if not healing then
        healing = true
    else
        return
    end

    local count = 15
    while count > 0 do
        Citizen.Wait(1000)
        count = count - 1
        SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) + 1)
    end
    healing = false
end

RegisterNetEvent('qb-food:useFood')
AddEventHandler('qb-food:useFood', function(itemid)
    local alcoholStrength = 0.5
    TriggerServerEvent("QBCore:Server:RemoveItem", itemid, 1)
    if itemid == "burger" or itemid == "meat" or itemid == "wings" or itemid ==
        "churro" or itemid == "taco" or itemid == "diavola" or itemid ==
        "fishtaco" or itemid == "torpedo" or itemid == "torta" or itemid ==
        "fowlburger" or itemid == "bleederburger" or itemid == "moneyshot" or
        itemid == "heartstopper" or itemid == "meatfree" or itemid == "sandwich" or
        itemid == "toast" or itemid == "jailfood" or itemid == "pizza" or itemid ==
        "pizza_box" or itemid == "keo_chong_chong" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger",
            "mp_player_int_eat_burger", 49, 6000,
            "Eating", "consumables:client:EatS", true,
            itemid, cache.vehicle)
    end

    if itemid == "vanil" or itemid == "donutvanil" or itemid == "oreodonut" or
        itemid == "strawberryice" or itemid == "chocolateice" or itemid ==
        "chokovanillice" or itemid == "cherryice" or itemid == "blueberrydonut" or
        itemid == "candydonut" or itemid == "aliendonut" or itemid ==
        "pepedonut" or itemid == "crazydonut" or itemid == "surpisedonut" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger",
            "mp_player_int_eat_burger", 49, 6000,
            "Eating", "consumables:client:EatS", true,
            itemid, cache.vehicle)
    end

    if itemid == "donut" or itemid == "fries" or itemid == "frenchtoast" or
        itemid == "waffle" or itemid == "twerks_candy" or itemid ==
        "snikkel_candy" or itemid == "noodles" or itemid == "ramen" or itemid ==
        "sushi" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger",
            "mp_player_int_eat_burger", 49, 6000,
            "Eating", "consumables:client:EatS", true,
            itemid, cache.vehicle)
    end

    if itemid == "eggsbacon" or itemid == "torpedo" or itemid == "photdog" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger",
            "mp_player_int_eat_burger", 49, 6000,
            "Eating", "food:Condiment", true, itemid,
            cache.vehicle)
    end

    if itemid == "apple" or itemid == "banana" or itemid == "cherry" or itemid ==
        "coconut" or itemid == "grapes" or itemid == "kiwi" or itemid == "lemon" or
        itemid == "lime" or itemid == "orange" or itemid == "peach" or itemid ==
        "strawberry" or itemid == "watermelon" or itemid == "hotdog" or itemid ==
        "mango" or itemid == "lichi" or itemid == "pineapple" or itemid ==
        "pear" or itemid == "melon" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger",
            "mp_player_int_eat_burger", 49, 6000,
            "Eating", "consumables:client:EatS", true,
            itemid, cache.vehicle)
        AddHealthFruit()
    end

    if itemid == "applejuice" or itemid == "bananajuice" or itemid ==
        "cherryjuice" or itemid == "coconutjuice" or itemid == "grapesjuice" or
        itemid == "kiwijuice" or itemid == "lemonjuice" or itemid == "limejuice" or
        itemid == "orangejuice" or itemid == "peachjuice" or itemid ==
        "strawberryjuice" or itemid == "watermelonjuice" or itemid ==
        "melonjuice" or itemid == "lichijuice" or itemid == "mangojuice" or
        itemid == "pearjuice" or itemid == "pineapplejuice" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
        AddHealthFruit()
    end

    if itemid == "spirte" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
    end

    if itemid == "beer" or itemid == "champagne" or itemid == "glasswine" or
        itemid == "glassbeer" or itemid == "glasschampagne" or itemid ==
        "dusche" or itemid == "whitewine" or itemid == "pinacolada" then
        alcoholStrength = 2.1
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
        TriggerEvent("fx:run", "alcohol", 180, alcoholStrength, -1, false)
    end

    if itemid == "whiskey" or itemid == "vodka" or itemid == "glasswhiskey" or
        itemid == "bloodymary" or itemid == "tequila" or itemid == "tequilashot" then
        alcoholStrength = 3.6
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
        TriggerEvent("fx:run", "alcohol", 180, alcoholStrength, -1, false)
    end

    if itemid == "absinthe" then
        alcoholStrength = 4.6
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
        TriggerEvent("fx:run", "alcohol", 180, alcoholStrength, -1, false)
        TriggerEvent("fx:run", "weed", 180, -1, false)
    end

    if itemid == "shot1" or itemid == "shot2" or itemid == "shot3" or itemid ==
        "shot4" or itemid == "shot5" or itemid == "shot6" or itemid == "shot7" or
        itemid == "shot8" or itemid == "shot9" or itemid == "shot10" then
        alcoholStrength = 2.5
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
        TriggerEvent("fx:run", "alcohol", 180, alcoholStrength, -1, false)
    end

    if itemid == "water_bottle" or itemid == "cocacola" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
    end

    if itemid == "bluesake" or itemid == "goldsake" or itemid == "pinksake" or
        itemid == "samuraisake" or itemid == "whitesake" or itemid == "plumsake" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,
            "Drink", "food:Condiment", true, itemid, cache.vehicle)
    end

    if itemid == "greencow" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
    end

    if itemid == "slushy" or itemid == "cluckin-drink" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
    end

    if itemid == "burgerz" or itemid == "doubleburgerz" or itemid ==
        "tripleburgerz" or itemid == "potatochips" or itemid == "onionrings" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger",
            "mp_player_int_eat_burger", 49, 6000,
            "Eating", "consumables:client:EatS", true,
            itemid, cache.vehicle)
    end

    if itemid == "chicken-bucket" or itemid == "cluckin-balls" or itemid ==
        "tacos" or itemid == "cluckin-fries" or itemid == "little-clucker" or
        itemid == "muffin" or itemid == "veggy-salad" then
        AttachPropAndPlayAnimation("mp_player_inteat@burger",
            "mp_player_int_eat_burger", 49, 6000,
            "Eating", "consumables:client:EatS", true,
            itemid, cache.vehicle)
    end

    if itemid == "orangeslushy" or itemid == "greenslushy" or itemid ==
        "blueslushy" or itemid == "yellowslushy" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,
            "Drinking", "consumables:client:DrinkS", true, itemid, cache.vehicle)
    end

    if itemid == "coffee" or itemid == "frappuccino" or itemid == "caffeagra" or
        itemid == "ecocoffee" or itemid == "bigfruit" or itemid == "highnoon" or
        itemid == "speedball" or itemid == "gunkaccino" or itemid == "bratte" or
        itemid == "latte" or itemid == "capuchino" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49, 6000,
            "Drink", "consumables:client:DrinkS", true, itemid, cache.vehicle)
    end

    if itemid == "icecream" or itemid == "mshake" then
        AttachPropAndPlayAnimation(
            "amb@world_human_drinking@beer@female@idle_a", "idle_e", 49, 6000,
            "Drinking", "consumables:client:DrinkS", true, itemid, cache.vehicle)
    end

    if itemid == "adrenaline" then
        QBCore.Functions.Progressbar("use_adrenaline", "using adrenaline", 5000,
            true, false, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "amb@world_human_clipboard@male@idle_a",
                anim = "idle_c",
                flags = 50
            }, {}, {}, function() -- Done
                TriggerEvent("food:Condiment", "adrenaline")
                StopAnimTask(GetPlayerPed(-1),
                    "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
            end, function() -- Cancel
                StopAnimTask(GetPlayerPed(-1),
                    "amb@world_human_clipboard@male@idle_a", "idle_c", 1.0)
                QBCore.Functions.Notify("Canceled", "error")
            end)
    end
end)

local Consumeables = {
    ["coffee"] = math.random(40, 50),
    ["bean-latte"] = math.random(40, 50),
    ["bean-cappuccino"] = math.random(40, 50),
    ["bean-mocha"] = math.random(40, 50),
    ["bean-cmilkshake"] = math.random(40, 50),
    ["bean-icetea"] = math.random(40, 50),
    ["ecocoffee"] = math.random(25, 50),
    ["bigfruit"] = math.random(40, 45),
    ["highnoon"] = math.random(55, 60),
    ["speedball"] = math.random(25, 50),
    ["gunkaccino"] = math.random(25, 50),
    ["bratte"] = math.random(25, 50),
    ["flusher"] = math.random(25, 50),
    ["caffeagra"] = math.random(25, 50),
    ["latte"] = math.random(20, 40),
    ["capuchino"] = math.random(20, 40),
    ["frappuccino"] = math.random(20, 40),
    ["cocacola"] = math.random(15, 25),
    ["ecola"] = math.random(15, 25),
    ["sprunk"] = math.random(15, 25),
    ["greencow"] = math.random(5, 10),
    ["spirte"] = math.random(15, 25),
    ["slushy"] = math.random(15, 27),
    ["orangeslushy"] = math.random(15, 27),
    ["greenslushy"] = math.random(15, 27),
    ["blueslushy"] = math.random(15, 27),
    ["yellowslushy"] = math.random(15, 27),
    ["fishtaco"] = math.random(20, 40),
    ["torta"] = math.random(20, 40),
    ["wings"] = math.random(20, 40),
    ["eggsbacon"] = math.random(20, 40),
    ["burgerz"] = math.random(15, 20),
    ["doubleburgerz"] = math.random(15, 20),
    ["tripleburgerz"] = math.random(15, 20),
    ["potatochips"] = math.random(15, 20),
    ["onionrings"] = math.random(15, 20),
    ["noodles"] = math.random(15, 20),
    ["ramen"] = math.random(15, 20),
    ["sushi"] = math.random(15, 20),
    ["bluesake"] = math.random(15, 20),
    ["goldsake"] = math.random(15, 20),
    ["pinksake"] = math.random(15, 20),
    ["samuraisake"] = math.random(15, 20),
    ["whitesake"] = math.random(15, 20),
    ["plumsake"] = math.random(15, 20),
    ["donut"] = math.random(15, 20),
    ["waffle"] = math.random(15, 20),
    ["frenchtoast"] = math.random(15, 20),
    ["fries"] = math.random(15, 20),
    ["churro"] = math.random(15, 20),
    ["hotdog"] = math.random(15, 20),
    ["photdog"] = math.random(15, 20),
    ["adrenaline"] = math.random(15, 30),
    ["jailfood"] = math.random(25, 50),
    ["moneyshot"] = math.random(35, 45),
    ["heartstopper"] = math.random(60, 75),
    ["bleederburger"] = math.random(40, 50),
    ["meatfree"] = math.random(20, 40),
    ["fowlburger"] = math.random(20, 40),
    ["icecream"] = math.random(5, 15),
    ["mshake"] = math.random(20, 30),
    ["sandwich"] = math.random(20, 30),
    ["keo_chong_chong"] = math.random(15, 25),

    ["beef-sandwich"] = math.random(20, 30),
    ["taco"] = math.random(20, 30),
    ["margherita"] = math.random(20, 30),
    ["quinoa "] = math.random(20, 30),
    ["tiramisu"] = math.random(20, 30),
    ["medfruits"] = math.random(20, 30),
    ["vegetariana"] = math.random(20, 30),
    ["capricciosa"] = math.random(20, 30),
    ["diavola"] = math.random(20, 30),
    ["gelato"] = math.random(20, 30),
    ["prosciuttio"] = math.random(20, 30),
    ["marinara"] = math.random(20, 30),
    ["water_bottle"] = math.random(23, 46),
    ["toast"] = math.random(20, 35),
    ["burger"] = math.random(25, 50),
    ["apple"] = math.random(18, 28),
    ["banana"] = math.random(18, 28),
    ["cherry"] = math.random(18, 28),
    ["coconut"] = math.random(18, 28),
    ["grapes"] = math.random(18, 28),
    ["kiwi"] = math.random(18, 28),
    ["lemon"] = math.random(18, 28),
    ["lime"] = math.random(18, 28),
    ["orange"] = math.random(18, 28),
    ["peach"] = math.random(18, 28),
    ["strawberry"] = math.random(18, 28),
    ["watermelon"] = math.random(18, 28),
    ["twerks_candy"] = math.random(5, 15),
    ["snikkel_candy"] = math.random(40, 50),
    ["champagne"] = math.random(20, 45),
    ["whitewine"] = math.random(20, 40),
    ["whiskey"] = math.random(10, 25),
    ["beer"] = math.random(10, 25),
    ["tequila"] = math.random(10, 25),
    ["dusche"] = math.random(10, 25),
    ["pinacolada"] = math.random(10, 20),
    ["glasswhiskey"] = math.random(10, 20),
    ["glasswine"] = math.random(10, 20),
    ["glassbeer"] = math.random(10, 20),
    ["bloodymary"] = math.random(10, 20),
    ["glasschampagne"] = math.random(10, 20),
    ["tequilashot"] = math.random(10, 20),
    ["absinthe"] = math.random(10, 15),
    ["shot1"] = math.random(15, 30),
    ["shot2"] = math.random(15, 30),
    ["shot3"] = math.random(15, 30),
    ["shot4"] = math.random(15, 30),
    ["shot5"] = math.random(15, 30),
    ["shot6"] = math.random(15, 30),
    ["shot7"] = math.random(15, 30),
    ["shot8"] = math.random(15, 30),
    ["shot9"] = math.random(15, 30),
    ["shot10"] = math.random(15, 30),
    -- Dount
    ["vanil"] = math.random(13, 15),
    ["donutvanil"] = math.random(13, 15),
    ["oreodonut"] = math.random(13, 15),
    ["strawberryice"] = math.random(13, 15),
    ["chocolateice"] = math.random(13, 15),
    ["chokovanillice"] = math.random(13, 15),
    ["cherryice"] = math.random(13, 15),
    ["blueberrydonut"] = math.random(13, 15),
    ["candydonut"] = math.random(13, 15),
    ["aliendonut"] = math.random(13, 15),
    ["pepedonut"] = math.random(13, 15),
    ["crazydonut"] = math.random(13, 15),
    ["surpisedonut"] = math.random(13, 15),
    -- FruitShop
    ["mango"] = math.random(10, 15),
    ["lichi"] = math.random(13, 15),
    ["pineapple"] = math.random(13, 15),
    ["pear"] = math.random(13, 15),
    ["melon"] = math.random(13, 15),
    ["applejuice"] = math.random(13, 15),
    ["bananajuice"] = math.random(13, 15),
    ["cherryjuice"] = math.random(13, 15),
    ["coconutjuice"] = math.random(13, 15),
    ["grapesjuice"] = math.random(13, 15),
    ["kiwijuice"] = math.random(13, 15),
    ["lemonjuice"] = math.random(13, 15),
    ["limejuice"] = math.random(13, 15),
    ["orangejuice"] = math.random(13, 15),
    ["peachjuice"] = math.random(13, 15),
    ["strawberryjuice"] = math.random(13, 15),
    ["watermelonjuice"] = math.random(13, 15),
    ["melonjuice"] = math.random(13, 15),
    ["lichijuice"] = math.random(13, 15),
    ["mangojuice"] = math.random(13, 15),
    ["pearjuice"] = math.random(13, 15),
    ["pineapplejuice"] = math.random(13, 15),
    -- Taco
    ["chicken-bucket"] = math.random(10, 15),
    ["cluckin-balls"] = math.random(13, 15),
    ["tacos"] = math.random(13, 15),
    ["cluckin-fries"] = math.random(13, 15),
    ["little-clucker"] = math.random(13, 15),
    ["cluckin-drink"] = math.random(13, 15),
    ["muffin"] = math.random(13, 15),
    ["veggy-salad"] = math.random(13, 15),
    ["torpedo"] = 40
}

RegisterNetEvent('food:Condiment')
AddEventHandler('food:Condiment', function(itemName)
    local startStamina = 23
    TriggerEvent("destroyProp")
    -- TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    Citizen.Wait(2500)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.14)
    StartScreenEffect("RaceTurbo", 30.0, false)
    Citizen.Wait(1500)
    StartScreenEffect("RaceTurbo", 0.0, false)
    TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions
        .GetPlayerData().metadata["hunger"] +
        Consumeables[itemName])
    TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions
        .GetPlayerData().metadata["thirst"] +
        Consumeables[itemName])
    while startStamina > 0 do
        Citizen.Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
    end
    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end)

RegisterNetEvent("consumables:client:EatS")
AddEventHandler("consumables:client:EatS", function(itemName)
    TriggerEvent("destroyProp")
    -- TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName],
        "remove")
    TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions
        .GetPlayerData().metadata["hunger"] +
        Consumeables[itemName])
    TriggerServerEvent('qb-hud:Server:RelieveStress', math.random(2, 4))
end)

RegisterNetEvent("consumables:client:DrinkS")
AddEventHandler("consumables:client:DrinkS", function(itemName)
    TriggerEvent("destroyProp")
    -- TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName],
        "remove")
    TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions
        .GetPlayerData().metadata["thirst"] +
        Consumeables[itemName])
end)

RegisterNetEvent("payanimation")
AddEventHandler("payanimation", function()
    TriggerEvent('animations:client:EmoteCommandStart', { "id" })
end)
