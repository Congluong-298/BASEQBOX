-- _____ .__                                                                           
-- _/ ____\|__|___  __  ____    _____                                                    
-- \   __\ |  |\  \/ /_/ __ \  /     \                                                   
--  |  |   |  | \   / \  ___/ |  Y Y  \                                                  
--  |__|   |__|  \_/   \___  >|__|_|  /                                                  
--                         \/       \/                                                   
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      
--                                     .___.__                                           
-- ______  _____   _______ _____     __| _/|__|  ______  ____                            
-- \____ \ \__  \  \_  __ \\__  \   / __ | |  | /  ___/_/ __ \                           
-- |  |_> > / __ \_ |  | \/ / __ \_/ /_/ | |  | \___ \ \  ___/                           
-- |   __/ (____  / |__|   (____  /\____ | |__|/____  > \___  >                          
-- |__|         \/              \/      \/          \/      \/                           
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      
                                                                                      
-- .__                                                   ___.            ___.            
-- |  |    ____  ___  __  ____    ___.__.  ____   __ __  \_ |__  _____   \_ |__    ____  
-- |  |   /  _ \ \  \/ /_/ __ \  <   |  | /  _ \ |  |  \  | __ \ \__  \   | __ \ _/ __ \ 
-- |  |__(  <_> ) \   / \  ___/   \___  |(  <_> )|  |  /  | \_\ \ / __ \_ | \_\ \\  ___/ 
-- |____/ \____/   \_/   \___  >  / ____| \____/ |____/   |___  /(____  / |___  / \___  >
--                           \/   \/                          \/      \/      \/      \/ 
-- JOIN OUR DISCORD FOR MORE LEAKS: discord.gg/4dh2zdbZzT


local state = pcall(function()
    GlobalState.hudInfoPlayersAmount = 0
end)

if not state then
    -- print("mHud::Onesync is not enabled")
end

Core = nil
CreateThread(function()
    Core, Config.Framework = GetCore()
    GlobalState.hudInfoPlayersAmount = #GetPlayers()
end)



RegisterServerEvent("mHud:ToggleWindow")
AddEventHandler("mHud:ToggleWindow", function(window, door)
    local src = source
    TriggerClientEvent("mHud:SyncWindow", -1, src, window, door)
end)

RegisterServerEvent("mHud:UpdatePlayersAmount")
AddEventHandler("mHud:UpdatePlayersAmount", function()
    GlobalState.hudInfoPlayersAmount = #GetPlayers() 
end)



AddEventHandler('playerDropped', function()
    GlobalState.hudInfoPlayersAmount = #GetPlayers()
end)


function GetIdentifier(source)
    local Player = GetPlayer(source)
    local identifier = false
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx'  then
            identifier = Player.identifier
        else
            identifier = Player.PlayerData.citizenid
        end
    end
    return identifier
end


function ExecuteSql(query, parameters)
    local IsBusy = true
    local result = nil
    if Config.SQL == "oxmysql" then
        if parameters then
            exports.oxmysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        end

    elseif Config.SQL == "ghmattimysql" then
        if parameters then
            exports.ghmattimysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.ghmattimysql:execute(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "mysql-async" then
        if parameters then
            MySQL.Async.fetchAll(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.Async.fetchAll(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

function RegisterCallback(name, cbFunc)
    while not Core do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterServerCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    else
        Core.Functions.CreateCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    end
end

function GetPlayer(source)
    local Player = false
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Player = Core.GetPlayerFromId(source)
    else
        Player = Core.Functions.GetPlayer(source)
    end
    return Player
end

function GetPlayerRoleplayName(source)
    while not Core do
        Citizen.Wait(0)
    end
    local playerName = GetPlayerName(source)
    if Config.Framework == "esx" or Config.Framework == "oldesx" then
        local Player = Core.GetPlayerFromId(source)
        if Player then
            playerName = Player.getName()
        end
    else
        local Player = Core.Functions.GetPlayer(source)
        if Player then
            playerName = Player.PlayerData.charinfo.firstname .. " ".. Player.PlayerData.charinfo.lastname
        end
    end
    return playerName
end

CreateThread(function()
    -- RegisterCallback("mHud:GetPlayerCash", function(source, cb, type)
    --     cb(GetPlayerCash(source, type))
    -- end)
    RegisterCallback("mHud:GetPlayerName", function(source, cb)
        cb(GetPlayerRoleplayName(source))
    end)
    RegisterCallback("mHud:GetIdentifier", function(source, cb)
        cb(GetIdentifier(source))
    end)
    RegisterCallback('mHud:checkItem', function(source, cb, itemData)
        cb(CheckItem(source, itemData))
    end)
    RegisterCallback('mHud:DeleteItem', function(source, cb, itemData)
        cb(DeleteItem(source, itemData))
    end)
    RegisterCallback('mHud:GetPlayerDiscordPP', function(source, cb)
        cb(GetDiscordAvatar(source))
    end)
    RegisterCallback('mHud:GetPlayerDiscordPP', function(source, cb)
        cb(GetDiscordAvatar(source))
    end)

    RegisterCallback('mHud:GetESXCash', function(source, cb)
        local Player = GetPlayer(source)
        cb(Player.getMoney())
    end)
    RegisterCallback('mHud:GetESXBank', function(source, cb)
        local Player = GetPlayer(source)
        cb(Player.getAccount("bank").money)
    end)
end)


function GetPlayerInventory(source)
    local data = {}
    local Player = GetPlayer(source)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        for _,v in pairs(Player.getInventory()) do
            if v and tonumber(v.count) > 0  then
                local formattedData = {
                    name = v.name,
                    label = v.label,
                    amount = v.count,
                }
                table.insert(data, formattedData)
            end
            
        end
    else 
        for _,v in pairs(Player.PlayerData.items) do
            if v then
                local formattedData = {
                    name = v.name,
                    label = v.label,
                    amount = v.amount,
                }
                table.insert(data, formattedData)
            end
        end
    end
    return data
end

function CheckItem(source, itemData) 
    local inventory = GetPlayerInventory(source)
    for _,v in pairs(inventory) do
        if v.name == itemData.name and tonumber(itemData.reqAmount) <= tonumber(v.amount) then
            return true
        end
    end
    return false
end

function DeleteItem(source, itemData)
    local Player = GetPlayer(source)
    if CheckItem(source, itemData)  then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            Player.removeInventoryItem(itemData.name, itemData.reqAmount)            
        else
            Player.Functions.RemoveItem(itemData.name, itemData.reqAmount)
        end
        return true
    end
    return false
end

-- function GetPlayerCash(source)
--     local amount = 0
--     local Player = GetPlayer(source)
--     if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
--         amount = Player.getMoney()
--     else 
--         amount = Player.Functions.GetMoney('cash')
--     end
--     return amount
-- end

local playTimes = {}

function AddItem(src, name, amount)
    local Player = GetPlayer(src)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if Player.canCarryItem(name, amount) then
                Player.addInventoryItem(name, amount)                        
            end
        else
            Player.Functions.AddItem(name, amount)
        end
    end
end

function AddMoney(src, amount)
    local Player = GetPlayer(src)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            Player.addAccountMoney("bank", amount, "play gift")        
        else
            Player.Functions.AddMoney('bank', amount, "play gift")
        end
    end
end


if Config.Gift.enable then
    function GiveGift(src)
        local Player = GetPlayer(tonumber(src))
        if Player then
  
    
            for _,v in pairs(Config.Gift.rewards) do
                if v.type == "item" then
                    AddItem(src, v.name, v.amount)
                    
                elseif v.type == "bank_money" then
                    AddMoney(src, v.amount)
                end
            end
            playTimes[src] = os.time()
            StartPlayerTimer(src)
            TriggerClientEvent("mHud:GetPlayerGiftTimer", src, playTimes[src])
        end
    end
    
    AddEventHandler("playerDropped", function()
        local src = source
        playTimes[src] = false
    end)
    
    RegisterServerEvent("mHud:StartGiftTimer")
    AddEventHandler("mHud:StartGiftTimer", function()
        local src = source
        playTimes[src] = os.time()
        StartPlayerTimer(src)
        TriggerClientEvent("mHud:GetPlayerGiftTimer", src, playTimes[src])
    end)

    function StartPlayerTimer(src)
        if playTimes[tonumber(src)] then
            CreateThread(function()
                diff = os.difftime(os.time(), playTimes[tonumber(src)]) 
                while Config.Gift.time > math.floor(diff/60) and playTimes[tonumber(src)] do
                    diff = os.difftime(os.time(), playTimes[tonumber(src)]) 
                    Wait(1000)
                end
                if playTimes[tonumber(src)] then
                    GiveGift(tonumber(src))
                end
            end)
        end
    end
    
    -- CreateThread(function()
    --     while true do
    --         for _,src in pairs(GetPlayers()) do
    --             if playTimes[tonumber(src)] then
    --                 local diff = os.difftime(os.time(), playTimes[tonumber(src)]) 
    
    --                 if Config.Gift.time <= math.floor(diff/60) then
    --                     GiveGift(tonumber(src))
    --                 end
    --             end
    --         end
    --         Wait(60000)
    --     end
    -- end)
end


local Avatars = {}

local FormattedToken = "Bot "..botToken
function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest("https://discordapp.com/api/"..endpoint, function(errorCode, resultData, resultHeaders)
        data = {data=resultData, code=errorCode, headers=resultHeaders}
    end, method, #jsondata > 0 and json.encode(jsondata) or "", {["Content-Type"] = "application/json", ["Authorization"] = FormattedToken})

    while data == nil do
        Citizen.Wait(0)
    end

    return data
end

function GetDiscordAvatar(user)
    local discordId = nil
    local imgURL = nil;
    for _, id in ipairs(GetPlayerIdentifiers(user)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
            break
        end
    end
    if discordId then
        if Avatars[discordId] == nil then
            local endpoint = ("users/%s"):format(discordId)
            local member = DiscordRequest("GET", endpoint, {})

            if member.code == 200 then
                local data = json.decode(member.data)
                if data ~= nil and data.avatar ~= nil then
                    if (data.avatar:sub(1, 1) and data.avatar:sub(2, 2) == "_") then

                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".gif";
                    else
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".png"
                    end
                end
            else
                -- print("mHud:: Please make sure botToken is correct located at : mHud/server/botToken.lua")
                return "./assets/images/default-pp.png"
            end
            Avatars[discordId] = imgURL;
        else
            imgURL = Avatars[discordId];
        end
    else
        -- print("mHud:: Discord ID was not found : " ..GetPlayerName(user))
        return "./assets/images/default-pp.png"
    end
    return imgURL;
end



