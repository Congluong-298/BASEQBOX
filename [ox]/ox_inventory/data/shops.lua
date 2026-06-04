return {
	General = {
		name = '<FONT FACE="Oswald">Cửa Hàng 24/7</FONT>',
		blip = {
			id = 59, colour = 2, scale = 0.8
		}, inventory = {
			-- { name = 'burger', price = 300 },
			{ name = 'sandwich', price = 300 },
			-- { name = 'water', price = 300 },
			{ name = 'coffee', price = 300},
			{ name = 'kurkakola', price = 300},
			-- { name = 'bao_thuoc_la', price = 250},
			-- { name = 'lighter', price = 100}
		}, locations = {
			vec3(25.7, -1347.3, 29.49),
			vec3(-3038.71, 585.9, 7.9),
			vec3(-3241.47, 1001.14, 12.83),
			vec3(1728.66, 6414.16, 35.03),
			vec3(1697.99, 4924.4, 42.06),
			vec3(1961.48, 3739.96, 32.34),
			vec3(547.79, 2671.79, 42.15),
			vec3(2679.25, 3280.12, 55.24),
			vec3(2557.94, 382.05, 108.62),
			vec3(373.55, 325.56, 103.56),
			-- vec3(239.01, -898.42, 29.62),
			vec3(-1820.44, 792.64, 138.11),
		}, targets = {
			{ loc = vec3(25.06, -1347.32, 29.5), length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
			-- { loc = vec3(239.08, -898.48, 29.62), length = 2.5, width = 2.5, heading = 25.0, minZ = 39.62, maxZ = 40.02, distance = 3 },
			{ loc = vec3(-3039.18, 585.13, 7.91), length = 0.6, width = 0.5, heading = 15.0, minZ = 7.91, maxZ = 8.31, distance = 1.5 },
			{ loc = vec3(-3242.2, 1000.58, 12.83), length = 0.6, width = 0.6, heading = 175.0, minZ = 12.83, maxZ = 14.23, distance = 1.5 },
			{ loc = vec3(1728.39, 6414.95, 35.04), length = 0.6, width = 0.6, heading = 65.0, minZ = 35.04, maxZ = 35.44, distance = 1.5 },
			{ loc = vec3(1698.37, 4923.43, 42.06), length = 0.5, width = 0.5, heading = 235.0, minZ = 42.06, maxZ = 42.46, distance = 1.5 },
			{ loc = vec3(1960.54, 3740.28, 32.34), length = 0.6, width = 0.5, heading = 120.0, minZ = 32.34, maxZ = 32.74, distance = 1.5 },
			{ loc = vec3(548.5, 2671.25, 42.16), length = 0.6, width = 0.5, heading = 10.0, minZ = 42.16, maxZ = 42.56, distance = 1.5 },
			{ loc = vec3(2678.29, 3279.94, 55.24), length = 0.6, width = 0.5, heading = 330.0, minZ = 55.24, maxZ = 55.64, distance = 1.5 },
			{ loc = vec3(2557.19, 381.4, 108.62), length = 0.6, width = 0.5, heading = 0.0, minZ = 108.62, maxZ = 109.02, distance = 1.5 },
			{ loc = vec3(373.13, 326.29, 103.57), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },
			{ loc = vec3(-1820.44, 792.64, 138.11), length = 1.5, width = 1.5, heading = 25.0, minZ = 136, maxZ = 137, distance = 1.5 },
		}
	},
	BenhVienShop = {
		name = 'Bệnh Viện 24/7',
		inventory = {
			{ name = 'kurkakola', price = 300 },
			{ name = 'sandwich', price = 300 },
			-- { name = 'water', price = 300 },
			{ name = 'coffee', price = 300},
	--		{ name = 'thuocla_555', price = 250},
		}, locations = {
			vec3(-512.1677, -187.3720, 40.4460),
		}, targets = {
			{ loc = vec3(-512.1677, -187.3720, 40.4460), length = 2.5, width = 2.5, heading = 25.0, minZ = 39.4458, maxZ = 40.4458, distance = 1.5}
		}
	},


	YouTool = {
		name = '<FONT FACE="Oswald">Cửa Hàng Dụng Cụ</FONT>',
		blip = {
			id = 402, colour = 1, scale = 0.8
		}, 
		inventory = {
			{ name = 'lockpick', price = 3000 },
			{ name = 'radio', price = 2500 },
			{ name = 'phone', price = 2000 },
			{ name = 'pickaxe', price = 1000 }, --Cuốc
			{ name = 'advancedrepairkit', price = 3000 },  --thuc an nuoi tho
			{ name = 'fishingrod1', price = 1500 }, --Câu cá AFK
			{ name = 'fishbait', price = 10 },
			{ name = 'scuba_tube_l1', price = 1000 }, --Lặn 1
			{ name = 'riu_chat_go', price = 1500 }, --mũi khoan
			{ name = 'liftbag', price = 500 }, --Túi Nâng
			{ name = 'scuba_gear', price = 1500 }, --Ox<i>i
			{ name = 'giay_ban_xe', price = 50000 }, --Giấy Bán Xe
			{ name = 'dao_roc_vali', price = 1000 },
			{ name = 'fishingrod', price = 1000 },
			{ name = 'giun_dat', price = 50 },
			{ name = 'thucan', price = 50 },
			{ name = 'corgi_nho', price = 200 },
			-- { name = 'may_tinh_nuoi_thu', price = 500 },
			{ name = 'flower_emp_box', price = 50 },
			{ name = 'flower_paper', price = 100 },
			{ name = 'emp_bucket', price = 1000 },
			{ name = 'drillbit', price = 100 },
			{ name = 'ro', price = 1000 }, -- Rổ h
	--		{ name = 'fishingrod3', price = 3500 },
	--		{ name = 'fishingrod4', price = 4500 },
	--		{ name = 'fishingrod5', price = 5500 },
		}, 
		locations = {
			vec3(2746.8, 3473.13, 55.67),
			vec3(342.99, -1298.26, 32.51)
		}, 
		targets = {
			{ loc = vec3(2746.8, 3473.13, 55.67), length = 0.6, width = 3.0, heading = 65.0, minZ = 55.0, maxZ = 56.8, distance = 3.0 },
			{ loc = vec3(342.99, -1298.26, 32.51), length = 0.6, width = 3.0, heading = 65.0, minZ = 55.0, maxZ = 56.8, distance = 3.0 }
		}
	},
	VendingMachineDrinks = {
		name = 'Máy bán hàng tự động',
		inventory = {
			 { name = 'coffee', price = 300 },
			--  { name = 'water', price = 300 },
			 { name = 'sandwich', price = 300 },
			 { name = 'kurkakola', price = 300 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	},
	currentWeapon = {
		name = '<FONT FACE="Oswald">Cửa Hàng Vũ Khí</FONT>',
		blip = {
			id = 110, colour = 2, scale = 0.8
		}, 
		inventory = {
			{name = "WEAPON_PISTOL", label = "Súng lục", price = 2000000, amount = 1, isWeapon = true},
      		{name = "ammo-9", label = "Đạn súng lục", price = 10000, amount = 1, isWeapon = false},
		}, locations = {
			vec3(21.97, -1106.70, 29.80)
		}, targets = {
			{ loc = vec3(21.97, -1106.70, 29.50), length = 1.2, width = 1.2, heading = 340.0, minZ = 29.30, maxZ = 30.60, distance = 2.5 },
		},
	},
}
