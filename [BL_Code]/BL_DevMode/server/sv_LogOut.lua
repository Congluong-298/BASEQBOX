local OnlinePlayers = {}

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    OnlinePlayers[Player.PlayerData.source] = {
        Name = GetPlayerName(Player.PlayerData.source),
        ICName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
        CID = Player.PlayerData.citizenid,
    }
end)

AddEventHandler("playerDropped", function(reason)
    local src = source
    local Player = OnlinePlayers[src]
    local coords = GetEntityCoords(GetPlayerPed(source))
    if not Player then return end -- if this is somehow still nill

    TriggerClientEvent("BL_logout:client:showlog", -1, src, coords, Player.Name, Player.ICName, Player.CID, reason)
end)