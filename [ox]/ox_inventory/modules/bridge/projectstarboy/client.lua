--[[ local ESX = setmetatable({}, {
	__index = function(self, index)
		local obj = exports.es_extended:getSharedObject()
		self.SetPlayerData = obj.SetPlayerData
		self.PlayerLoaded = obj.PlayerLoaded
		self.TriggerServerCallback = obj.TriggerServerCallback
		return self[index]
	end
}) ]]

---@diagnostic disable-next-line: duplicate-set-field
function client.setPlayerData(key, value)
	PlayerData[key] = value
	--[[ ESX.SetPlayerData(key, value) ]]
end

function client.hasGroup(group)
	print(json.encode(group))
	if not PlayerData.loaded then return end

	if type(group) == 'table' then
		for name, rank in pairs(group) do
			local groupRank = PlayerData.groups[name]
			if groupRank and CORE.Faction.can('INVENTORY') then
				return name, groupRank
			end
		end
	else
		local groupRank = PlayerData.groups[group]
		if groupRank then
			return group, groupRank
		end
	end
end

---@diagnostic disable-next-line: duplicate-set-field
function client.setPlayerStatus(values)
	for name, value in pairs(values) do
		if value > 0 then
			--[[ TriggerEvent('esx_status:add', name, value) ]]
			TriggerServerEvent("player:addStat", name, value)
		else
			--[[ TriggerEvent('esx_status:remove', name, -value) ]]
			TriggerServerEvent("player:removeStat", name, value)
		end
	end
end

AddEventHandler('esx:setPlayerData', function(key, value)
	if not PlayerData.loaded or GetInvokingResource() ~= 'es_extended' then return end

	if key == 'job' then
		key = 'groups'
		value = { [value.name] = value.grade }
	end

	PlayerData[key] = value
	OnPlayerData(key, value)
end)

AddEventHandler("core:setFactionData", function(data)
	while not PlayerData.loaded do Wait(0) end
	PlayerData.groups[data.name] = 1
end)

local Weapon = require 'modules.weapon.client'

RegisterNetEvent('esx_policejob:handcuff', function()
	PlayerData.cuffed = not PlayerData.cuffed
	LocalPlayer.state:set('invBusy', PlayerData.cuffed, false)

	if not PlayerData.cuffed then return end

	Weapon.Disarm()
end)

RegisterNetEvent('esx_policejob:unrestrain', function()
	PlayerData.cuffed = false
	LocalPlayer.state:set('invBusy', PlayerData.cuffed, false)
end)
