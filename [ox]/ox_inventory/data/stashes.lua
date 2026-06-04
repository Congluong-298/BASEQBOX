return {
	{
		coords = vec3(452.3, -991.4, 30.7),
		target = {
			loc = vec3(451.25, -994.28, 30.69),
			length = 1.2,
			width = 5.6,
			heading = 0,
			minZ = 29.49,
			maxZ = 32.09,
			label = 'Mở tủ đồ cá nhân'
		},
		name = 'policeStash_ca_nhan',
		label = '📦 | KHO ĐỒ CÁ NHÂN',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = shared.police
	},

	{
		coords = vec3(301.3, -600.23, 43.28),
		target = {
			loc = vec3(301.82, -600.99, 43.29),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Mở tủ đồ cá nhân'
		},
		name = 'emslocker',
		label = 'Tủ đồ cá nhân',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},
    {
		coords = vec3(737.93, -1267.00, 25.28),
		target = {
			loc = vec3(737.93, -1267.00, 25.28),
			length = 0.7,
			width = 1.8,
			heading = 340,
			minZ = 34.28,
			maxZ = 36.68,
			label = 'Mở tủ đồ chung'
		},
		name = 'tunertrash',
		label = 'Tủ đồ chung Độ xe',
		owner = false,
		slots = 70,
		weight = 500000,
		groups = {['tuner'] = 0}
	},
	{
    coords = vec3(-547.79, -209.35, 37.65),
    target = {
        loc = vec3(-547.79, -209.35, 37.65),
        length = 0.6,
        width = 1.8,
        heading = 340,
        minZ = 36.65,  -- Đã sửa
        maxZ = 38.65,  -- Đã sửa
        label = 'Mở kho đồ chung băng đảng'  -- Đã sửa
    },
    name = 'gang_stash',  -- Đổi tên cho rõ nghĩa
    label = 'Kho Đồ Băng Đảng',
    owner = true,
    slots = 100,
    weight = 50000,
    groups = {
		['mafia'] = 0
    	}	
	},
	{
    coords = vec3(-1070.76, -1672.47, 4.90),
    target = {
        loc = vec3(-1070.76, -1672.47, 4.90),
        length = 0.6,
        width = 1.8,
        heading = 340,
        minZ = 36.65,  -- Đã sửa
        maxZ = 38.65,  -- Đã sửa
        label = 'Mở kho đồ chung băng đảng'  -- Đã sửa
    },
    name = 'gang_stash1',  -- Đổi tên cho rõ nghĩa
    label = 'Kho Đồ Băng Đảng',
    owner = true,
    slots = 100,
    weight = 50000,
    groups = {
        ['lostmc'] = 0,
    	}	
	},
	{
    coords = vec3(-2989.93, 2188.30, 45.10),
    target = {
        loc = vec3(-2989.93, 2188.30, 45.10),
        length = 0.6,
        width = 1.8,
        heading = 340,
        minZ = 36.65,  -- Đã sửa
        maxZ = 38.65,  -- Đã sửa
        label = 'Mở kho đồ chung băng đảng'  -- Đã sửa
    },
    name = 'gang_stash2',  -- Đổi tên cho rõ nghĩa
    label = 'Kho Đồ Băng Đảng 420 Gangz',
    owner = true,
    slots = 100,
    weight = 150000,
    groups = {
        ['420gangz'] = 0,
    	}	
	},
	{
    coords = vec3(-2989.93, 2188.00, 45.10),
    target = {
        loc = vec3(-2989.93, 2188.00, 45.10),
        length = 0.6,
        width = 2.8,
        heading = 340,
        minZ = 35.65,  -- Đã sửa
        maxZ = 38.65,  -- Đã sửa
        label = 'Mở kho đồ chung băng đảng'  -- Đã sửa
    },
    name = 'gang_stash2',  -- Đổi tên cho rõ nghĩa
    label = 'Kho Đồ Băng Đảng 420 Gangz',
    owner = true,
    slots = 100,
    weight = 150000,
    groups = {
        ['420gangz'] = 0,
    	}	
	},
}
