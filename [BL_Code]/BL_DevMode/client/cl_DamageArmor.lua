local Config = require 'config.config'

Config.Weaponlis = {}
for n,i in pairs(Config.Weaponlist) do
    Config.Weaponlis[GetHashKey(n)] = i
	Config.Weaponlist[n] = nil
end

AddEventHandler('gameEventTriggered', function (name, args)
	if name == "CEventNetworkEntityDamage" and args[1] ~= 514 and args[4] ~= 1 and not IsPedAPlayer(args[1]) then 
		ApplyDamageToPeds(args[1], Config.Weaponlis[args[5]], false) 
	end
end)

ApplyDamageToPeds = function(playerPed, damage, status)
	if damage ~= nil then
		local armour = GetPedArmour(playerPed)
		if armour > 0 then
			if (armour - damage) > 0 then
				local health = GetEntityHealth(playerPed)
				SetEntityHealth(playerPed, (health + 1))
				SetPedArmour(playerPed, (armour - damage))
			elseif (armour > 0) then
				local dd = damage - armour
				local health = GetEntityHealth(playerPed)
				SetEntityHealth(playerPed, (health - (dd + 1)))
				SetPedArmour(playerPed, (armour - damage))
				SetPedComponentVariation(playerPed, 9, 0, 0, 0)
			end
		else
			local health = GetEntityHealth(playerPed)
			SetEntityHealth(playerPed, ((health + 1) - damage))
		end
	end
end