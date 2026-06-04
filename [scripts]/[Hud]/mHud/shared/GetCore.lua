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


function GetCore()
    local object = nil
    local Framework = Config.Framework

    if Config.Framework == "oldesx" then
        local counter = 0
        while not object  do
            TriggerEvent('esx:getSharedObject', function(obj) object = obj end)
            counter = counter + 1
            if counter == 3 then
                break
            end
            Citizen.Wait(1000)
        end
        if not object then
            print("mHud::Framework is not selected in the config correctly if you're sure it's correct please check your events to get framework object")
        end
    end
    
    if Config.Framework == "esx" then
        local counter = 0
        local status = pcall(function ()
            exports['es_extended']:getSharedObject()
        end)
        if status then        
            while not object do
                object = exports['es_extended']:getSharedObject()
                counter = counter + 1
                if counter == 3 then
                    break
                end
                Citizen.Wait(1000)
            end
        end
        if not object then
            print("mHud::Framework is not selected in the config correctly if you're sure it's correct please check your events to get framework object")
        end
    end

    if Config.Framework == "qb" then
        local counter = 0
        local status = pcall(function ()
            exports["qb-core"]:GetCoreObject()
        end)
        if status then
            while not object  do
                object = exports["qb-core"]:GetCoreObject()
                counter = counter + 1
                if counter == 3 then
                    break
                end
                Citizen.Wait(1000)
            end
        end
        if not object then
            print("mHud::Framework is not selected in the config correctly if you're sure it's correct please check your events to get framework object")
        end
    end

    if Config.Framework == "oldqb" then
        local counter = 0

        while  not object do
            counter = counter + 1
            TriggerEvent('QBCore:GetObject', function(obj) object = obj end)
            if counter == 3 then
                break
            end
            Citizen.Wait(1000)
        end
        if not object then
            print("mHud::Framework is not selected in the config correctly if you're sure it's correct please check your events to get framework object")
        end
    end

    if Config.Framework == 'autodetect' then
        local counter = 0
        local breakLoop = false
        Citizen.CreateThread(function()
            while not object do
                counter = counter + 1
                if counter == 3 then
                    breakLoop = true
                    counter = 0
                end
                Citizen.Wait(700)
            end
        end)


        while not object do
            local status = pcall(function ()
                object = exports['es_extended']:getSharedObject()
            end)
            Citizen.Wait(1000)
            break
        end

        if object and Framework == 'autodetect' then
            Framework = 'esx'
        end

        while not object do
            TriggerEvent('esx:getSharedObject', function(obj) object = obj end)
            if breakLoop then
                break
            end
            Citizen.Wait(1000)
        end

        if object and Framework == 'autodetect' then
            Framework = 'oldesx'
        end

        while not object do
            local status = pcall(function ()
                object = exports["qb-core"]:GetCoreObject()
            end)
            Citizen.Wait(1000)
            break
        end

        if object and Framework == 'autodetect' then
            Framework = 'qb'
        end

        while not object do
            TriggerEvent('QBCore:GetObject', function(obj) object = obj end)
            if breakLoop then
                break
            end
            Citizen.Wait(1000)
        end

        if object and Framework == 'autodetect' then
            Framework = 'oldqb'
        end

        if not object then
            print("mHud::Auto detect couldn't detect your framework please check your event to get framework object")
        else
            print("mHud::Framework object found : ", Framework)
        end
    end
    return object, Framework
end