Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do 
        Wait(0)
    end
    local timer = GetGameTimer()
    TriggerServerEvent("ox_load:server:playerJoined")
    while LocalPlayer.state == nil or LocalPlayer.state.token == nil do 
        Wait(0)
    end
end)
local CurrentToken = nil
local TriggerBusy = false
exports("TriggerServerEvent", function(eventName, ...)
    local timer = GetGameTimer()
    while (LocalPlayer.state == nil or LocalPlayer.state.token == nil or (CurrentToken ~= nil and LocalPlayer.state.token == CurrentToken)) and GetGameTimer() -  timer < 10000 do 
        Wait(0)
    end
    if GetGameTimer() - timer >= 10000 then 
        return print(("TriggerServerEvent %s Error Please Contact Admin"):format(eventName))
    end
    while TriggerBusy == true do 
        Wait(0)
    end
    TriggerBusy = true 
    local TokenSecurity = LocalPlayer.state.token 
    CurrentToken = TokenSecurity
    TriggerServerEvent(eventName, TokenSecurity, ...)
    Wait(10)
    TriggerBusy = false
end)