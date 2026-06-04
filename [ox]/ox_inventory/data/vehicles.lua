return {
	-- 0	vehicle has no storage
	-- 1	vehicle has no trunk storage
	-- 2	vehicle has no glovebox storage
	-- 3	vehicle has trunk in the hood
	Storage = {
		[`jester`] = 3,
		[`adder`] = 3,
		[`osiris`] = 1,
		[`pfister811`] = 1,
		[`penetrator`] = 1,
		[`autarch`] = 1,
		[`bullet`] = 1,
		[`cheetah`] = 1,
		[`cyclone`] = 1,
		[`voltic`] = 1,
		[`reaper`] = 3,
		[`entityxf`] = 1,
		[`t20`] = 1,
		[`taipan`] = 1,
		[`tezeract`] = 1,
		[`torero`] = 3,
		[`turismor`] = 1,
		[`fmj`] = 1,
		[`infernus`] = 1,
		[`italigtb`] = 3,
		[`italigtb2`] = 3,
		[`nero2`] = 1,
		[`vacca`] = 3,
		[`vagner`] = 1,
		[`visione`] = 1,
		[`prototipo`] = 1,
		[`zentorno`] = 1,
		[`trophytruck`] = 0,
		[`trophytruck2`] = 0,
	},

	-- slots, maxWeight; default weight is 8000 per slot
	glovebox = {
		[0] = {10, 5000},		-- Compact
		[1] = {10, 5000},		-- Sedan
		[2] = {10, 5000},		-- SUV
		[3] = {10, 5000},		-- Coupe
		[4] = {10, 5000},		-- Muscle
		[5] = {10, 5000},		-- Sports Classic
		[6] = {10, 5000},		-- Sports
		[7] = {10, 5000},		-- Super
		[8] = {5, 5000},		-- Motorcycle
		[9] = {10, 5000},		-- Offroad
		[10] = {10, 5000},		-- Industrial
		[11] = {10, 5000},		-- Utility
		[12] = {10, 5000},		-- Van
		[14] = {10, 5000},	-- Boat
		[15] = {10, 5000},	-- Helicopter
		[16] = {10, 5000},	-- Plane
		[17] = {10, 5000},		-- Service
		[18] = {10, 5000},		-- Emergency
		[19] = {10, 5000},		-- Military
		[20] = {10, 5000},		-- Commercial (trucks)
		models = {
			[`xa21`] = {10, 5000},
			[`civic20`] = {10, 5000},
			[`r35`] = {10, 5000},
			[`aa_pr911_992_21`] = {10, 5000},
			[`2022jeep`] = {10, 5000},
			[`rangerufx`] = {10, 5000},
			[`gtrpit`] = {10, 5000},
			[`vf3`] = {10, 5000},
		}
	},

	trunk = {
		[0] = {10, 15000},		-- Compact
		[1] = {10, 10000},		-- Sedan
		[2] = {10, 20000},		-- SUV
		[3] = {20, 20000},		-- Coupe
		[4] = {20, 20000},		-- Muscle
		[5] = {10, 15000},		-- Sports Classic
		[6] = {10, 10000},		-- Sports
		[7] = {10, 10000},		-- Super
		[8] = {10, 5000},		-- Motorcycle
		[9] = {30, 30000},		-- Offroad
		[10] = {10, 10000},		-- Industrial
		[11] = {10, 20000},		-- Utility
		[12] = {30, 30000},		-- Van
		-- [14] -- Boat
		-- [15] -- Helicopter
		-- [16] -- Plane
		[17] = {10, 20000},		-- Service
		[18] = {10, 20000},		-- Emergency
		[19] = {10, 10000},		-- Military
		[20] = {10, 15000},		-- Commercial
		models = {
			[`xa21`] = {10, 10000},
			[`civic20`] = {10, 15000},
			[`r35`] = {10, 15000},
			[`aa_pr911_992_21`] = {10, 15000},
			[`2022jeep`] = {15, 35000},
			[`rangerufx`] = {10, 35000},
			[`gtrpit`] = {10, 15000},
			[`vf3`] = {10, 15000},
		},
	}
}
