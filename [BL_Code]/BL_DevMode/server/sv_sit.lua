local SeatsTaken = {}

RegisterServerEvent('qb-sit:server:TakeChair', function(object)
	table.insert(SeatsTaken, object)
end)

RegisterServerEvent('qb-sit:server:LeaveChair', function(object)
	local _SeatsTaken = {}
	for i = 1, #SeatsTaken, 1 do
		if object ~= SeatsTaken[i] then
			table.insert(_SeatsTaken, SeatsTaken[i])
		end
	end
	SeatsTaken = _SeatsTaken
end)

RegisterServerEvent('qb-sit:server:GetChair', function(id)
	local found = false

	if SeatsTaken[id] ~= nil then
		found = true
	end
	TriggerClientEvent('qb-sit:client:GetChair', source, found)
end)

RegisterServerEvent('qb-sit:server:GetChairAlt', function(id, dat)
	local found = false

	if SeatsTaken[id] ~= nil then
		found = true
	end
	TriggerClientEvent('qb-sit:client:GetChairAlt', source, found, dat)
end)
