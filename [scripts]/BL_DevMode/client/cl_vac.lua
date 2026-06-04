local QBCore = exports['qb-core']:GetCoreObject()

local carry = {
	InProgress = false,
	targetSrc = -1,
	type = "",
	personCarrying = {
		animDict = "missfinale_c2mcs_1",
		anim = "fin_c2_mcs_1_camman",
		flag = 49,
	},
	personCarried = {
		animDict = "nm",
		anim = "firemans_carry",
		attachX = 0.27,
		attachY = 0.4,
		attachZ = 0.63,
		flag = 33,
	}
}

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(targetCoords-playerCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end
	if closestDistance ~= -1 and closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end        
    end
    return animDict
end

RegisterCommand("vac",function(source, args)
	TriggerEvent('BL_DevMode:client:carrypeople')
end)

RegisterNetEvent('BL_DevMode:client:checkdead', function(chinhchu)
	local infoz = 0
	if LocalPlayer.state.isHandcuffed then infoz = 1 end
	if LocalPlayer.state.isEscorted then infoz = 2 end
	if LocalPlayer.state.inLaststand then infoz = 3 end
	if LocalPlayer.state.isDead then infoz = 4 end
	
	TriggerServerEvent('BL_DevMode:server:sendinfoserver', chinhchu, infoz)
end)

RegisterNetEvent('BL_DevMode:client:carrypeople:success', function()
	if not carry.InProgress then
		local closestPlayer = GetClosestPlayer(2)
		if closestPlayer then
			local targetSrc = GetPlayerServerId(closestPlayer)
			if targetSrc ~= -1 then
				QBCore.Functions.Progressbar("vac_progress", "Vác người chơi", 3000, false, false, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "amb@prop_human_bum_bin@idle_a",
					anim = "idle_a",
				}, {}, {}, function() -- Done
					ClearPedTasks(PlayerPedId())
					carry.InProgress = true
					carry.targetSrc = targetSrc
					TriggerServerEvent("CarryPeople:sync",targetSrc)
					ensureAnimDict(carry.personCarrying.animDict)
					carry.type = "carrying"
                    -- QBCore.Functions.Notify('/vac để thả họ xuống', 'warning', 5000)
				end, function()
				end)
			else
                QBCore.Functions.Notify('Không có ai ở gần bạn<br>Hoặc họ ở quá xa', 'error', 5000)
			end
		else
            QBCore.Functions.Notify('Không có ai ở gần bạn<br>Hoặc họ ở quá xa', 'error', 5000)
		end
	else
		carry.InProgress = false
		ClearPedSecondaryTask(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
		TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
		carry.targetSrc = 0
	end
end)

RegisterNetEvent('BL_DevMode:client:carrypeople', function()
	-- local nCheckZone = exports['dt-antoan']:CheckZone_DoatCo()
	-- if nCheckZone then
	-- 	QBCore.Functions.Notify("Khu vực này không thể vác", "error", 5000)
	-- else
		if LocalPlayer.state.isHandcuffed then return end
		if LocalPlayer.state.isEscorted then return end
		if lib.progressActive() then return end
		if LocalPlayer.state.inLaststand then return end
		if LocalPlayer.state.isDead then return end
		
		if not carry.InProgress then
			local closestPlayer = GetClosestPlayer(2)
			if closestPlayer then
				local targetSrc = GetPlayerServerId(closestPlayer)
				if targetSrc ~= -1 then
					TriggerServerEvent('BL_DevMode:server:checkdead', targetSrc)
				else
					QBCore.Functions.Notify('Không có ai ở gần bạn<br>Hoặc họ ở quá xa', 'error', 5000)
				end
			else
				QBCore.Functions.Notify('Không có ai ở gần bạn<br>Hoặc họ ở quá xa', 'error', 5000)
			end
		else
			carry.InProgress = false
			ClearPedSecondaryTask(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
			TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
			carry.targetSrc = 0
		end
	-- end
end)

RegisterNetEvent("CarryPeople:syncTarget")
AddEventHandler("CarryPeople:syncTarget", function(targetSrc)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(targetSrc))
	carry.InProgress = true
	ensureAnimDict(carry.personCarried.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, carry.personCarried.attachX, carry.personCarried.attachY-0.25, carry.personCarried.attachZ+0.1, 0.5, 0.5, 180, false, false, false, false, 2, false)
	carry.type = "beingcarried"
end)

RegisterNetEvent("CarryPeople:cl_stop")
AddEventHandler("CarryPeople:cl_stop", function()
	carry.InProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

Citizen.CreateThread(function()
	while true do
		if carry.InProgress then
			if carry.type == "beingcarried" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personCarried.animDict, carry.personCarried.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personCarried.animDict, carry.personCarried.anim, 8.0, -8.0, 100000, carry.personCarried.flag, 0, false, false, false)
				end
			elseif carry.type == "carrying" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personCarrying.animDict, carry.personCarrying.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personCarrying.animDict, carry.personCarrying.anim, 8.0, -8.0, 100000, carry.personCarrying.flag, 0, false, false, false)
				end
			end
		end
		Wait(0)
	end
end)