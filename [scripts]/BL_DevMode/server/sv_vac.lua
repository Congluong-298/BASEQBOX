local QBCore = exports['qb-core']:GetCoreObject()

local carrying = {}
local carried = {}

RegisterNetEvent("BL_DevMode:server:checkdead", function(targetSrc)
	local src = source
	local Carrier = QBCore.Functions.GetPlayer(src)
	local Target = QBCore.Functions.GetPlayer(targetSrc)

	if not Carrier or not Target then return end

	local targetState = Player(targetSrc).state
	
	if targetState.inLaststand or targetState.isDead then
		TriggerClientEvent('BL_DevMode:client:carrypeople:success', src)
		
		local pCoords = tostring(GetEntityCoords(GetPlayerPed(src)))

		TriggerEvent('qb-log:server:CreateLog', 'hanh_dong', '**VÁC NGƯỜI CHƠI**', 'blue',
		'\n * Vị trí hiện tại: **'..pCoords..
		'**\n * Người vác: **['..Carrier.PlayerData.source..'] '..Carrier.PlayerData.charinfo.firstname..' '..Carrier.PlayerData.charinfo.lastname..' - '..Carrier.PlayerData.citizenid..
		'**\n * Người được vác: **['..Target.PlayerData.source..'] '..Target.PlayerData.charinfo.firstname..' '..Target.PlayerData.charinfo.lastname..' - '..Target.PlayerData.citizenid..'**', false)
	else
        TriggerClientEvent('QBCore:Notify', src, "Bạn chỉ vác được người khi họ gục, ngất, và không bị còng", "warning", 5000)
	end
end)

RegisterNetEvent("CarryPeople:sync")
AddEventHandler("CarryPeople:sync", function(targetSrc)
	local source = source
	local sourcePed = GetPlayerPed(source)
   	local sourceCoords = GetEntityCoords(sourcePed)
	local targetPed = GetPlayerPed(targetSrc)
    local targetCoords = GetEntityCoords(targetPed)
	
	if #(sourceCoords - targetCoords) <= 3.0 then 
		TriggerClientEvent("CarryPeople:syncTarget", targetSrc, source)
		carrying[source] = targetSrc
		carried[targetSrc] = source
	end
end)

RegisterNetEvent("CarryPeople:stop")
AddEventHandler("CarryPeople:stop", function(targetSrc)
	local source = source
	local Carrier = QBCore.Functions.GetPlayer(source)
	local Target = QBCore.Functions.GetPlayer(targetSrc)
    local PlayerPed = GetPlayerPed(source)
	local pCoords = tostring(GetEntityCoords(PlayerPed))

	if carrying[source] then
		TriggerClientEvent("CarryPeople:cl_stop", targetSrc)
		
		if Carrier and Target then
			TriggerEvent('qb-log:server:CreateLog', 'hanh_dong', '**HỦY VÁC NGƯỜI CHƠI**', 'red',
			'\n * Vị trí hiện tại: **'..pCoords..
			'**\n * Người vác: **['..Carrier.PlayerData.source..'] '..Carrier.PlayerData.charinfo.firstname..' '..Carrier.PlayerData.charinfo.lastname..' - '..Carrier.PlayerData.citizenid..
			'**\n * Người được vác: **['..Target.PlayerData.source..'] '..Target.PlayerData.charinfo.firstname..' '..Target.PlayerData.charinfo.lastname..' - '..Target.PlayerData.citizenid..'**', false)
		end
		
		carrying[source] = nil
		carried[targetSrc] = nil
	elseif carried[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carried[source])			
		carrying[carried[source]] = nil
		carried[source] = nil
	end
end)

AddEventHandler('playerDropped', function(reason)
	local source = source
	
	if carrying[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carrying[source])
		carried[carrying[source]] = nil
		carrying[source] = nil
	end

	if carried[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carried[source])
		carrying[carried[source]] = nil
		carried[source] = nil
	end
end)