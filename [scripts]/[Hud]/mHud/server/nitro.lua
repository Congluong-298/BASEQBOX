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



CreateThread(function()
    while not Core do
        Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterUsableItem("nitrous", function(source)
            TriggerClientEvent('mHud:LoadNitrous', source)
        end)
    else
        Core.Functions.CreateUseableItem("nitrous", function(source)
            TriggerClientEvent('mHud:LoadNitrous', source)
        end)
    end
end)

RegisterNetEvent('mHud:server:LoadNitrous', function(Plate)
    TriggerClientEvent('mHud:client:LoadNitrous', -1, Plate)
end)

RegisterNetEvent('mHud:server:SyncFlames', function(netId)
    TriggerClientEvent('mHud:client:SyncFlames', -1, netId, source)
end)

RegisterNetEvent('mHud:server:UnloadNitrous', function(Plate)
    TriggerClientEvent('mHud:client:UnloadNitrous', -1, Plate)
end)

RegisterNetEvent('mHud:server:UpdateNitroLevel', function(Plate, level)
    TriggerClientEvent('mHud:client:UpdateNitroLevel', -1, Plate, level)
end)

RegisterNetEvent('mHud:server:StopSync', function(plate)
    TriggerClientEvent('mHud:client:StopSync', -1, plate)
end)

RegisterNetEvent('mHud:server:removeItem', function()
    local src = source
    DeleteItem(source, {
        name = "nitrous",
        reqAmount = 1,
    })
end)

RegisterCommand('nitro', function(source)
    TriggerClientEvent('mHud:LoadNitrous', source)
end)