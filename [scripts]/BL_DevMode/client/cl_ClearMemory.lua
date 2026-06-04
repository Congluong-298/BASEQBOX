CreateThread(function()
    while true do 
        Wait(60000)
        TriggerEvent('BL_Core:ClientMemoryGarbage')
    end
end)