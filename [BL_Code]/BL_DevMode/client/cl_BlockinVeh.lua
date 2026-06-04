
local Config = require 'config.config'

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		local vehicleClass = GetVehicleClass(vehicle)
		if vehicleClass == 18 and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
			if not isJobWhitelisted(QBX.PlayerData.job.name) then
				ClearPedTasksImmediately(PlayerPedId())
				TaskLeaveVehicle(PlayerPedId(),vehicle,0)
				exports.qbx_core:Notify("Không thể ăn trộm xe nghành", "error")
			end
		end

		if Config.Blacklist[GetEntityModel(vehicle)] == true and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
			if not IsAuthorized() and not isJobWhitelisted2(QBX.PlayerData.job.name) then
				ClearPedTasksImmediately(PlayerPedId())
				TaskLeaveVehicle(PlayerPedId(),vehicle,0)
				exports.qbx_core:Notify("Phương tiện này thuộc về Tòa Thị Chính", "error")
			end
		end

		if Config.BlacklistPolice[GetEntityModel(vehicle)] == true and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
			if not isJobWhitelisted3(QBX.PlayerData.job.name) then
				ClearPedTasksImmediately(PlayerPedId())
				TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
				exports.qbx_core:Notify("Bạn không đủ thẩm quyền để sử dụng phương tiện này!", "error")
			end
		end
	end
end)

function isJobWhitelisted(jobName)
	for _, whitelistedJob in pairs(Config.whitelistedJobs) do
		if jobName == whitelistedJob then
			return true
		end
	end

	return false
end

function isJobWhitelisted2(jobName)
	for _, whitelistedJob2 in pairs(Config.whitelistedJobs2) do
		if jobName == whitelistedJob2 then
			return true
		end
	end

	return false
end

function isJobWhitelisted3(jobName)
	for _, whitelistedJob3 in pairs(Config.whitelistedJobs3) do
		if jobName == whitelistedJob3 then
			return true
		end
	end

	return false
end

function IsAuthorized(CitizenId)
    local retval = false
    local CitizenId = QBX.PlayerData.citizenid
    for k, cid in pairs(Config.CitizenID_List) do
        if cid == CitizenId then
            retval = true
            break
        end
    end
    return retval
end