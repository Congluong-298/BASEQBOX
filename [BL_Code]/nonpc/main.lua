


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) 

		-- Nếu bạn không muốn NPC trong trò chơi, hãy để giá trị là 0. Tuy nhiên, nếu bạn muốn NPC và có thể điều chỉnh mật độ của chúng, bạn có thể thay đổi các giá trị.
		SetVehicleDensityMultiplierThisFrame(0) -- Mật độ giao thông
		SetPedDensityMultiplierThisFrame(0) -- NPC/PEDS Cường độ 
		SetRandomVehicleDensityMultiplierThisFrame(0) -- Phương tiện ngẫu nhiên (phương tiện rời khỏi bãi đậu xe, v.v.) 
		SetParkedVehicleDensityMultiplierThisFrame(0) -- Xe đỗ ngẫu nhiên
		SetScenarioPedDensityMultiplierThisFrame(0, 0) -- Kịch bản NPC / PEDS ngẫu nhiên
		SetGarbageTrucks(false) -- Rastgele ortaya çıkan çöp kamyonları [true/false]
		SetRandomBoats(false) -- Rastgele denizde/suda tekne çıkması [true/false]
		SetCreateRandomCops(false) -- Rastgele polisler (araç/yaya)[true/false]
		SetCreateRandomCopsNotOnScenarios(false) -- Rastgele polisler (senaryo değil)[true/false]
		SetCreateRandomCopsOnScenarios(false) -- Rastgele polisler (senaryo)[true/false]
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
	end
end)







