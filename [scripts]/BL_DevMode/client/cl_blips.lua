-- local Config = require 'config.config'

-- function AddBlip(data) 
--     local NewIndex = #Config.Blips+1
--     Config.Blips[NewIndex] = {}
--     Config.Blips[NewIndex].blip = AddBlipForCoord(data.coords)
--     Config.Blips[NewIndex].resource = GetInvokingResource()
--     SetBlipSprite(Config.Blips[NewIndex].blip, data.sprite)
--     SetBlipDisplay(Config.Blips[NewIndex].blip, 4)
--     SetBlipScale(Config.Blips[NewIndex].blip, data.scale)
--     SetBlipColour(Config.Blips[NewIndex].blip, data.color)
--     SetBlipAsShortRange(Config.Blips[NewIndex].blip, true)
--     BeginTextCommandSetBlipName("STRING")
--     AddTextComponentString(data.text)
--     EndTextCommandSetBlipName(Config.Blips[NewIndex].blip)
-- end 

-- exports('AddBlip', AddBlip)

-- AddEventHandler('onClientResourceStop', function(resource)
--     for k, v in pairs(Config.Blips) do
--          if v.resource == resource then
--             if v.blip then 
--                 RemoveBlip(v.blip)
--             end 
--             Config.Blips[k] = nil
--          end
--     end
-- end)