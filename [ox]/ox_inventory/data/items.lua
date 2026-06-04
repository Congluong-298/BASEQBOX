return {
	['testburger'] = {
		label = 'Bánh mì kẹp thịt thử nghiệm',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'thật là một chiếc burger ngon tuyệt vời, đúng không?'
		},
        ['espresso'] = {
            label = 'Espresso',
            weight = 200,
            stack = true,
            close = true,
            description = 'Một tách cà phê đậm đà với hương vị và mùi thơm phong phú',
            client = {
                image = 'espresso.png',
                usetime = 2500,
                prop = {
                    model = 'prop_coffee_cup',
                    pos = vec3(0.06, 0.04, 0.06),
                    rot = vec3(220.0, 0.0, 0.0)
                },
            anim = {
                dict = 'amb@world_human_aa_coffee@idle_a',
                clip = 'idle_a'
        }
    }
},

['cappuccino'] = {
    label = 'Cappuccino',
    weight = 250,
    stack = true,
    close = true,
    description = 'Espresso phủ bọt sữa hấp',
    client = {
        image = 'cappuccino.png',
        usetime = 2500,
        prop = {
            model = 'prop_coffee_cup',
            pos = vec3(0.06, 0.04, 0.06),
            rot = vec3(220.0, 0.0, 0.0)
        },
        anim = {
            dict = 'amb@world_human_aa_coffee@idle_a',
            clip = 'idle_a'
            }
        }
    },

    ['latte'] = {
         label = 'Latte',
            weight = 300,
            stack = true,
            close = true,
            description = 'Espresso mịn với nhiều sữa hấp',
            client = {
                image = 'latte.png',
                usetime = 2500,
                prop = {
                    model = 'prop_coffee_cup',
                    pos = vec3(0.06, 0.04, 0.06),
                    rot = vec3(220.0, 0.0, 0.0)
        },
        anim = {
            dict = 'amb@world_human_aa_coffee@idle_a',
            clip = 'idle_a'
        }
    }
},

['americano'] = {
    label = 'Americano',
    weight = 250,
    stack = true,
    close = true,
    description = 'Espresso pha loãng với nước nóng để có hương vị nhẹ hơn',
    client = {
        image = 'americano.png',
        usetime = 2500,
        prop = {
            model = 'prop_coffee_cup',
            pos = vec3(0.06, 0.04, 0.06),
            rot = vec3(220.0, 0.0, 0.0)
        },
        anim = {
            dict = 'amb@world_human_aa_coffee@idle_a',
            clip = 'idle_a'
        }
    }
},

['mocha'] = {
    label = 'Mocha',
    weight = 300,
    stack = true,
    close = true,
    description = 'Thức uống cà phê hương vị sô cô la với sữa nóng',
    client = {
        image = 'mocha.png',
        usetime = 2500,
        prop = {
            model = 'prop_coffee_cup',
            pos = vec3(0.06, 0.04, 0.06),
            rot = vec3(220.0, 0.0, 0.0)
        },
        anim = {
            dict = 'amb@world_human_aa_coffee@idle_a',
            clip = 'idle_a'
        }
    }
},

['macchiato'] = {
    label = 'Macchiato',
    weight = 280,
    stack = true,
    close = true,
    description = 'Espresso với một ít sữa đánh bọt và caramel',
    client = {
        image = 'macchiato.png',
        usetime = 2500,
        prop = {
            model = 'prop_coffee_cup',
            pos = vec3(0.06, 0.04, 0.06),
            rot = vec3(220.0, 0.0, 0.0)
        },
        anim = {
            dict = 'amb@world_human_aa_coffee@idle_a',
            clip = 'idle_a'
        }
    }
},

['frappe'] = {
    label = 'Cà phê sữa đá',
    weight = 350,
    stack = true,
    close = true,
    description = 'Cà phê đá xay với sữa và đá',
    client = {
        image = 'frappe.png',
        usetime = 2500,
        prop = {
            model = 'prop_plastic_cup_02',
            pos = vec3(0.06, 0.04, 0.06),
            rot = vec3(220.0, 0.0, 0.0)
        },
        anim = {
            dict = 'amb@world_human_drinking@coffee@male@idle_a',
            clip = 'idle_a'
        }
    }
},

['irish_coffee'] = {
    label = 'Cà phê Ireland',
    weight = 300,
    stack = true,
    close = true,
    description = 'Coffee with Irish whiskey, cream, and sugar',
    client = {
        image = 'irish_coffee.png',
        usetime = 2500,
        prop = {
            model = 'prop_ceramic_jug_01',
            pos = vec3(0.06, 0.04, 0.06),
            rot = vec3(220.0, 0.0, 0.0)
        },
        anim = {
            dict = 'amb@world_human_aa_coffee@idle_a',
            clip = 'idle_a'
        }
    }
},

-- Coffee Ingredients
['coffee_beans'] = {
    label = 'Cà phê rang',
    weight = 50,
    stack = true,
    close = true,
    description = 'Hạt cà phê rang cao cấp để pha chế',
    client = {
        image = 'coffee_beans.png',
    }
},

-- ['water'] = {
--     label = 'Water',
--     weight = 100,
--     stack = true,
--     close = true,
--     description = 'Nước lọc sạch để pha chế',
--     client = {
--         image = 'water.png',
--     }
-- },

['milk'] = {
    label = 'Sữa tươi',
    weight = 150,
    stack = true,
    close = true,
    description = 'Sữa tươi cho đồ uống cà phê',
    client = {
        image = 'milk.png',
    }
},

['chocolate'] = {
    label = 'Chocolate',
    weight = 75,
    stack = true,
    close = true,
    description = 'Sô cô la đậm đà tạo hương vị cho cà phê',
    client = {
        image = 'chocolate.png',
    }
},

['caramel'] = {
    label = 'Caramel',
    weight = 50,
    stack = true,
    close = true,
    description = 'Siro caramel ngọt cho cà phê',
    client = {
        image = 'caramel.png',
    }
},

['ice'] = {
    label = 'Ice',
    weight = 25,
    stack = true,
    close = true,
    description = 'Đá viên cho đồ uống cà phê lạnh',
    client = {
        image = 'ice.png',
    }
},

['sugar'] = {
    label = 'Đường',
    weight = 25,
    stack = true,
    close = true,
    description = 'Đường để làm ngọt cà phê',
    client = {
        image = 'sugar.png',
    }
},

['cream'] = {
    label = 'Kem',
    weight = 100,
    stack = true,
    close = true,
    description = 'Kem béo cho đồ uống cà phê đậm đà',
    client = {
        image = 'cream.png',
    }
},

['whiskey'] = {
    label = 'Rượu Whiskey',
    weight = 200,
    stack = true,
    close = true,
    description = 'Rượu whisky Ireland pha cà phê pha rượu',
    client = {
        image = 'whiskey.png',
    }
},
		buttons = {
			{
				label = 'Liếm nó',
				action = function(slot)
					print('Bạn đã ăn bánh mì kẹp thịt')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('Bạn đã bóp bánh mì kẹp thịt :(')
				end
			},
			{
				label = 'Bạn gọi bánh mì kẹp thịt chay là gì?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Một sự nhầm lẫn.')
				end
			},
			{
				label = 'Thích ăn gì cùng với bánh mì kẹp thịt?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Ruồi Pháp.')
				end
			},
			{
				label = 'Tại sao bánh mì kẹp thịt và khoai tây chiên lại chạy?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Bởi vì chúng là đồ ăn nhanh.')
				end
			}
		},
		consume = 0.3
	},

    ['dieu_cay'] = {
        label = 'Điếu Cày',
        weight = 500,
        description = 'Dụng cụ hút thuốc lào truyền thống',
    client = {
        anim = { dict = 'amb@world_human_smoking@male@male_a@enter', clip = 'enter' },
        prop = { model = 'prop_bong_01', bone = 57005, pos = vec3(0.10, 0.03, -0.02), rot = vec3(90.0, 0.0, 0.0) },
        usetime = 5000
        }
    },
    -- ['drycanabis'] = {
	-- 	label = 'Thẻ ngành',
	-- 	weight = 10,
	-- },


	['bandage'] = {
		label = 'Băng y tế',
		weight = 100,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},
	['the_nganh'] = {
		label = 'Thẻ ngành',
		weight = 10,
	},
	['the_nha'] = {
		label = 'Thẻ nhà',
		weight = 10,
	},
	['the_nha_manh_1'] = {
		label = 'Thẻ nhà mảnh 1',
		weight = 10,
	},
	['the_nha_manh_2'] = {
		label = 'Thẻ nhà mảnh 2',
		weight = 10,
	},
	['the_y_te'] = {
		label = 'Thẻ y tế',
		weight = 10,
	},
	-- ['the_nganh'] = {
	-- 	label = 'Thẻ ngành',
	-- 	weight = 10,
	-- },
	['doctor_card'] = {
		label = 'Thẻ bác sĩ',
		weight = 10,
	},
	
    ['handcuffs'] = {
        label = 'Còng Tay',
        weight = 1000,
    },
    ['hunting_knife'] = {
        label = 'Dao săn thú',
        weight = 200,
    },
	['sandwich'] = {
		label = 'Snack ',
		weight = 200,
		client = {
			status = { hunger = 250000 },
	        anim = 'eating',    
			prop = 'sandwich',
			usetime = 2500,
			notification = 'Bạn đã ăn một gói Snack ngon tuyệt'
		},
	},
    ['kurkakola'] = {
		label = 'Coca-cola',
		weight = 200,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Bạn đã uống một chút Coca-cola cho thoải mái đầu óc'
        },
    },
    ['bs_shotcola'] = {
		label = 'Trà Sữa',
		weight = 200,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Bạn đã uống một chút ly trà sữa trân châu đường đen'
        },
    },
    ['bs_softdrink'] = {
		label = 'Trà Sữa Đỏ',
		weight = 200,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Bạn đã uống một chút ly trà sữa đỏ đen'
        },
    },
    ['tailoc_qualon'] = {
		label = 'Sting',
		weight = 200,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Bạn đã uống một chút Tài lộc quá lớn'
        },
    },
	['burger'] = {
		label = 'Bánh mì kẹp thịt',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'Bạn đã ăn một chiếc bánh mì kẹp thịt ngon tuyệt'
		},
	},
	['may_xay'] = {
		label = 'Máy Sấy',
		weight = 1000,
		client = {
			image = 'may_xay.png',
			usetime = 2500,
		}
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'Bạn đã uống một chút nước ngọt'
		}
	},

	['parachute'] = {
		label = 'Dù',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},
	['xa_beng'] = {
		label = 'Xà beng',
		weight = 100,
		image = "xa_beng.png", 
	},
	['garbage'] = {
		label = 'Rác',
		weight = 0,
	},

	['paperbag'] = {
		label = 'Túi giấy',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Giấy tờ tùy thân',
		client = {
			image = 'card_id.png'
		}
	},
	['cuoc_dao_da'] = {
		label = 'Cuốc đào đá',
		weight = 1000,
	},
    ['fishbait'] = {
		label = 'Mồi câu',
		weight = 50,
	},
    ['illegalfishbait'] = {
		label = 'Mồi câu bất hợp pháp',
		weight = 50,
	},
    ['whitepearl'] = {
		label = 'Ngọc trai trắng',
		weight = 100,
	},
    ['bluepearl'] = {
		label = 'Ngọc trai xanh',
		weight = 100,
	},
    ['redpearl'] = {
		label = 'Ngọc trai đỏ',
		weight = 100,
	},
    ['yellowpearl'] = {
		label = 'Ngọc trai vàng',
		weight = 100,
	},
    ['greenpearl'] = {
		label = 'Ngọc trai xanh lục',
		weight = 100,
	},
    ['anchovy'] = {
		label = 'Cá cơm',
		weight = 100,
	},
    ['smallbluefish'] = {
		label = 'Cá nhỏ xanh',
		weight = 100,
	},
    ['bluefish'] = {
		label = 'Cá thu xanh',
		weight = 100,
	},
    ['bonitosfish'] = {
		label = 'Cá kìm',
		weight = 100,
	},
    ['garfish'] = {
		label = 'Cá ngừ',
		weight = 500,
	},
    ['perch'] = {
		label = 'Cá vược',
		weight = 500,
	},
    ['carettacaretta'] = {
		label = 'Rùa biển',
		weight = 1000,
	},
    ['pantolobaligi'] = {
		label = 'Quần dài',
		weight = 100,
	},
    ['sharkfish'] = {
		label = 'Cá mập',
		weight = 1000,
	},
    ['fish'] = {
		label = 'Cá nhỏ',
		weight = 100,
	},
    ['c4_bank'] = {
		label = 'C4',
		weight = 1000,
	},

	['steel'] = {
		label = 'Thép',
		weight = 100,
	},
	['rubber'] = {
		label = 'Cao su',
		weight = 100,
	},
	['metalscrap'] = {
		label = 'Sắt vụn',
		weight = 100,
	},
	['plastic'] = {
		label = 'Nhựa',
		weight = 100,
	},
    -- ['plastic'] = {
	-- 	label = 'Nhựa',
	-- 	weight = 100,
	-- },
	['copper'] = {
		label = 'Đồng',
		weight = 100,
	},
	['balo1'] = {
		label = 'Balo 1',
		weight = 1,
	},
	['thit_tho'] = {
		label = 'Thịt thỏ',
		weight = 500,
	},
	['da_tho'] = {
		label = 'Da thỏ',
		weight = 500,
	},
	['mia'] = {
		label = 'Mía',
		weight = 500,
	},
	['trai_ca_chua'] = {
		label = 'Trái cà chua',
		weight = 500,
	},
	['cu_ca_rot'] = {
		label = 'Củ cà rốt',
		weight = 500,
	},
	['trai_khom'] = {
		label = 'Trái khóm',
		weight = 500,
	},
	['ruby'] = {
		label = 'Ruby',
		weight = 500,
	},
	['sapphire'] = {
		label = 'Ngọc bích',
		weight = 500,
	},
	--NGHỀ CÂU CÁ
	['fishingbait'] = {
		label = 'Mồi câu',
		weight = 100,
	},
	['fishingrod'] = {
		label = 'Cần câu',
		weight = 1000,
	},
	-- ['giun_dat'] = {
	-- 	label = 'Giun đất',
	-- 	weight = 20,
	-- },
--	['ca_rong_den'] = {
--		label = 'Cá Rồng Đen',
--		weight = 500,
--	},
--	['ca_ma_vuong'] = {
--		label = 'Cá Ma Vương',
--		weight = 500,
--	},
--	['ca_than_sam'] = {
--		label = 'Cá Thần Sam',
--		weight = 500,
--	},
--	['ca_kim_cuong'] = {
--		label = 'Cá Kim Cương',
--		weight = 500,
--	},
	['trung_tho'] = {
		label = 'Trứng thỏ',
		weight = 500,
	},
	['sua_tuoi'] = {
		label = 'Sữa tươi',
		weight = 100,
	},
	['tho_con'] = {
		label = 'Thỏ con',
		weight = 500,
	},----NGHỀ ĐÀO ĐÁ
	['phoisat'] = {
		label = 'Phôi sắt',
		weight = 100,
	},
	['phoidong'] = {
		label = 'Phôi đồng',
		weight = 100,
	},
	['phoinhom'] = {
		label = 'Phôi nhôm',
		weight = 100,
	},
	['phoithep'] = {
		label = 'Phôi thép',
		weight = 100,
	},
	['viendahuyenbi'] = {
		label = 'Viên đá huyền bí',
		weight = 500,
	},
	['ngonluamau'] = {
		label = 'Ngọn lửa máu',
		weight = 500,
	},
	['anhsanghuyenbi'] = {
		label = 'Ánh sáng huyền bí',
		weight = 500,
	},
	['thoisat'] = {
		label = 'thỏi sắt',
		weight = 500,
	},
	['bien_so'] = {
		label = 'Biển số',
		weight = 100,
	},
	['thoidong'] = {
		label = 'Thỏi đồng',
		weight = 500,
	},
	['thoithep'] = {
		label = 'Thỏi Thép',
		weight = 500,
	},
	['thoinhom'] = {
		label = 'Thỏi nhôm',
		weight = 500,
	},
	--NGHỀ TRỒNG TRỌT
	['tui_hat_carrot'] = {
		label = 'Túi hạt cà rốt',
		weight = 100,
	},
	['tui_hat_cachua'] = {
		label = 'Túi hạt cà chua',
		weight = 100,
	},
	['tui_hat_mia'] = {
		label = 'Túi hạt mía',
		weight = 100,
	},
	['tui_hat_khom'] = {
		label = 'Túi hạt khóm',
		weight = 100,
	},
	['cai_phay'] = {
		label = 'Cây Xẻng',
		weight = 100,
	},
	['thung_nuoc'] = {
		label = 'Thùng nước',
		weight = 200,
	},
	['khuonduc'] = {
		label = 'Khuôn đúc',
		weight = 100,
	},
	['petrolcan'] = {
		label = 'Bình Xăng',
		weight = 10,
	},
	-- ['phone'] = {
	-- 	label = 'Điện thoại',
	-- 	weight = 700,
	-- 	stack = false,
	-- 	consume = 0,
	-- 	client = {
	-- 		add = function(total)
	-- 			if total > 0 then
	-- 				pcall(function() return exports.npwd:setPhoneDisabled(false) end)
	-- 			end
	-- 		end,

	-- 		remove = function(total)
	-- 			if total < 1 then
	-- 				pcall(function() return exports.npwd:setPhoneDisabled(true) end)
	-- 			end
	-- 		end
	-- 	}
	-- },
    ["cryptostick"] = {
    label = "Crypto Stick",
    weight = 50,
    stack = false,
},

["phone_dongle"] = {
    label = "Phone Dongle",
    weight = 50,
    stack = false,
},

["powerbank"] = {
    label = "Power Bank",
    weight = 50,
    stack = false,
},

['phone'] = {
    label = 'Điện thoại cơ bản',
    weight = 150,
    stack = false,
    consume = 0,
    client = {
        export = "qs-smartphone-pro.UsePhoneItem",
        add = function(total)
            TriggerServerEvent('phone:itemAdd')
        end,

        remove = function(total)
            TriggerServerEvent('phone:itemDelete')
        end
    }
},

['black_phone'] = {
    label = 'Black Phone',
    weight = 150,
    stack = false,
    consume = 0,
    client = {
        export = "qs-smartphone-pro.UsePhoneItem",
        add = function(total)
            TriggerServerEvent('phone:itemAdd')
        end,

        remove = function(total)
            TriggerServerEvent('phone:itemDelete')
        end
    }
},

['yellow_phone'] = {
    label = 'Yellow Phone',
    weight = 150,
    stack = false,
    consume = 0,
    client = {
        export = "qs-smartphone-pro.UsePhoneItem",
        add = function(total)
            TriggerServerEvent('phone:itemAdd')
        end,

        remove = function(total)
            TriggerServerEvent('phone:itemDelete')
        end
    }
},

['red_phone'] = {
    label = 'Điện thoại Đỏ',
    weight = 150,
    stack = false,
    consume = 0,
    client = {
        export = "qs-smartphone-pro.UsePhoneItem",
        add = function(total)
            TriggerServerEvent('phone:itemAdd')
        end,

        remove = function(total)
            TriggerServerEvent('phone:itemDelete')
        end
    }
},

['green_phone'] = {
    label = 'Green Phone',
    weight = 150,
    stack = false,
    consume = 0,
    client = {
        export = "qs-smartphone-pro.UsePhoneItem",
        add = function(total)
            TriggerServerEvent('phone:itemAdd')
        end,

        remove = function(total)
            TriggerServerEvent('phone:itemDelete')
        end
    }
},

['white_phone'] = {
    label = 'Điện thoại trắng',
    weight = 150,
    stack = false,
    consume = 0,
    client = {
        export = "qs-smartphone-pro.UsePhoneItem",
        add = function(total)
            TriggerServerEvent('phone:itemAdd')
        end,

        remove = function(total)
            TriggerServerEvent('phone:itemDelete')
        end
    }
},

	['money'] = {
		label = 'Tiền mặt',
	},

	['mustard'] = {
		label = 'Mù tạt',
		weight = 220,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'Bạn đã uống mù tạt'
		}
	},
	['water'] = {
		label = 'Nước suối',
		weight = 250,
		client = {
			status = { thirst = 250000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Bạn đã uống một chút nước mát'
		}
	},
	['coffee'] = {
		label = 'Cà phê',
		weight = 250,
		client = {
			status = { thirst = 250000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'Bạn đã uống một tách cà phê nóng, tinh thần tỉnh táo hơn!',
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},
    ----nghề trồng cam
    ['namcam'] = {
		label = 'Quả Cam',
		weight = 100,
		stack = true,
		allowArmed = true
	},
    ['ro'] = {
		label = 'Rổ Hái Cam',
		weight = 1000,
		stack = true,
		allowArmed = true
	},
    -- Nghề hái hoa
 --   ['flower_paper'] = {
--		label = 'Rổ Hái Hoa',
--		weight = 100,
--		stack = false,
--		allowArmed = true
--	},

	['armour'] = {
		label = 'Áo chống đạn',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Quần áo',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Thẻ ngân hàng',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},
	['scrapmetal'] = {
		label = 'Thép vụn',
		weight = 100,
        stack = true,
		close = true,
	},
    ['glass'] = {
		label = 'Thủy tinh',
		weight = 100,
        stack = true,
		close = true,
	},
	["cloth_outfit"] = {
		label = 'Trang phục',
		weight = 100,
		stack = false, 
		close = false,
	},
	["cloth_torso"] = {
		label = 'Áo khoác',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_tshirt"] = {
		label = 'Áo thun',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_arms"] = {
		label = 'Tay áo',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_pants"] = {
		label = 'Quần',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_shoes"] = {
		label = 'Giày',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_decals"] = {
		label = 'Họa tiết',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_ears"] = {
		label = "Khuyên tai",
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_mask"] = {
		label = 'Mặt nạ',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_bproof"] = {
		label = 'Áo chống đạn',
		weight = 500,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_chain"] = {
		label = 'Dây chuyền',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_bags"] = {
		label = 'Balo',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_glasses"] = {
		label = 'Kính',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_watches"] = {
		label = 'Đồng hồ',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_bracelets"] = {
		label = 'Vòng tay',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
	["cloth_helmet"] = {
		label = 'Mũ/Nón',
		weight = 100,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'LUANest_Clothes.clothes'
		},
	},
    ["clothes"] = {
    	label = 'Quần áo',
    	weight = 100,
    	stack = false,
    	close = true,
    	consume = 0,
    	client = {
    		anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
    		usetime = 2500,
    		export = 'LUANest_Clothes.useClothes'
    	}
    },
    ["advancedrepairkit"] = {
		label = "Bộ Sửa Chữa Xịn",
		weight = 500,
		stack = true,
		close = true,
		description = "Một Hộp Dụng Cụ Đẹp Với Những Thứ Để Sửa Chữa Chiếc Xe Của Bạn",
		client = {
			image = "advancedkit.png",
		}
	},
    ["advancedkit"] = {
		label = "Bộ Sửa Chữa Xe",
		weight = 1000,
		stack = true,
		close = true,
		description = "Một Hộp Dụng Cụ Đẹp Với Những Thứ Để Sửa Chữa Chiếc Xe Của Bạn",
		client = {
			image = "advancedkit.png",
		}
	},

    --- UPDATE LIST ITEM
    ['tui_hat_cachua'] = {
        label = 'Túi Hạt Cà Chua',
        weight = 100,
    },
    
    ['tui_hat_carrot'] = {
        label = 'Túi Hạt Cà Rốt',
        weight = 100,
    },
    ['tui_hat_mia'] = {
        label = 'Túi Hạt Mía',
        weight = 100,
    },
    
    ['tui_hat_khom'] = {
        label = 'Túi Hạt Khóm',
        weight = 100,
    },
    ['thung_nuoc'] = {
        label = 'Thùng Nước',
        weight = 500,
    },
    
    ['cai_phay'] = {
        label = 'Cái Phay',
        weight = 500, 
    },
	['huntingbait'] = {
        label = 'Mồi Săn',
        weight = 50, 
    },
    
    ['cu_ca_rot'] = {
        label = 'Củ Cà Rốt',
        weight = 200,
    },
    
    ['trai_ca_chua'] = {
        label = 'Trái Cà Chua',
        weight = 200,
    },

    ['trai_khom'] = {
        label = 'Trái Khóm',
        weight = 200,
    },
    ['mia'] = {
        label = 'Mía',
        weight = 200,
    },

    ['thit_tho'] = {
        label = 'Thịt Thỏ',
        weight = 300, 
    },
    
    ['bluegill'] = {
        label = 'Cá rô xanh',
        weight = 300,
    },
    
    ['giun_dat'] = {
        label = 'Giun Đất',
        weight = 200,
    },
    
    ['ca_he'] = {
        label = 'Cá Hề',
        weight = 500,
    },
    
    ['sao_bien'] = {
        label = 'Sao biển',
        weight = 500, 
    },
    
    ['muc_bien'] = {
        label = 'Mực biển',
        weight = 500,
    },
    -- NGHỀ ĐÁ
    ['rock'] = {
        label = "Đá",
        weight = 20,
        stack = true,
        close = false,
    },
    ['crystal'] = {
        label = "Pha Lê",
        weight = 20,
        stack = true,
        close = false,
    },
    ['emerald'] = {
        label = "Ngọc Lục Bảo",
        weight = 20,
        stack = true,
        close = false,
    },
    ['garnet'] = {
        label = "Ngọc Hồng Lựu",
        weight = 20,
        stack = true,
        close = false,
    },
    ['gold'] = {
        label = "Vàng",
        weight = 20,
        stack = true,
        close = false,
    },
    ['lead'] = {
        label = "Chì",
        weight = 20,
        stack = true,
        close = false,
    },
    ['nefrit'] = {
        label = "Ngọc Bích",
        weight = 20,
        stack = true,
        close = false,
    },
    ['quartz'] = {
        label = "Thạch Anh",
        weight = 20,
        stack = true,
        close = false,
    },
    ['ruby'] = {
        label = "Hồng Ngọc",
        weight = 500,
        stack = true,
        close = false,
    },
    ['sapphire'] = {
        label = "Lam Ngọc",
        weight = 500,
        stack = true,
        close = false,
    },
    ['silver'] = {
        label = "Bạc",
        weight = 500,
        stack = true,
        close = false,
    },
    ['sulphur'] = {
        label = "Lưu Huỳnh",
        weight = 500,
        stack = true,
        close = false,
    },
    ["aluminum"] = {
        label = "Nhôm",
        weight = 500,
        stack = true,
        close = true,
    },
    ["iron"] = {
        label = "Sắt",
        weight = 500,
        stack = true,
        close = true,
    },
    ["bass"] = {
        label = "Cá Basa",
        weight = 500,
        stack = true,
        close = true,
    },
    ["bao_thach_bien_sau"] = {
        label = "Bảo Thạch Biển Sâu",
        weight = 500,
        stack = true,
        close = true,
    },
    ["amfetamina"] = {
        label = "Amfetamina",
        weight = 200,
        stack = true,
        close = true,
    },
    ["aluminumoxide"] = {
        label = "Gói thuốc lạ",
        weight = 200,
        stack = true,
        close = true,
    },
    ["125zr"] = {
        label = "Yaz 125zr",
        weight = 200,
        stack = true,
        close = true,
    },
    ["adrenaline"] = {
        label = "Adrenaline",
        weight = 200,
        stack = true,
        close = true,
    },
    ["bong"] = {
        label = "Cái Bong",
        weight = 200,
        stack = true,
        close = true,
    },
    ["alivechicken"] = {
        label = "Gà sống",
        weight = 200,
        stack = true,
        close = true,
    },
    ["raw_chicken"] = {
        label = "Thịt Gà",
        weight = 200,
        stack = true,
        close = true,
    },
    ["chicken"] = {
        label = "Hộp Thịt Gà",
        weight = 500,
        stack = true,
        close = true,
    },
    ["chicken_feather"] = {
        label = "Lông Gà",
        weight = 100,
        stack = true,
        close = true,
    },
    ["chickenbreast"] = {
        label = "Ức Gà",
        weight = 100,
        stack = true,
        close = true,
    },
    ["packaged_chicken"] = {
        label = "Đùi Gà",
        weight = 100,
        stack = true,
        close = true,
    },
    ["ban_do_kho_bau"] = {
        label = "Bản Đồ Kho Báu",
        weight = 100,
        stack = true,
        close = true,
    },
    ["banve_xabeng"] = {
        label = "Bản Vẽ Sà Beng",
        weight = 100,
        stack = true,
        close = true,
    },
    ["banve_baodao"] = {
        label = "Bản Vẽ Bảo Đao",
        weight = 100,
        stack = true,
        close = true,
    },
    ["banve_bua"] = {
        label = "Bản Vẽ Bùa",
        weight = 100,
        stack = true,
        close = true,
    },
    ["briefcase"] = {
        label = "Cặp Đựng Hồ Sơ",
        weight = 500,
        stack = true,
        close = true,
    },
    ["boxofweed"] = {
        label = "Cây hoàng dương",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bpassaultsmg"] = {
        label = "Bản Vẽ SMG",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bpbullpuprifle"] = {
        label = "Bản Vẽ Rifle",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bpcompactrifle"] = {
        label = "Bản Vẽ Compact Rifle",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bpcompactrifle"] = {
        label = "Bản Vẽ Compact Rifle",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bpgusenberg"] = {
        label = "Bản Vẽ Gusenberg",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bpmusket"] = {
        label = "Bản Vẽ súng hỏa mai",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bppistol"] = {
        label = "Bản Vẽ Pistol",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bppistol50"] = {
        label = "Bản Vẽ Pistol 50",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bppistolmk2"] = {
        label = "Bản Vẽ Pistol MK2",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bpsawnoffshotgun"] = {
        label = "Bản Vẽ Shotgun",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bpsmg"] = {
        label = "Bản Vẽ SMG",
        weight = 100,
        stack = true,
        close = true,
    },
    ["brokenknife"] = {
        label = "Con dao gãy",
        weight = 100,
        stack = true,
        close = true,
    },
    --------------------------
    ["cuon_tien_ban"] = {
        label = "Cuộn Tiền Bẩn",
        weight = 100,
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["dong_xu_ban"] = {
        label = "Đồng Xu Bẩn",
        weight = 100,
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["day_dong"] = {
        label = "Dây Đồng",
        weight = 100,
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["day_chuyen"] = {
        label = "Dây Chuyền",
        weight = 20,
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["kim_cuong"] = {
        label = "Kim Cương",
        weight = 20,
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["the_nha"] = {
        label = "Thẻ Nhà",
        weight = 20,
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["vi_tien"] = {
        label = "Ví Tiền",
        weight = 20,
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["bao_thuoc_la"] = {
        label = "Bao thuốc lá",
        weight = 200,
        stack = true,
        close = true,
        durability = 100,
    },
	["thuocla_555"] = {
        label = "Bao thuốc lá 555",
        weight = 200,
        stack = true,
        close = true,
        durability = 100,
    },
    --------------------------
    ["cuon_tien_ban_tich_thu"] = {
        label = "Cuộn Tiền Bẩn [TỊCH THU]",
        weight = 20,
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["dong_xu_ban_tich_thu"] = {
        label = "Đồng Xu Bẩn [TỊCH THU]",
        weight = 20,
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["day_dong_tich_thu"] = {
        label = "Dây Đồng [TỊCH THU]",
        weight = 20,
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["day_chuyen_tich_thu"] = {
        label = "Dây Chuyền [TỊCH THU]",
        weight = 20,
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["kim_cuong_tich_thu"] = {
        label = "Kim Cương [TỊCH THU]",
        weight = 20,
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["the_nha_tich_thu"] = {
        label = "Thẻ Nhà [TỊCH THU]",
        weight = 20,
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["vi_tien_tich_thu "] = {
        label = "Ví Tiền [TỊCH THU]",
        weight = 20,
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    
    ['loa_phat_thanh'] = {
        label = 'Loa Phát Thanh',
        weight = 1000,
    },

    ---- NGHỀ CÂU CÁ 
    ["ca_ma_vuong"] = {
        label = "Cá Ma Vương",
        weight = 800,  
        stack = true,
        close = true,
        description = "Cá kỳ bí với màu sắc u tối, thường xuất hiện ở vùng nước sâu và tối.",
    },
    
    ["ca_than_sam"] = {
        label = "Cá Thần Sấm",
        weight = 800, 
        stack = true,
        close = true,
        description = "Loài cá uy nghiêm với âm thanh như tiếng sấm khi xuất hiện từ đáy biển.",
    },
    
    ["ca_kim_cuong"] = {
        label = "Cá Kim Cương",
        weight = 400,  
        stack = true,
        close = true,
        description = "Cá lấp lánh với vẻ đẹp như kim cương, có giá trị cao trong các buổi đấu giá.",
    },
    
    ["ca_rong_den"] = {
        label = "Cá Rồng Đen",
        weight = 600, 
        stack = true,
        close = true,
        description = "Loài cá truyền thuyết với sức mạnh bí ẩn, thường ẩn mình dưới đáy biển sâu.",
    },

    ["bao_thach_bien_sau"] = {
        label = "Bảo Thạch Biển Sâu",
        weight = 100, 
        stack = true,
        close = true,
        description = "Viên đá quý được ẩn giấu trong lòng đại dương, có giá trị cho các nhà sưu tập.",
    },
    
    ["ngoc_hai_vuong"] = {
        label = "Ngọc Hải Vương",
        weight = 200,  
        stack = true,
        close = true,
        description = "Viên ngọc xanh biếc, được cho là biểu tượng của quyền năng biển cả.",
    },

    ["vang_tho_tich_thu"] = {
        label = "Vàng Thô [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    ["vang_nguyen_khoi_tich_thu"] = {
        label = "Vàng Nguyên Khối [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    
    ["bac_tho_tich_thu"] = {
        label = "Bạc Thô [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    ["bac_nguyen_khoi_tich_thu"] = {
        label = "Bạc Nguyên Khối [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    
    ["thach_bang_lam_tich_thu"] = {
        label = "Thạch Băng Lam [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    ["huyet_ngoc_hoang_gia_tich_thu"] = {
        label = "Huyết Ngọc Hoàng Gia [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    ["hong_ngoc_vinh_quang_tich_thu"] = {
        label = "Hồng Ngọc Vinh Quang [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    ["luc_bao_linh_tich_thu"] = {
        label = "Lục Bảo Linh [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    ["tu_tinh_thach_tich_thu"] = {
        label = "Tử Tinh Thạch [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    
    ["go_tram_huong_tich_thu"] = {
        label = "Gỗ Trầm Hương [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    ["go_cam_lai_tich_thu"] = {
        label = "Gỗ Cẩm Lai [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
        description = "Vật phẩm bị tịch thu",
    },
    
    ["vang_tho"] = {
        label = "Vàng Thô",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Special',
        description = "Một khối vàng thô chưa qua tinh chế, vẫn còn nguyên vẻ hoang sơ của tự nhiên.",
    },
    ["vang_nguyen_khoi"] = {
        label = "Vàng Nguyên Khối",
        weight = 700,  
        stack = true,
        close = true,
        type = 'Special',
        description = "Một khối vàng tinh luyện, lấp lánh và có giá trị cao.",
    },
    
    ["bac_tho"] = {
        label = "Bạc Thô",
        weight = 450,  
        stack = true,
        close = true,
        type = 'Special',
        description = "Một khối bạc thô với màu sắc trắng đục, chưa qua quá trình tinh luyện.",
    },
    ["bac_nguyen_khoi"] = {
        label = "Bạc Nguyên Khối",
        weight = 600,  
        stack = true,
        close = true,
        type = 'Special',
        description = "Một khối bạc tinh luyện sáng bóng, có giá trị trong chế tác trang sức và công nghệ.",
    },
    

    ["thach_bang_lam"] = {
        label = "Thạch Băng Lam",
        weight = 250,  
        stack = true,
        close = true,
        type = 'Do_Ban',
        description = "Một viên thạch xanh lam sắc bén như băng, mang lại cảm giác mát lạnh khi chạm vào.",
    },
    ["huyet_ngoc_hoang_gia"] = {
        label = "Huyết Ngọc Hoàng Gia",
        weight = 350, 
        stack = true,
        close = true,
        type = 'Do_Ban',
        description = "Một viên huyết ngọc đỏ rực, biểu tượng của sức mạnh và hoàng quyền.",
    },
    ["hong_ngoc_vinh_quang"] = {
        label = "Hồng Ngọc Vinh Quang",
        weight = 300,  
        stack = true,
        close = true,
        type = 'Do_Ban',
        description = "Viên hồng ngọc lấp lánh, biểu tượng của vinh quang và chiến thắng.",
    },
    ["luc_bao_linh"] = {
        label = "Lục Bảo Linh",
        weight = 270,  
        stack = true,
        close = true,
        type = 'Do_Ban',
        description = "Viên đá lục bảo xanh ngọc, biểu tượng của thiên nhiên và sự trường tồn.",
    },
    ["tu_tinh_thach"] = {
        label = "Tử Tinh Thạch",
        weight = 280,  
        stack = true,
        close = true,
        type = 'Do_Ban',
        description = "Viên đá tím huyền bí, tỏa ra năng lượng kỳ bí và quyền năng.",
    },
    
    ["go_tram_huong"] = {
        label = "Gỗ Trầm Hương",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Do_Ban',
        description = "Loại gỗ quý hiếm, thường được dùng trong các nghi thức tôn giáo và mang lại hương thơm độc đáo.",
    },
    ["go_cam_lai"] = {
        label = "Gỗ Cẩm Lai",
        weight = 450,  
        stack = true,
        close = true,
        type = 'Do_Ban',
        description = "Loại gỗ cứng, vân đẹp và cực kỳ bền, được sử dụng cho các sản phẩm nội thất và trang trí cao cấp.",
    },

    ["thachden"] = {
		label = "Thạch Mặt Trăng Đen",
		weight = 1000,
		stack = true,
		close = true,
		description = 'Thạch Mặt Trăng Đen, một viên đá bí ẩn có nguồn gốc từ ánh sáng mặt trăng, mang lại sức mạnh huyền bí. Đem nó đi tinh luyện để khai thác sức mạnh tiềm ẩn của nó.',
	},	
	["thachtrang"] = {
		label = "Thạch Ánh Trăng",
		weight = 1000,
		stack = true,
		close = true,
		description = 'Thạch Ánh Trăng, viên đá phát sáng như ánh trăng, được biết đến với khả năng tạo ra những câu thần chú bí ẩn. Nguồn gốc sâu xa của nó chứa đựng nhiều bí mật.',
	},	
	["thachdo"] = {
		label = "Thạch Máu",
		weight = 1000,
		stack = true,
		close = true,
		description = 'Thạch Máu, một viên đá đỏ rực rỡ, chứa đựng năng lượng từ những cuộc chiến lịch sử. Nó mang sức mạnh và sự quyết đoán, phù hợp cho những ai cần sức mạnh tinh thần.',
	},	
	["thachxanh"] = {
		label = "Thạch Đại Dương",
		weight = 1000,
		stack = true,
		close = true,
		description = 'Thạch Đại Dương, viên đá xanh biếc như biển cả, chứa đựng năng lượng thanh bình và sức mạnh của đại dương. Nó là biểu tượng của sự hòa bình và sự vững vàng.',
	},
	-- ITEM QUAN TRỌNG ĐÀO ĐÁ
	["viendahuyenbi"] = {
		label = "Viên đá huyền bí",
		weight = 500,
		stack = true,
		close = true,
        type = 'Special',
		description = 'Viên đá huyền bí phát sáng với ánh sáng bí ẩn, chứa đựng sức mạnh ma thuật cổ xưa. Nó gắn liền với các bí ẩn của vũ trụ và có khả năng kích thích sức mạnh tiềm ẩn của nó.',
	},  
	["vienngocbienca"] = {
		label = "Viên ngọc biển cả",
		weight = 500,
		stack = true,
		close = true,
        type = 'Special',
		description = 'Viên ngọc biển cả có màu xanh biếc như đại dương, mang đến cảm giác thanh bình và hòa quyện với năng lượng của biển cả. Nó là biểu tượng của sự yên bình và sức mạnh vững bầu trời.',
	},  
	["ngonluamau"] = {
		label = "Ngọn lửa máu",
		weight = 500,
		stack = true,
		close = true,
        type = 'Special',
		description = 'Ngọn lửa máu sáng đỏ rực rỡ, chứa đựng năng lượng mãnh liệt và sức mạnh chiến đấu. Nó là biểu tượng của sức mạnh và lòng dũng cảm không thể bị phá vỡ.',
	},  
	["anhsanghuyenbi"] = {
		label = "Ánh sáng huyền bí",
		weight = 500,
		stack = true,
		close = true,
        type = 'Special',
		description = 'Ánh sáng huyền bí tỏa ra từ viên đá này chứa đựng sự bí ẩn và quyền năng tối thượng. Nó phản chiếu ánh sáng của các thế lực siêu nhiên và có khả năng kết nối người sử dụng với thế giới thần thoại.',
	},  	
	--- ITEM ĐÀO ĐÁ CƠ BẢN
	["khuon_nung"] = {
		label = "Khuôn Nung",
		weight = 500,
		stack = true,
		close = true,
        durability = 100,
        type = 'Tool',
		description = 'Khuôn nung là một thỏi thép chắc chắn, được chế tạo từ những phôi thép tinh luyện. Được thiết kế với độ bền cao, khuôn nung không chỉ là nguyên liệu chính trong việc chế tạo các dụng cụ và vũ khí bằng thép mà còn là công cụ không thể thiếu để nâng cấp và cải thiện các vật phẩm trong trò chơi. Với khuôn nung trong tay, bạn có thể biến các nguyên liệu thô thành những sản phẩm chất lượng, sẵn sàng cho những thử thách lớn lao.',
	},	
	["phoisat"] = {
		label = "Phôi sắt",
		weight = 500,
		stack = true,
		close = true,
		description = 'Phôi sắt là nguyên liệu cơ bản dùng để chế tạo các vật phẩm bằng sắt. Nó thường được sử dụng trong các công thức chế tạo để tạo ra các thỏi sắt tinh luyện hơn.',
	},  
	["phoidong"] = {
		label = "Phôi đồng",
		weight = 500,
		stack = true,
		close = true,
		description = 'Phôi đồng là nguyên liệu cơ bản dùng để chế tạo các vật phẩm bằng đồng. Nó thường được sử dụng trong các công thức chế tạo để tạo ra các thỏi đồng tinh luyện hơn.',
	},  
	["phoinhom"] = {
		label = "Phôi nhôm",
		weight = 500,
		stack = true,
		close = true,
		description = 'Phôi nhôm là nguyên liệu cơ bản dùng để chế tạo các vật phẩm bằng nhôm. Nó thường được sử dụng trong các công thức chế tạo để tạo ra các thỏi nhôm tinh luyện hơn.',
	},  
	["phoithep"] = {
		label = "Phôi thép",
		weight = 500,
		stack = true,
		close = true,
		description = 'Phôi thép là nguyên liệu cơ bản dùng để chế tạo các vật phẩm bằng thép. Nó thường được sử dụng trong các công thức chế tạo để tạo ra các thỏi thép tinh luyện hơn.',
	},  
	["cuoc_dao_da"] = {
		label = "Cuốc Đào Đá",
		weight = 500,
		stack = false,
		close = true,
		durability = 100,
        type = 'Tool',
		description = 'Cuốc đào đá là một công cụ cứng cáp và bền bỉ, được chế tạo từ thép chất lượng cao. Với thiết kế chắc chắn và tay cầm vững vàng, cuốc đào đá là lựa chọn hoàn hảo để khai thác các loại đá quý hiếm và khoáng sản trong trò chơi. Dụng cụ này không chỉ giúp bạn thu thập tài nguyên một cách hiệu quả mà còn có thể được sử dụng để chế tạo và nâng cấp các vật phẩm, giúp bạn trở thành một thợ đào mỏ lão luyện và thành công trong các nhiệm vụ khai thác của mình.',
	},
    ["the_y_te"] = {
        label = "Thẻ Y Tế",
        weight = 200,  
        stack = true,
        close = true,
        description = "Vật phẩm thẻ ý tế của ban ngành bác sĩ",
    },

    ["the_nganh"] = {
        label = "Thẻ Ngành",
        weight = 200,  
        stack = true,
        close = true,
        description = "Vật phẩm thẻ ngành của ban ngành cảnh sát",
    },

    ["may_tinh_nuoi_thu"] = {
        label = "Quản Lí Trang Trại",
        weight = 2000,  
        stack = true,
        close = true,
    },

    ["bien_bao_tich_thu"] = {
        label = "Biển Báo [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
    },

    ["bien_bao"] = {
        label = "Biển Báo",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },

    ["lop_xe"] = {
        label = "Lốp xe",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["nap_capo"] = {
        label = "Nắp Capo",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["cua_xe"] = {
        label = "Cửa Xe",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["cop_xe"] = {
        label = "Cốp Xe",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["cop_xe"] = {
        label = "Cốp Xe",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },

    ["nap_capo_tich_thu"] = {
        label = "Nắp Capo [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["cua_xe_tich_thu"] = {
        label = "Cửa Xe [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["cop_xe_tich_thu"] = {
        label = "Cốp Xe [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },
    ["cop_xe_tich_thu"] = {
        label = "Cốp Xe [TỊCH THU]",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Tich_Thu',
    },

    ["boombox"] = {
        label = "Boombox",
        weight = 0,  
        stack = true,
        close = true,
    },

    ["cay_keo"] = {
        label = "Cây Kéo",
        weight = 500,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["can_sa_tho"] = {
        label = "Cần Sa Thô",
        weight = 200,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["can_da_say"] = {
        label = "Cần Sa Đã Sấy",
        weight = 200,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["may_xay"] = {
        label = "Máy Xay",
        weight = 1000,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },
    ["weed_kush"] = {
        label = "Cần Sa lạ",
        weight = 200,  
        stack = true,
        close = true,
        type = 'Do_Ban',
    },

    ["may_nghe_nhac_1"] = {
        label = "Máy Nghe Nhạc 1",
        weight = 1000,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["may_nghe_nhac_2"] = {
        label = "Máy Nghe Nhạc 2",
        weight = 1000,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["may_nghe_nhac_3"] = {
        label = "Máy Nghe Nhạc 3",
        weight = 1000,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["may_nghe_nhac_4"] = {
        label = "Máy Nghe Nhạc 4",
        weight = 1000,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },

    ["vouncher_giam_gia_10"] = {
        label = "Vouncher giảm giá 10%",
        weight = 50,  
        stack = true,
        close = true,
    },

    ["vouncher_giam_gia_20"] = {
        label = "Vouncher giảm giá 20%",
        weight = 50,  
        stack = true,
        close = true,
    },

    ["phu_kien_1"] = {
        label = "Phụ Kiện #1",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_2"] = {
        label = "Phụ Kiện #2",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_3"] = {
        label = "Phụ Kiện #3",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_4"] = {
        label = "Phụ Kiện #4",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_5"] = {
        label = "Phụ Kiện #5",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_6"] = {
        label = "Phụ Kiện #6",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_7"] = {
        label = "Phụ Kiện #7",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_8"] = {
        label = "Phụ Kiện #8",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_9"] = {
        label = "Phụ Kiện #9",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_10"] = {
        label = "Phụ Kiện #10",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_11"] = {
        label = "Phụ Kiện #11",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_12"] = {
        label = "Phụ Kiện #12",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_13"] = {
        label = "Phụ Kiện #13",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_14"] = {
        label = "Phụ Kiện #14",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_15"] = {
        label = "Phụ Kiện #15",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_16"] = {
        label = "Phụ Kiện #16",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_17"] = {
        label = "Phụ Kiện #17",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_18"] = {
        label = "Phụ Kiện #18",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_19"] = {
        label = "Phụ Kiện #19",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_20"] = {
        label = "Phụ Kiện #20",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_21"] = {
        label = "Phụ Kiện #21",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_22"] = {
        label = "Phụ Kiện #22",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_23"] = {
        label = "Phụ Kiện #23",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_24"] = {
        label = "Phụ Kiện #24",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_25"] = {
        label = "Phụ Kiện #25",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_26"] = {
        label = "Phụ Kiện #26",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_27"] = {
        label = "Phụ Kiện #27",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_28"] = {
        label = "Phụ Kiện #28",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_29"] = {
        label = "Phụ Kiện #29",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_30"] = {
        label = "Phụ Kiện #30",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_31"] = {
        label = "Phụ Kiện #31",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_32"] = {
        label = "Phụ Kiện #32",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_33"] = {
        label = "Phụ Kiện #33",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_34"] = {
        label = "Phụ Kiện #34",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_35"] = {
        label = "Phụ Kiện #35",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_36"] = {
        label = "Phụ Kiện #36",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_37"] = {
        label = "Phụ Kiện #37",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_38"] = {
        label = "Phụ Kiện #38",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_39"] = {
        label = "Phụ Kiện #39",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_40"] = {
        label = "Phụ Kiện #40",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_41"] = {
        label = "Phụ Kiện #41",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_42"] = {
        label = "Phụ Kiện #42",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_43"] = {
        label = "Phụ Kiện #43",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_44"] = {
        label = "Phụ Kiện #44",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_45"] = {
        label = "Phụ Kiện #45",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_46"] = {
        label = "Phụ Kiện #46",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_47"] = {
        label = "Phụ Kiện #47",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_48"] = {
        label = "Phụ Kiện #48",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_49"] = {
        label = "Phụ Kiện #49",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_50"] = {
        label = "Phụ Kiện #50",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_51"] = {
        label = "Phụ Kiện #51",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_52"] = {
        label = "Phụ Kiện #52",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_53"] = {
        label = "Phụ Kiện #53",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_54"] = {
        label = "Phụ Kiện #54",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_55"] = {
        label = "Phụ Kiện #55",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_56"] = {
        label = "Phụ Kiện #56",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_57"] = {
        label = "Phụ Kiện #57",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_58"] = {
        label = "Phụ Kiện #58",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_59"] = {
        label = "Phụ Kiện #59",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_60"] = {
        label = "Phụ Kiện #60",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_61"] = {
        label = "Phụ Kiện #61",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_62"] = {
        label = "Phụ Kiện #62",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_63"] = {
        label = "Phụ Kiện #63",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_64"] = {
        label = "Phụ Kiện #64",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_65"] = {
        label = "Phụ Kiện #65",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_66"] = {
        label = "Phụ Kiện #66",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_67"] = {
        label = "Phụ Kiện #67",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_68"] = {
        label = "Phụ Kiện #68",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_69"] = {
        label = "Phụ Kiện #69",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_70"] = {
        label = "Phụ Kiện #70",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_71"] = {
        label = "Phụ Kiện #71",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_72"] = {
        label = "Phụ Kiện #72",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_73"] = {
        label = "Phụ Kiện #73",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_74"] = {
        label = "Phụ Kiện #74",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_75"] = {
        label = "Phụ Kiện #75",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_76"] = {
        label = "Phụ Kiện #76",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_77"] = {
        label = "Phụ Kiện #77",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_78"] = {
        label = "Phụ Kiện #78",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_79"] = {
        label = "Phụ Kiện #79",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_80"] = {
        label = "Phụ Kiện #81",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_81"] = {
        label = "Phụ Kiện #81",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_82"] = {
        label = "Phụ Kiện #82",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_83"] = {
        label = "Phụ Kiện #83",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["phu_kien_84"] = {
        label = "Phụ Kiện #84",
        weight = 0,  
        stack = true,
        close = true,
        type = 'Phu_Kien',
    },
    ["ban_do_kho_bau"] = {
		label = "Bản Đồ Kho Báu",
		weight = 200,
		stack = true,
		close = true,
        type = 'Special',
	},	
    ["may_do_kho_bau"] = {
		label = "Máy Dò Kho Báu",
		weight = 500,
		stack = true,
		close = true,
	},	
    ["bao_li_xi_1"] = {
		label = "Bao Lì Xi #1",
		weight = 300,
		stack = true,
		close = true,
	},
    ["bao_li_xi_2"] = {
		label = "Bao Lì Xi #2",
		weight = 300,
		stack = true,
		close = true,
	},
    ["manh_ban_do_1"] = {
		label = "Mảnh Bản Đồ 1",
		weight = 200,
		stack = true,
		close = true,
        type = 'Special',
	},	
    ["manh_ban_do_2"] = {
		label = "Mảnh Bản Đồ 2",
		weight = 200,
		stack = true,
		close = true,
        type = 'Special',
	},	
    ["manh_ban_do_3"] = {
		label = "Mảnh Bản Đồ 3",
		weight = 200,
		stack = true,
		close = true,
        type = 'Special',
	},	
    ["manh_ban_do_4"] = {
		label = "Mảnh Bản Đồ 4",
		weight = 200,
		stack = true,
		close = true,
        type = 'Special',
	},	
    ["manh_ban_do_5"] = {
		label = "Mảnh Bản Đồ 5",
		weight = 200,
		stack = true,
		close = true,
        type = 'Special',
	},	
    ["bien_so"] = {
		label = "Biển Số",
		weight = 0,
		stack = true,
		close = true,
	},	
    ["dat_phu_sa"] = {
		label = "Đất Phù Sa",
		weight = 400,
		stack = true,
		close = true,
        type = 'Special',
	},	
    ["nhua_cay_ma_thuat"] = {
		label = "Nhựa Cây Ma Thuật",
		weight = 200,
		stack = true,
		close = true,
        type = 'Special',
	},
    ["the_nha_manh_1"] = {
		label = "Thẻ nhà mảnh 1",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["the_nha_manh_2"] = {
		label = "Thẻ nhà mảnh 2",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["the_nha"] = {
		label = "Thẻ nhà",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},

    ["diamond_ring_silver"] = {
		label = "Nhẫn Kim Cương Bạc",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_earring"] = {
		label = "Lắc Tai Kim Cương",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_earring_silver"] = {
		label = "Lắc Tai Kim Cương Bạc",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_necklace"] = {
		label = "Vòng cổ kim cương",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_necklace_silver"] = {
		label = "Vòng cổ Kim Cương Bạc",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_ring"] = {
		label = "Nhẫn kim cương",
		weight = 200,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond"] = {
		label = "Kim cương",
		weight = 500,
		stack = true,
		close = true,
        -- type = 'Do_Ban',
	},
    ["rolex"] = {
		label = "Đồng Hồ Rolex",
		weight = 1000,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    -- TỊCH THU 
    ["diamond_ring_silver_tich_thu"] = {
		label = "Nhẫn kim Kim Cương Bạc [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_earring_tich_thu"] = {
		label = "Lắc Tai Kim Cương [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_earring_silver_tich_thu"] = {
		label = "Lắc Tai Kim Cương Bạc [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_necklace_tich_thu"] = {
		label = "Vòng cổ kim cương [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_necklace_silver_tich_thu"] = {
		label = "Vòng cổ Kim Cương Bạc [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_ring_tich_thu"] = {
		label = "Nhẫn kim cương [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["diamond_tich_thu"] = {
		label = "Kim cương [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["rolex_tich_thu"] = {
		label = "Đồng Hồ Rolex [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["tui_mu"] = {
		label = "Túi Mù",
		weight = 300,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["tui_mu_tich_thu"] = {
		label = "Túi Mù [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},

    -- TRỘM NHÀ
    ["dong_ho"] = {
		label = "Đồng Hồ",
		weight = 300,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["vong_tay"] = {
		label = "Vòng Tay",
		weight = 300,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["nhan"] = {
		label = "Nhẫn",
		weight = 300,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["tv"] = {
		label = "TiVI",
		weight = 1000,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["dong_ho_tich_thu"] = {
		label = "Đồng Hồ [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["vong_tay_tich_thu"] = {
		label = "Vòng Tay [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["nhan_tich_thu"] = {
		label = "Nhẫn [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["tv_tich_thu"] = {
		label = "TiVI [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["trang_suc"] = {
		label = "Trang Sức",
		weight = 300,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["trang_suc_tich_thu"] = {
		label = "Trang Sức [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["may_cua"] = {
		label = "Máy Cưa",
		weight = 1000,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["dangusac"] = {
		label = "Đá Ngũ Sắc",
		weight = 100,
		stack = true,
		close = true,
	},
    ["may_cua_tich_thu"] = {
		label = "Máy Cưa [TỊCH THU]",
		weight = 0,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["giay_ban_xe"] = {
		label = "Giấy Bán Xe",
		weight = 300,
		stack = true,
		close = true,
	},
    
	["weaponlicense"] = {
		label = "Giấy Phép Sử Dụng Vũ Khí",
		weight = 0,
		stack = false,
		close = true,
		description = "Giấy Phép Sử Dụng Vũ Khí",
		client = {
			image = "weapon_license.png",
		}
	},
    ["lawyerpass"] = {
		label = "Thẻ Luật Sư",
		weight = 0,
		stack = false,
		close = false,
		description = "Thẻ dành riêng cho luật sư để chứng minh họ có thể đại diện cho nghi phạm",
		client = {
			image = "lawyerpass.png",
		}
	},
    ["hom_gacha_v1"] = {
		label = "Gòm Gacha v1",
		weight = 0,
		stack = true,
		close = true,
	},
    ["repairkit"] = {
		label = "Bộ Sửa Chữa",
		weight = 2500,
		stack = true,
		close = true,
		description = "Một Hộp Dụng Cụ Đẹp Với Những Thứ Để Sửa Chữa Chiếc Xe Của Bạn",
		client = {
			image = "repairkit.png",
		}
	},
    ["weaponrepairkit"] = {
		label = "bộ sửa chữa vũ khí",
		weight = 2000,
		stack = false,
		close = true,
		description = "",
		client = {
			image = "weaponrepairkit.png",
		}
	},
    ["body_repair_kit"] = {
        label = "Bộ sửa thân xe",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["cosmetics"] = {
        label = "Cosmetics",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["mechanic_toolbox"] = {
        label = "Bộ sửa động cơ",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
        client = {
            export = 'mt_workshops.openToolboxMenu'
        }
    },
    ["neons_controller"] = {
        label = "Bộ chỉnh sửa đèn Neon",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
        client = {
            export = 'mt_workshops.openLightsController'
        }
    },
    ["mods_list"] = {
        label = "Danh sách mod list xe",
        weight = 0,
        stack = true,
        close = true,
        description = "",
        client = {
            export = 'mt_workshops.openCosmeticsMenu'
        }
    },
    ["extras_controller"] = {
        label = "Bổ sung thêm xe",
        weight = 0,
        stack = true,
        close = true,
        description = "",
        client = {
            export = 'mt_workshops.openExtrasMenu'
        }
    },
    ["engine_s"] = {
        label = "Động Cơ S",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["engine_a"] = {
        label = "Động Cơ A",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["engine_b"] = {
        label = "Động Cơ B",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["engine_c"] = {
        label = "Động Cơ C",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["engine_d"] = {
        label = "Động Cơ D",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["transmission_s"] = {
        label = "Lây Truyền S",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["transmission_a"] = {
        label = "Lây Truyền A",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["transmission_b"] = {
        label = "Lây Truyền B",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["transmission_c"] = {
        label = "Lây Truyền C",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["transmission_d"] = {
        label = "Lây Truyền D",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["suspension_s"] = {
        label = "Hệ thống treo S",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["suspension_a"] = {
        label = "Hệ thống treo A",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["suspension_b"] = {
        label = "Hệ thống treo B",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["suspension_c"] = {
        label = "Hệ thống treo C",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["suspension_d"] = {
        label = "Hệ thống treo D",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["brake_s"] = {
        label = "Thắng S",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["brake_a"] = {
        label = "Thắng A",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["brake_b"] = {
        label = "Thắng B",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["brake_c"] = {
        label = "Thắng C",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["brake_d"] = {
        label = "Thắng D",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["turbo_s"] = {
        label = "Turbo S",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["turbo_a"] = {
        label = "Turbo A",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["turbo_b"] = {
        label = "Turbo B",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["turbo_c"] = {
        label = "Turbo C",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["turbo_d"] = {
        label = "Turbo D",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["armour_s"] = {
        label = "Giáp S",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["armour_a"] = {
        label = "Giáp A",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["armour_b"] = {
        label = "Giáp B",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["armour_c"] = {
        label = "Giáp C",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["armour_d"] = {
        label = "Giáp D",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["armour_d"] = {
        label = "Giáp D",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
    },
    ["grapejuice"] = {
        label = "Nước ép nho",
        weight = 500,
        stack = true,
        close = true,
    },
    ["grape"] = {
        label = "Quả nho",
        weight = 100,
        stack = true,
        close = true,
    },
    ["wine"] = {
        label = "Rượu nho",
        weight = 200,
        stack = true,
        close = true,
    },
    ["scuba_tube_l1"] = {
        label = "Bình Lặn L1",
        weight = 1000,
        stack = true,
        close = true,
        description = "Một bình oxy và thiết bị tái tạo khí thở",
    },
    ["scuba_tube_l2"] = {
        label = "Bình Lặn L2",
        weight = 1000,
        stack = true,
        close = true,
        description = "Một bình oxy và thiết bị tái tạo khí thở",
        image = "diving-tube-level2.png",
        unique = true,
        useable = true,
    },
    ["scuba_tube_l3"] = {
        label = "Bình Lặn L3",
        weight = 1000,
        stack = true,
        close = true,
        description = "Một bình oxy và thiết bị tái tạo khí thở",
    },
    ["scuba_gear"] = {
        label = "Bộ Đồ Lặn",
        weight = 500,
        stack = true,
        close = true,
        description = "Một bình oxy và thiết bị tái tạo khí thở",
    },
    ["liftbag"] = {
        label = "Túi Nâng",
        weight = 1000,
        stack = true,
        close = true,
        description = "Một túi nâng giúp nâng các vật nặng",
    },
    ["dendrogyra_coral"] = {
        label = "San Hô Dendrogyra",
        weight = 500,
        stack = true,
        close = true,
        description = "Một loại san hô phổ biến, thường được tìm thấy dưới đáy biển.",
    },
    ["antipatharia_coral"] = {
        label = "San Hô Antipatharia",
        weight = 500,
        stack = true,
        close = true,
        description = "Một loại san hô quý hiếm, có giá trị cao.",
    },
    ["id_card"] = {
		label = "Thẻ Căn Cước",
		weight = 0,
		stack = false,
		close = false,
		description = "Một thẻ chứa tất cả thông tin của bạn để xác định danh tính của bạn",
		client = {
			image = "id_card.png",
		}
	},
    ["driver_license"] = {
		label = "Bằng Lái Xe",
		weight = 0,
		stack = false,
		close = false,
		description = "Giấy phép cho thấy bạn có thể lái xe",
		client = {
			image = "driver_license.png",
		}
	},
    ["diamond_ring"] = {
        label = "Nhẫn Kim Cương",
        weight = 300,
        stack = true,
        close = true,
        description = "Một chiếc nhẫn được gắn kim cương sáng lấp lánh, rất có giá trị.",
    },
    ["goldbar"] = {
        label = "Thỏi Vàng",
        weight = 700,
        stack = true,
        close = true,
        description = "Một thỏi vàng nguyên chất, có giá trị cao trên thị trường.",
    },
    ["grub"] = {
        label = "Ấu trùng",
        weight = 10,
        stack = true,
        close = true,
    
    },
    ["shovel"] = {
        label = "Xẻng",
        weight = 1000,
        stack = true,
        close = true,
    
    },
    ["dao_roc_vali"] = {
        label = "Dao Rọc Vali",
        weight = 100,
        stack = true,
        close = true,
        description = "Một loại dao riêng biệt, chỉ đề dùng để rạch vali",
    },
    ['firstaid'] = {
        label = 'Bộ Sơ Cứu',
        weight = 500,
    },
    ["xa_beng"] = {
		label = "Xà Beng",
		weight = 1000,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["nap_cong"] = {
		label = "Nắp Cống",
		weight = 300,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ['lighter'] = {
        label = 'Hột Quẹt',
        weight = 200,
        durability = 100,
    },
    ["xa_beng_tich_thu"] = {
		label = "Xà Beng [TỊCH THU]",
		weight = 2000,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["nap_cong_tich_thu"] = {
		label = "Nắp Cống [TỊCH THU]",
		weight = 300,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    ["thung_dau"] = {
		label = "Thùng Dầu",
		weight = 500,
		stack = true,
		close = true,
        type = 'Do_Ban',
	},
    
    ['advancedlockpick'] = {
        label = 'Phá khóa nâng cao',
        weight = 500,
    },
    ['xeng'] = {
        label = 'Xẻng',
        weight = 500,
    },
	['lockpick'] = {
        label = 'Phá khóa',
        weight = 150,
        stack = true,
		close = true,
		description = "",
		client = {
			image = "lockpick.png",
		}
    },
    ['heavyarmor'] = {
		label = "Giáp Xịn",
		weight = 1000,
		stack = true,
		close = true,
		description = "",
		client = {
			image = "armor.png",
		}
	},
    ['bodyarmor'] = {
		label = 'Giáp',
		weight = 100,
		stack = false,
	},
	
	['bracelet'] = {
		label = 'Vòng tay',
		weight = 100,
		stack = false,
	},
	
	['watch'] = {
		label = 'Đồng hồ',
		weight = 100,
		stack = false,
	},
	
	['bag'] = {
		label = 'Balo',
		weight = 100,
		stack = false,
	},
	
	['pants'] = {
		label = 'Quần',
		weight = 100,
		stack = false,
	},
	
	['shoes'] = {
		label = 'Giày',
		weight = 100,
		stack = false,
	},
	
	['gloves'] = {
		label = 'Găng tay',
		weight = 100,
		stack = false,
	},
    ['xeng_tich_thu'] = {
        label = 'Xẻng [TỊCH THU]',
        weight = 0,
        client = {
            image = 'xeng.png',
        },
    },
    ['evidence'] = {
        label = 'Bằng chứng',
        weight = 100, 
        stack = false,
        close = true,
        description = 'Dấu vân tay thu thập được tại hiện trường vụ án.',
        client = {
            image = 'evidence.png',
        },
        consume = 0,
        metadata = {
            assailant = 'Không xác định'
        }
    },
    
    ["silver_ring"] = {
        label = "Nhẫn bạc",
        weight = 300,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "silver_ring.png",
        }
    },
    ["10kgoldchain"] = {
        label = "Dây chuyền vàng 9999",
        weight = 500,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "silver_ring.png",
        }
    },
    
    ["goldchain"] = {
        label = "Dây chuyền vàng",
        weight = 300,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "goldchain.png",
        }
    },
    
    ["silver_ring_tich_thu"] = {
        label = "Nhẫn bạc [TỊCH THU]",
        weight = 0,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "silver_ring.png",
        }
    },
    
    ["goldchain_tich_thu"] = {
        label = "Dây chuyền vàng [TỊCH THU]",
        weight = 0,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "goldchain.png",
        }
    },
    ["bang_ve_vu_khi"] = {
        label = "Bản Vẽ Vũ Khí",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "bang_ve_vu_khi.png",
        }
    },
    ["bang_ve_vu_khi_tich_thu"] = {
        label = "Bản Vẽ Vũ Khí [TỊCH THU]",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "bang_ve_vu_khi.png",
        }
    },
    ['diving_gear'] = {
        label = 'Bộ Đồ Lặn',
        weight = 1000,
    },

    ['diving_fill'] = {
        label = 'Bình Oxy Lặn',
        weight = 500,
    },

    ['voi_con'] = {
        label = 'Voi Con',
        weight = 500,
    },
    ['trung_voi'] = {
        label = 'Trứng Voi',
        weight = 500,
    },
    ['do_an_cho_voi'] = {
        label = 'Đồ ăn cho Voi',
        weight = 500,
    },

    ['trai_ca_chua'] = {
        label = 'Trái Cà Chua',
        weight = 500,
    },
      ['fishingrod1'] = {
        label = 'Cần Câu (Lv.1)',
        weight = 1000,
        stack = true,
        close = false,
        description = '',
        client = { image = 'fishingrod1.png' }
   },
    ['fishingrod2'] = {
        label = 'Cần Câu (Lv.2)',
        weight = 1000,
        stack = true,
        close = false,
 --       description = 'Đôi khi thật tiện lợi khi nhớ lại điều gì đó:)',
        client = { image = 'fishingrod2.png' }
    },
    ['fishingrod3'] = {
        label = 'Cần Câu (Lv.3)',
        weight = 1000,
        stack = false,
        close = true,
  --      description = 'Một chiếc túi chứa tiền mặt',
        client = { image = 'fishingrod3.png' }
    },
    ['fishingrod4'] = {
        label = 'Cần Câu (Lv.4)',
        weight = 1000,
        stack = false,
        close = true,
--        description = 'Bầu trời là giới hạn! Woohoo!',
        client = { image = 'fishingrod4.png' }
    },
    ['fishingrod5'] = {
        label = 'Cần Câu (Lv.5)',
        weight = 1000,
        stack = true,
        close = true,
        client = { image = 'fishingrod5.png' }
    },
    ['emp_bucket'] = {
        label = 'Giỏ Hoa',
        weight = 1000,
        stack = true,
        close = true,
        client = { image = 'emp_bucket.png' }
    },
    ['flower'] = {
        label = 'Hoa Hồng',
        weight = 100,
        stack = true,
        close = true,
        client = { image = 'flower.png' }
    },
    ['flower_paper'] = {
        label = 'Hoa giấy',
        weight = 10,
        stack = true,
        close = true,
        client = { image = 'flower_paper.png' }
    },
    ['flower_bulck'] = {
        label = 'Bó Hoa Hồng',
        weight = 500,
        stack = true,
        close = true,
        client = { image = 'flower_bulck.png' }
    },
    ['flower_box'] = {
        label = 'Hộp Hoa Hồng',
        weight = 100,
        stack = true,
        close = true,
        client = { image = 'flower_box.png' }
    },
    ['flower_emp_box'] = {
        label = 'Hộp Hoa Rỗng',
        weight = 100,
        stack = true,
        close = true,
        client = { image = 'flower_emp_box.png' }
    },
    ['orange_box'] = {
        label = 'Hộp Cam',
        weight = 500,
        stack = true,
        close = true,
        client = { image = 'orange_box.png' }
    },
    ['orange'] = {
        label = 'Quả Cam',
        weight = 100,
        stack = true,
        close = true,
        client = { image = 'orange.png' }
    },
    ['pickaxe'] = {
       label = 'Cuốc đập đá',
       weight = 1000,
       stack = true,
       close = true,
       client = { image = 'pickaxe.png' }
    },
    ['axe'] = {
       label = 'Rìu chặt gõ',
       weight = 1000,
       stack = true,
       close = true,
       client = { image = 'pickaxe.png' }
    },
    ['stone'] = {
       label = 'Đá Thô',
       weight = 100,
       stack = true,
       close = true,
       client = { image = 'stone.png' }
    },
    ['drillbit'] = {
       label = 'Mũi khoan',
       weight = 50,
       stack = true,
       close = true,
       description = 'Mũi khoan dùng để cắt đá quý',
       client = { image = 'drillbit.png' }
    },
    ['emerald'] = {
       label = 'Lục bảo',
       weight = 500,
       stack = true,
       close = true,
       client = { image = 'emerald.png' }
    },
    ['uncut_diamond'] = {
       label = 'Kim cương thô',
       weight = 100,
       stack = true,
       close = true,
       client = { image = 'uncut_diamond.png' }
    },
    ['uncut_emerald'] = {
       label = 'Lục bảo thô',
       weight = 100,
       stack = true,
       close = true,
       client = { image = 'uncut_emerald.png' }
    },
    ['uncut_ruby'] = {
       label = 'Ruby thô',
       weight = 100,
       stack = true,
       close = true,
       client = { image = 'uncut_ruby.png' }
   },
    ['uncut_sapphire'] = {
       label = 'Ngọc bích thô',
       weight = 100,
       stack = true,
       close = true,
       client = { image = 'uncut_sapphire.png' }
    },
    ['silverore'] = {
       label = 'Quặng Sắt thô',
       weight = 100,
       stack = true,
       close = true,
       client = { image = 'silverore.png' }
    },
    ['silveringot'] = {
       label = 'Quặng Sắt',
       weight = 500,
       stack = true,
       close = true,
       client = { image = 'silveringot.png' }
    },
    ['silverearring'] = {
       label = 'Dây Chuyền',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'silverearring.png' }
    },
    ['silverchain'] = {
       label = 'Dây chuyền Bạc',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'silverchain.png' }
    },
    ['silver_ring'] = {
       label = 'Nhẫn Bạc',
       weight = 100,
       stack = true,
       close = true,
       client = { image = 'silver_ring.png' }
    },
    ['sapphire_ring'] = {
       label = 'Nhẫn Ngọc Bích',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'sapphire_ring.png' }
    },
    ['sapphire_ring_silver'] = {
       label = 'Nhẫn Ngọc Bích Bạc',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'sapphire_ring_silver.png' }
    },
    ['sapphire_necklace'] = {
       label = 'Dây Chuyền Ngọc Bích',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'sapphire_necklace.png' }
    },
    ['sapphire_necklace_silver'] = {
       label = 'Nhẫn Bạc Ngọc Bích',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'sapphire_necklace_silver.png' }
    },
    ['sapphire_earring'] = {
       label = 'Bông Tai Ngọc Bích',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'sapphire_earring.png' }
    },
    ['sapphire_earring_silver'] = {
       label = 'Bông Tai Ngọc Bích Bạc',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'sapphire_earring_silver.png' }
    },
    ['ruby_ring'] = {
       label = 'Nhẫn Ruby',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'ruby_ring.png' }
    },
    ['ruby_ring_silver'] = {
       label = 'Nhẫn Bạc Ruby',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'ruby_ring_silver.png' }
    },
    ['ruby_necklace'] = {
       label = 'Dây Chuyền Ruby Thô',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'ruby_necklace.png' }
    },
    ['diamond_earring_silver'] = {
       label = 'Bông Tai Kim Cương',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'diamond_earring_silver.png' }
    },
    ['copperore'] = {
       label = 'Đồng',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'copperore.png' }
    },
    ['diamond_earring'] = {
       label = 'Bông Tai Hơi Kim Cương',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'diamond_earring.png' }
    },
    ['carbon'] = {
       label = 'carbon',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'carbon.png' }
    },
    ['ruby_necklace_silver'] = {
       label = 'Dây Chuyền Ruby',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'ruby_necklace_silver.png' }
    },
    ['can'] = {
       label = 'Lon Nát',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'can.png' }
    },
    ['bottle'] = {
       label = 'Lọ Thủy Tinh',
       weight = 500,
       stack = true,
       close = true,
       client = { image = 'bottle.png' }
    },
    ['miningdrill'] = {
       label = 'Máy Khoan Đá Loại 1',
       weight = 2000,
       stack = true,
       close = true,
       client = { image = 'miningdrill.png' }
    },
    ['mininglaser'] = {
       label = 'Máy Khoan Đá',
       weight = 2000,
       stack = true,
       close = true,
       client = { image = 'mininglaser.png' }
    },
    ['ruby_earring_silver'] = {
       label = 'Bông Tai Ruby 2',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'ruby_earring_silver.png' }
    },
    ['ruby_earring'] = {
       label = 'Bông Tai Ruby 1',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'ruby_earring.png' }
    },
    ['diamond_necklace_silver'] = {
       label = 'Dây Chuyền Kim Cương 1',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'diamond_necklace_silver.png' }
    },
    ['diamond_necklace'] = {
       label = 'Dây Chuyền Kim Cương 2',
       weight = 500,
       stack = true,
       close = true,
       client = { image = 'diamond_necklace.png' }
    },
    ['diamond_ring_silver'] = {
       label = 'Nhẫn Kim Cương 1',
       weight = 500,
       stack = true,
       close = true,
       client = { image = 'diamond_ring_silver.png' }
    },
    ['emerald_earring_silver'] = {
       label = 'Bông Tai Lục Bảo',
       weight = 300,
       stack = true,
       close = true,
       client = { image = 'emerald_earring_silver.png' }
    },
    ['emerald_earring'] = {
       label = 'Bông Tai Lục Bảo',
       weight = 300,
       stack = true,
       close = true,
       client = { image = 'emerald_earring.png' }
    },
    ['emerald_necklace_silver'] = {
       label = 'Dây Chuyền Lục Bảo',
       weight = 300,
       stack = true,
       close = true,
       client = { image = 'emerald_necklace_silver.png' }
    },
    ['emerald_necklace'] = {
       label = 'Dây Chuyền Lục Bảo 2',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'emerald_necklace.png' }
    },
    ['emerald_ring_silver'] = {
       label = 'Nhẫn Lục Bảo',
       weight = 300,
       stack = true,
       close = true,
       client = { image = 'emerald_ring_silver.png' }
    },
    ['emerald_ring'] = {
       label = 'Nhẫn Lục Bảo 1',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'emerald_earring.png' }
    },
    ['ironore'] = {
       label = 'Sắt',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'ironore.png' }
    },
    ['goldpan'] = {
       label = 'Khay Đãi Vàng',
       weight = 1000,
       stack = true,
       close = true,
       client = { image = 'goldpan.png' }
    },
    ['goldore'] = {
       label = 'Quặng Vàng Thô',
       weight = 100,
       stack = true,
       close = true,
       client = { image = 'goldore.png' }
    },
    ['goldchain'] = {
       label = 'Dây Chuyền Vàng',
       weight = 300,
       stack = true,
       close = true,
       client = { image = 'goldchain.png' }
    },
    ['goldingot'] = {
       label = 'Thỏi Vàng',
       weight = 500,
       stack = true,
       close = true,
       client = { image = 'goldingot.png' }
    },
    ['gold_ring'] = {
       label = 'Nhẫn Vàng',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'gold_ring.png' }
    },
    ['gold_earring'] = {
       label = 'Lắc Tai Vàng',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'gold_earring.png' }
    },
    ['emerald_earring'] = {
       label = 'Lắc Tai Lục Bảo',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'emerald_earring.png' }
    },
    ['emerald_earring'] = {
       label = 'Lắc Tai Lục Bảo',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'emerald_earring.png' }
    },
    ['emerald_earring'] = {
       label = 'Lắc Tai Lục Bảo',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'emerald_earring.png' }
    },
    ['emerald_earring'] = {
       label = 'Lắc Tai Lục Bảo',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'emerald_earring.png' }
    },
    ['emerald'] = {
       label = 'Lục Bảo',
       weight = 500,
       stack = true,
       close = true,
       client = { image = 'emerald.png' }
    },
    ['goldearring'] = {
       label = 'Nhẫn Vàng',
       weight = 200,
       stack = true,
       close = true,
       client = { image = 'goldearring.png' }
    },
    ['corn_seed'] = {
        label = 'Hạt giống Ngô',
        weight = 100,
        stack = true,
        close = true,
        description = "Đây là hạt giống trồng ngô."
    },

    ['corn_raw'] = {
        label = 'Ngô tươi',
        weight = 500,
        stack = true,
        close = true,
        description = "Bạn sẽ cần chế biến cái này."
    },
    ['corn'] = {
        label = 'Ngô',
        weight = 500,
        stack = true,
        close = true,
    },
    ['tomato_seed'] = {
        label = 'Hạt giống Cà chua',
        weight = 100,
        stack = true,
        close = true,
        description = "Đây là hạt giống trồng cà chua."
},

['tomato_raw'] = {
    label = 'Cà chua tươi',
    weight = 500,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['tomato'] = {
    label = 'Cà chua',
    weight = 500,
    stack = true,
    close = true,
},

['wheat_seed'] = {
    label = 'Hạt giống Lúa mì',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống trồng Lúa mì."
},

['wheat_raw'] = {
    label = 'Lúa mì tươi',
    weight = 500,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['wheat'] = {
    label = 'Lúa mì',
    weight = 500,
    stack = true,
    close = true,
},

['broccoli_seed'] = {
    label = 'Hạt giống Súp lơ',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống giúp cây bông cải xanh phát triển."
},

['broccoli_raw'] = {
    label = 'Súp lơ tươi',
    weight = 500,
    stack = true,
    close = true,
    description = "Bạn sẽ cần phải xử lý việc này."
},

['broccoli'] = {
    label = 'Súp lơ',
    weight = 500,
    stack = true,
    close = true,
},

['carrot_seed'] = {
    label = 'Hạt giống Cà rốt',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống trồng cà rốt."
},

['carrot_raw'] = {
    label = 'Cà rốt tươi',
    weight = 500,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['carrot'] = {
    label = 'Cà rốt',
    weight = 500,
    stack = true,
    close = true,
},

['potato_seed'] = {
    label = 'Hạt giống Khoai tây',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống tạo nên củ khoai tây."
},
['manh_tinh_the'] = {
    label = 'Mảnh Tinh Thể',
    weight = 100,
    stack = true,
    close = true,
},
['da_thanh_sang'] = {
    label = 'Đá Thánh Sáng',
    weight = 100,
    stack = true,
    close = true,
},

['potato_raw'] = {
    label = 'Khoai tây tươi',
    weight = 500,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['potato'] = {
    label = 'Khoai tây',
    weight = 500,
    stack = true,
    close = true,
},

['pickle_seed'] = {
    label = 'Hạt giống Dưa chuột',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống trồng dưa chuột."
},

['pickle_raw'] = {
    label = 'Dưa chuột tươi',
    weight = 500,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['pickle'] = {
    label = 'Dưa chuột',
    weight = 500,
    stack = true,
    close = true,
},

['weed_seed'] = {
    label = 'Hạt giống Cần sa',
    weight = 1,
    stack = true,
    close = true,
    description = "Đây là hạt giống trồng cần sa."
},

['weed_raw'] = {
    label = 'Cần sa tươi',
    weight = 500,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['weed'] = {
    label = 'Cần sa',
    weight = 100,
    stack = true,
    close = true,
},

['cocaine_seed'] = {
    label = 'Hạt giống Cocaine',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống trồng cocaine."
},

['cocaine_raw'] = {
    label = 'Cocaine tươi',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['cocaine'] = {
    label = 'Cocaine',
    weight = 100,
    stack = true,
    close = true,
},

['heroin_seed'] = {
    label = 'Hạt giống Heroin',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống trồng heroin."
},

['heroin_raw'] = {
    label = 'Heroin tươi',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},
['heroin'] = {
    label = 'Heroin',
    weight = 100,
    stack = true,
    close = true,
},
['con_ga'] = {
    label = 'Con gà',
    weight = 100,
    stack = true,
    close = true,
},
['thit_gasong'] = {
    label = 'Thịt gà sống',
    weight = 100,
    stack = true,
    close = true,
},
['thit_ga'] = {
    label = 'Thịt gà',
    weight = 100,
    stack = true,
    close = true,
},
['garden_pitcher'] = {
    label = 'Bình tưới cây',
    weight = 500,
    stack = true,
    close = true,
},

['banhmatcha'] = {
    label = 'Bánh Trung Thu Matcha',
    weight = 100,
    stack = true,
    close = true,
    description = "Bánh trung thu Matcha",
},
['banhthapcam'] = {
    label = 'Bánh Trung Thu Thập cẩm',
    weight = 100,
    stack = true,
    close = true,
    description = "Bánh trung thu truyền thống nhân thập cẩm",
},
['banhdauxanh'] = {
    label = 'Bánh Trung Thu Đậu xanh',
    weight = 100,
    stack = true,
    close = true,
    description = "Bánh trung thu truyền thống nhân đậu xanh",
},
['banhtrungmuoi'] = {
    label = 'Bánh Trung Thu Trứng Muối',
    weight = 100,
    stack = true,
    close = true,
    description = "Bánh trung thu truyền thống nhân trứng muối",
},
['banhgaquay'] = {
    label = 'Bánh Trung Thu Gà Quay',
    weight = 100,
    stack = true,
    close = true,
    description = "Bánh trung thu truyền thống nhân gà quay",
},
['hopbanhtrungthu'] = {
    label = 'Hộp bánh Trung Thu',
    weight = 500,
    stack = true,
    close = true,
    description = "Hộp bánh Trung Thu",
},
['manh_dongxuanhtrang'] = {
    label = 'Mảnh Đồng xu Ánh Trăng',
    weight = 50,
    stack = true,
    close = true,
    description = "Mảnh đồng xu ánh trăng",
},
['dongxuanhtrang'] = {
    label = 'Đồng xu Ánh trăng',
    weight = 100,
    stack = true,
    close = true,
    description = "Đồng xu Ánh Trăng",
},
['super_rare_item'] = {
    label = 'Vật Phẩm Hiếm',
    weight = 100,
    stack = true,
    close = true,
    description = "Một vật phẩm hiếm có, cần thiết cho bạn mở hòm quà trung thu."
},
['baller'] = {
    label = 'Xe Baller',
    weight = 100,
    stack = true,
    close = true,
    description = "Liên Hệ Admin nếu nhận được vật phẩm này."
},
['hombian'] = {
    label = 'Hòm Bí Ẩn',
    weight = 100,
    stack = true,
    close = true,
    description = "Liên Hệ Admin nếu nhận được vật phẩm này."
},
['Bua_may_man'] = {
    label = 'Bùa May Mắn',
    weight = 500,
    stack = true,
    close = true,
    -- description = "Một vật phẩm hiếm có, cần thiết cho bạn mở hòm quà trung thu."
},
['bua_ma_thuat'] = {
    label = 'Bùa Ma Thuật',
    weight = 500,
    stack = true,
    close = true,
   
},
['chum_nho'] = {
    label = 'Chùm Nho',
    weight = 100,
    stack = true,
    close = true,
   
},
['thung_nho'] = {
    label = 'Thùng Nho',
    weight = 500,
    stack = true,
    close = true,
   
},
['keo_catnho'] = {
    label = 'Kéo Cắt Nho',
    weight = 500,
    stack = true,
    close = true,
   
},
['go'] = {
    label = 'Gỗ Thô',
    weight = 100,
    stack = true,
    close = true,
   
},
['gocat'] = {
    label = ' Ván Gỗ',
    weight = 500,
    stack = true,
    close = true,
   
},
    ['riu_chat_go'] = {
    label = 'Rìu Chặt Gỗ',
    weight = 2000,
    stack = true,
    close = true,
},
['boombox'] = {
    label = 'Loa nghe nhạc',
    weight = 2000,
    stack = false,
    close = true,
},
['vocay'] = {
    label = 'Vỏ cây',
    weight = 100,
    stack = true,
    close = true,
   
    },
    ["aluminium"] = {
        label = "Nhôm",
        weight = 100,
        stack = true,
        close = true,
    },
    ["banhxe"] = {
        label = "Bánh Xe",
        weight = 500,
        stack = true,
        close = true,
    },
    ["ca_duoi"] = {
        label = "Cá Đuối",
        weight = 500,
        stack = true,
        close = true,
    },
    ["ca_he"] = {
        label = "Cá Hề",
        weight = 500,
        stack = true,
        close = true,
    },
    ["ca_heo"] = {
        label = "Cá Heo",
        weight = 500,
        stack = true,
        close = true,
    },
    ["ca_hoangde"] = {
        label = "Cá Hoàng Đế",
        weight = 500,
        stack = true,
        close = true,
    },
    ["cam"] = {
        label = "Camera",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["camera"] = {
        label = "Camera",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["can"] = {
        label = "Cái lon",
        weight = 10,
        stack = true,
        close = true,
    },
    ["camap_daubua"] = {
        label = "Cá Mập Đầu Búa",
        weight = 500,
        stack = true,
        close = true,
    },
    ["car_keys"] = {
        label = "Chìa Khóa Xe",
        weight = 100,
        stack = true,
        close = true,
    },
    ["caraudiosystem"] = {
        label = "Hệ Thống Âm Thanh Xe",
        weight = 100,
        stack = true,
        close = true,
    },
    ["card_bank"] = {
        label = "Thẻ Ngân Hàng Panda Bank",
        weight = 100,
        stack = true,
        close = true,
    },
    ["cardiaque"] = {
        label = "Thuốc lá",
        weight = 10,
        stack = true,
        close = true,
    },
    ["cardok"] = {
        label = "Thẻ Đỗ Xe",
        weight = 10,
        stack = true,
        close = true,
    },
    ["carkey"] = {
        label = "Chìa Khóa Xe",
        weight = 10,
        stack = true,
        close = true,
    },
    ["casino_blackchip"] = {
        label = "Chip Đen Casino",
        weight = 10,
        stack = true,
        close = true,
    },
    ["carp"] = {
        label = "Cá Chép",
        weight = 10,
        stack = true,
        close = true,
    },
    ["ca_map"] = {
        label = "Cá Mập",
        weight = 500,
        stack = true,
        close = true,
    },
    ["coffee_express"] = {
        label = "Cà Phê Espresso",
        weight = 100,
        stack = true,
        close = true,
    },
    ["coffee_beans"] = {
        label = "Hạt Cà Phê",
        weight = 100,
        stack = true,
        close = true,
    },
    ["copper_bar"] = {
        label = "Thỏi Đồng",
        weight = 500,
        stack = true,
        close = true,
    },
    ["copper_ingot"] = {
        label = "Thỏi Đồng 1",
        weight = 500,
        stack = true,
        close = true,
    },
    ["thucan"] = {
        label = "Thức Ăn",
        weight = 100,
        stack = true,
        close = true,
    },
    ["corgi_nho"] = {
        label = "Chó Corgi Nhỏ",
        weight = 100,
        stack = true,
        close = true,
    },
    ["corgi_truongthanh"] = {
        label = "Chó Corgi Trưởng Thành",
        weight = 500,
        stack = true,
        close = true,
    },
    ["cosmetics"] = {
        label = "Mỹ Phẩm",
        weight = 100,
        stack = true,
        close = true,
    },
    ["crappie"] = {
        label = "Cá rô",
        weight = 100,
        stack = true,
        close = true,
    },
    ["crystal"] = {
        label = "Pha Lê",
        weight = 100,
        stack = true,
        close = true,
    },
    ["crappie"] = {
        label = "Cá rô",
        weight = 100,
        stack = true,
        close = true,
    },
    ["cuon_len"] = {
        label = "Cuộn Len",
        weight = 100,
        stack = true,
        close = true,
    },
     ["cherry"] = {
        label = "Quả Cherry",
        weight = 100,
        stack = true,
        close = true,
    },
     ["cherryicecream"] = {
        label = "Kem Cherry",
        weight = 100,
        stack = true,
        close = true,
    },
     ["cherryjuice"] = {
        label = "Nước Ép Cherry",
        weight = 100,
        stack = true,
        close = true,
    },
     ["chiakhoa"] = {
        label = "Chìa khóa",
        weight = 10,
        stack = true,
        close = true,
    },
    ["chiakhoa_caocap"] = {
        label = "Chìa khóa Cao Cấp",
        weight = 10,
        stack = true,
        close = true,
    },
    ["chiakhoa_coban"] = {
        label = "Chìa khóa Cơ Bản",
        weight = 10,
        stack = true,
        close = true,
    },
    ["chicken-bucket"] = {
        label = "Gà Rán KFC",
        weight = 100,
        stack = true,
        close = true,
    },
    ["chickenburger"] = {
        label = "Gà Rán",
        weight = 100,
        stack = true,
        close = true,
    },
    ["chillypepper"] = {
        label = "Ớt Chilli",
        weight = 100,
        stack = true,
        close = true,
    },
    ["chips"] = {
        label = "Oisi",
        weight = 100,
        stack = true,
        close = true,
    },
    ["chipscheese"] = {
        label = "Phô Mai Oisi",
        weight = 100,
        stack = true,
        close = true,
    },
    ["evidence"] = {
        label = "Dấu Vân Tay",
        weight = 100,
        stack = true,
        close = true,
    },
    ["hop_hang"] = {
        label = "Hộp Hàng",
        weight = 100,
        stack = true,
        close = true,
    },
    ["gothongtuyettung"] = {
        label = "Gỗ Thông Tuyết Tùng",
        weight = 100,
        stack = true,
        close = true,
    },
    ["gotuyettung"] = {
        label = "Gỗ Tuyết Tùng",
        weight = 100,
        stack = true,
        close = true,
    },
    ["hopdong_banxe"] = {
        label = "Hợp Đồng Bán Xe",
        weight = 100,
        stack = true,
        close = true,
    },
    ["hopdong_thuexe"] = {
        label = "Hợp Đồng Thuê Xe",
        weight = 100,
        stack = true,
        close = true,
    },
    ["hopkim_thep"] = {
        label = "Hợp Kim Thép",
        weight = 100,
        stack = true,
        close = true,
    },
    ["hopqua_giangsinh"] = {
        label = "Hộp Quà Giáng Sinh",
        weight = 100,
        stack = true,
        close = true,
    },
    ["ironoxide"] = {
        label = "Oxit Sắt",
        weight = 100,
        stack = true,
        close = true,
    },
    ["joint"] = {
        label = "Điếu thuốc lạ",
        weight = 100,
        stack = true,
        close = true,
    },
    ["keo_catcay"] = {
        label = "Kéo Cắt Cây",
        weight = 100,
        stack = true,
        close = true,
    },
    ["khuc_go"] = {
        label = "Khúc Gỗ",
        weight = 100,
        stack = true,
        close = true,
    },
    ["laptop"] = {
        label = "Laptop",
        weight = 100,
        stack = true,
        close = true,
    },
    ["luc_bao_linh"] = {
        label = "Lục Bảo Linh",
        weight = 100,
        stack = true,
        close = true,
    },
    ["mackerel"] = {
        label = "Cá Thu",
        weight = 100,
        stack = true,
        close = true,
    },
    ["manh_ban_do_1"] = {
        label = "Mảnh Bản Đồ 1",
        weight = 100,
        stack = true,
        close = true,
    },
    ["manh_ban_do_2"] = {
        label = "Mảnh Bản Đồ 2",
        weight = 100,
        stack = true,
        close = true,
    },
    ["manh_ban_do_3"] = {
        label = "Mảnh Bản Đồ 3",
        weight = 100,
        stack = true,
        close = true,
    },
    ["manh_ban_do_4"] = {
        label = "Mảnh Bản Đồ 4",
        weight = 100,
        stack = true,
        close = true,
    },
    ["manh_ban_do_5"] = {
        label = "Mảnh Bản Đồ 5",
        weight = 100,
        stack = true,
        close = true,
    },
    ["manh_ban_do_6"] = {
        label = "Mảnh Bản Đồ 6",
        weight = 100,
        stack = true,
        close = true,
    },
    ["marlin"] = {
        label = "Cá Marlin",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["may_do_kho_bau"] = {
        label = "Máy Dò Kho Báu",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["may_nghe_nhac_1"] = {
        label = "Máy Nghe Nhạc 1",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["may_nghe_nhac_2"] = {
        label = "Máy Nghe Nhạc 2",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["mechanic_toolbox"] = {
        label = "Hộp Dụng Cụ Cơ Khí",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["medikit"] = {
        label = "Medikit",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["meth"] = {
        label = "Gói Đá",
        weight = 100,
        stack = true,
        close = true,
    },
    ["nefrit"] = {
        label = "Gói Đá",
        weight = 100,
        stack = true,
        close = true,
    },
    ["panties"] = {
        label = "Quần Lót",
        weight = 100,
        stack = true,
        close = true,
    },
    ["papieros"] = {
        label = "Gói Thuốc Lá",
        weight = 100,
        stack = true,
        close = true,
    },
    ["parasol"] = {
        label = "Ô Dù",
        weight = 100,
        stack = true,
        close = true,
    },
    ["petrolcan"] = {
        label = "Can Xăng",
        weight = 100,
        stack = true,
        close = true,
    },
    ["pierscionek"] = {
        label = "Nhẫn",
        weight = 100,
        stack = true,
        close = true,
    },
    ["pietruszka"] = {
        label = "Cần Sa",
        weight = 100,
        stack = true,
        close = true,
    },
    ["pig_con"] = {
        label = "Heo Con",
        weight = 100,
        stack = true,
        close = true,
    },
    ["pig_leather"] = {
        label = "Da Heo",
        weight = 100,
        stack = true,
        close = true,
    },
    ["pig_truongthanh"] = {
        label = "Heo Bự",
        weight = 500,
        stack = true,
        close = true,
    },
    ["plastic_bag"] = {
        label = "Gói Nhựa",
        weight = 500,
        stack = true,
        close = true,
    },
    ["pha_le_bi_an"] = {
        label = "Pha lê bí ẩn",
        weight = 100,
        stack = true,
        close = true,
    },
    ["phe_lieu"] = {
        label = "Phế liệu",
        weight = 100,
        stack = true,
        close = true,
    },
    ["pha_le_bi_an"] = {
        label = "Pha lê bí ẩn",
        weight = 100,
        stack = true,
        close = true,
    },
    ["phuoc1"] = {
        label = "Phuộc 1",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["phuoc2"] = {
        label = "Phuộc 2",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["phuoc3"] = {
        label = "Phuộc 3",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["phuoc4"] = {
        label = "Phuộc 4",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["quartz"] = {
        label = "Thạch Anh",
        weight = 500,
        stack = true,
        close = true,
    },
    ["quocky_vietnam"] = {
        label = "Quốc Kỳ Việt Nam",
        weight = 0,
        stack = true,
        close = true,
    },
    ["rauxanh_saykho"] = {
        label = "Rau Xanh Sấy Khô",
        weight = 500,
        stack = true,
        close = true,
    },
    ["rock"] = {
        label = "Đá Đen",
        weight = 500,
        stack = true,
        close = true,
    },
    ["rolling_paper"] = {
        label = "Giấy Cuộn",
        weight = 500,
        stack = true,
        close = true,
    },
    ["rauxanh_saykho"] = {
        label = "Rau Xanh Sấy Khô",
        weight = 500,
        stack = true,
        close = true,
    },
    ["shield"] = {
        label = "Khiên",
        weight = 3000,
        stack = true,
        close = true,
    },
    ["salmon"] = {
        label = "Cá Hồi",
        weight = 500,
        stack = true,
        close = true,
    },
    ["security_card_02"] = {
        label = "Thẻ An Ninh",
        weight = 10,
        stack = true,
        close = true,
    },
    ["street_tires"] = {
        label = "Lốp Xe Đường Phố",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["swordfish"] = {
        label = "Cá Kiếm",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["tainghe_congnghecao"] = {
        label = "Tai Nghe Công Nghệ Cao",
        weight = 500,
        stack = true,
        close = true,
    },
    ["talapia"] = {
        label = "Cá Tầm",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["tay_cam"] = {
        label = "Tay cầm",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["tien_xuban"] = {
        label = "Tiền xu bẩn",
        weight = 100,
        stack = true,
        close = true,
    },
    ["tienxu_ban"] = {
        label = "Tiền xu bẩn",
        weight = 100,
        stack = true,
        close = true,
    },
    ["tinhdau_pod"] = {
        label = "Tinh Dầu Pod",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["tom"] = {
        label = "Tôm",
        weight = 500,
        stack = true,
        close = true,
    },
    ["tong_do"] = {
        label = "Tông Đơ",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["toolkit"] = {
        label = "Bộ Dụng Cụ",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["ttccard"] = {
        label = "Thẻ Tòa Thị Chính",
        weight = 10,
        stack = true,
        close = true,
    },
    ["tua_vit"] = {
        label = "Tua Vít",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["translv1"] = {
        label = "Động Cơ LV1",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["translv2"] = {
        label = "Động Cơ LV1",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["translv3"] = {
        label = "Động Cơ LV3",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["tua_vit"] = {
        label = "Tua Vít",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["tua_vit"] = {
        label = "Tua Vít",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["wrench"] = {
        label = "Cờ lê",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["weedscissors"] = {
        label = "Kéo Cắt Tóc",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["weed_baggy"] = {
        label = "Túi Cỏ",
        weight = 100,
        stack = true,
        close = true,
    },
    ["weed_baggy_empty"] = {
        label = "Túi Cỏ Rỗng",
        weight = 100,
        stack = true,
        close = true,
    },
    ["weed_brick"] = {
        label = "Viên Cỏ",
        weight = 100,
        stack = true,
        close = true,
    },
    ["coke_brick"] = {
        label = "Viên Coke",
        weight = 100,
        stack = true,
        close = true,
    },
    ["weed_kush"] = {
        label = "Gói thuốc lạ",
        weight = 100,
        stack = true,
        close = true,
    },
    ["weed_seed"] = {
        label = "Hạt Cỏ",
        weight = 10,
        stack = true,
        close = true,
    },
    ["weed4g"] = {
        label = "Sà Cân",
        weight = 10,
        stack = true,
        close = true,
    },
    ["sponge"] = {
        label = "Bọt biển",
        weight = 100,
        stack = true,
        close = true,
    },
    ["abtlers"] = {
        label = "Sừng hươu",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["boameat"] = {
        label = "Thịt hươu",
        weight = 100,
        stack = true,
        close = true,
    },
    ["carcass"] = {
        label = "Xác Hươu 1*",
        weight = 100,
        stack = true,
        close = true,
    },
    ["carcass2"] = {
        label = "Xác Hươu 2*",
        weight = 100,
        stack = true,
        close = true,
    },
    ["carcass3"] = {
        label = "Xác Hươu 3*",
        weight = 100,
        stack = true,
        close = true,
    },
    ["coyotepelt"] = {
        label = "Da cùi",
        weight = 100,
        stack = true,
        close = true,
    },
    ["deerhide"] = {
        label = "Da xịn",
        weight = 100,
        stack = true,
        close = true,
    },
    ["hunting_ammo"] = {
        label = "Đạn Săn",
        weight = 10,
        stack = true,
        close = true,
    },
    ["hunting_bait"] = {
        label = "Mồi Săn",
        weight = 100,
        stack = true,
        close = true,
    },
    ["huntingrifle"] = {
        label = "Súng Săn",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["mtlionfang"] = {
        label = "Sừng Sư Tử",
        weight = 100,
        stack = true,
        close = true,
    },
    ["mtlionpelt"] = {
        label = "Da Sư Tử",
        weight = 100,
        stack = true,
        close = true,
    },
    ["redcarcass"] = {
        label = "Thịt Sư Tử 1*",
        weight = 100,
        stack = true,
        close = true,
    },
    ["redcarcass2"] = {
        label = "Thịt Sư Tử 2*",
        weight = 100,
        stack = true,
        close = true,
    },
    ["redcarcass3"] = {
        label = "Thịt Sư Tử 3*",
        weight = 100,
        stack = true,
        close = true,
    },
    ["thuoclao"] = {
        label = "Thuốc lào",
        weight = 1000,
        stack = true,
        close = true,
    },
    ["nuoccam"] = {
        label = "Nước Cam",
        weight = 200,
        stack = true,
        close = true,
    },
    ["wood"] = {
        label = "Gỗ",
        weight = 100,
        stack = true,
        close = true,
    },
    ["cocthuytinh"] = {
        label = "Cốc Thủy Tinh",
        weight = 100,
        stack = true,
        close = true,
    },
    ["bark"] = {
        label = "Vỏ Cây",
        weight = 100,
        stack = true,
        close = true,
    },
    ["trada"] = {
        label = "Trà Đá",
        weight = 200,
        stack = true,
        close = true,
    },
    ["drycanabis"] = {
        label = "Cần Sa Khô",
        weight = 100,
        stack = true,
        close = true,
    },
    ["latra"] = {
        label = "Lá Trà",
        weight = 100,
        stack = true,
        close = true,
    },
    ["box_car_chino"] = {
        label = "Box Car Chino",
        weight = 100,
        stack = true,
        close = true,
    },
    ['goldbull'] = {
	    label = 'tiền vàng',
	    weight = 100,
	    stack = true,
	    close = false,
	    description = 'Một số đồng tiền vàng',
    },
    ['large_drill'] = {
	    label = 'Máy khoan',
	    weight = 2050,
	    stack = false,
	    close = false,
	    description = 'Máy khoan công nghiệp cỡ lớn',
    },
    ['cutter'] = {
	    label = 'Máy cắt plasma',
	    weight = 2050,
	    stack = false,
	    close = false,
	    description = 'Dụng cụ cắt để cắt kính dày an toàn',
    },
    ['c4_stick'] = {
	    label = 'C4',
	    weight = 2050,
	    stack = false,
	    close = false,
	    description = 'Một thanh C4 nhỏ để tạo ra một vụ nổ nhỏ',
    },
    ['thermaldrill'] = {
	    label = 'Máy khoan nhiệt',
	    weight = 2050,
	    stack = false,
	    close = false,
	    description = 'Một máy khoan nhiệt công nghiệp lớn',
    },
    ['necklace'] = {
		label = 'Vòng cổ',
		description = "Vòng cổ làm bằng vàng nguyên chất",
		weight = 1000,
		stack = true,
		close = true
	},
    ['ring'] = {
		label = 'Nhẫn',
		description = "Chiếc nhẫn được làm từ kim cương",
		weight = 1000,
		stack = true,
		close = true
	},
    ['gold_bar'] = {    
		label = 'Bar of gold',
		description = "Thanh làm bằng vàng",
		weight = 1000,
		stack = true,
		close = true
	},
    ["yellow_diamond"] = {
		label = "Viên kim cương màu vàng",
		weight = 1000,
		stack = true,
		close = true,
		description = "Kim cương vàng rất đắt!",
	},
    ['painting_low'] = {
		label = 'Tranh giá rẻ',
		weight = 50,
		stack = false,
		close = false,
		description = 'Tranh không quá đắt, nhưng tiền vẫn là tiền.',
	},
    ['painting_medium'] = {
		label = 'Bức Tranh',
		weight = 50,
		stack = false,
		close = false,
		description = 'Tranh có giá trị trung bình',
	},
    ['painting_high'] = {
		label = 'Bức tranh đắt giá',
		weight = 50,
		stack = false,
		close = false,
		description = 'Bức tranh rất đắt tiền',
	},
    ['hack_usb'] = {
		label = 'Hack USB',
		weight = 50,
		stack = false,
		close = false,
		description = 'Thiết bị USB chứa nhiều phần mềm hack khác nhau',
	},
    ['ft_pumpkin'] = {
		label = 'Bí ngô',
		description = 'Bí ngô.',
		weight = 500,
		stack = true
	},
    ['pumpkin_seed'] = {
		label = 'Hạt giống bí ngô',
		description = 'Hạt giống để trồng bí ngô.',
		weight = 50,
		stack = true
	},
    ['water_bottle'] = {
        label = 'Bình nước',
        description = 'Bình nước dùng để tưới cây.',
        weight = 200,
		close = false,
        stack = true
    },
    ['apple_watch'] = {
        label = 'Đồng hồ thông minh',
        description = 'Đồng hồ thông minh của Apple.',
        weight = 200,
        stack = true,
		close = false,
    },
    ['apple_watch'] = {
        label = 'Đồng hồ thông minh',
        description = 'Đồng hồ thông minh của Apple.',
        weight = 200,
        stack = true,
		close = false,
    },
    ['wateringcan'] = {
        label = 'Bình tưới cây',
        description = 'Dùng để tưới cây trồng.',
        weight = 100,
        stack = true,
		close = false,
    },
    ['watermelonseeds'] = {
        label = 'Hạt giống dưa hấu',
        description = 'Hạt giống dùng để trồng dưa hấu.',
        weight = 100,
        stack = true,
        close = false,
    },
    ['watermelon'] = {
        label = 'Dưa hấu',
        description = 'Dưa hấu tươi ngon.',
        weight = 100,
        stack = true,
        close = false,
    },
    ['watermelonjuice'] = {
        label = 'Nước dưa hấu',
        description = 'Nước ép từ dưa hấu tươi ngon.',
        weight = 200,
        stack = true,
        close = false,
    },
    ['pumpkin_seeds'] = {
        label = 'Hạt giống bí ngô',
        description = 'Hạt giống dùng để trồng bí ngô.',
        weight = 100,
        stack = true,
        close = false,
    },
    ['cervenehrozno'] = {
	    label = 'Nho đỏ',
	    weight = 25,
	    stack = true,
	    close = true,
	    description = 'Nguyên liệu cơ bản để sản xuất rượu vang đỏ.'
        },
    ['bielehrozno'] = {
	    label = 'Nho trắng',
	    weight = 25,
	    stack = true,
	    close = true,
	    description = 'Nguyên liệu cơ bản để sản xuất rượu vang trắng.'
    },
    ['ruzovehrozno'] = {
	    label = 'Nho hồng',
	    weight = 25,
	    stack = true,
	    close = true,
	    description = 'Nguyên liệu cơ bản để sản xuất rượu vang hồng.'
        },
['cervenestlacene'] = {
	label = 'Nho đỏ ép',
	weight = 25,
	stack = true,
	close = true,
	description = 'Nho đỏ đã được ép, sẵn sàng cho quá trình ủ rượu.'
},
['bielestlacene'] = {
	label = 'Nho trắng ép',
	weight = 25,
	stack = true,
	close = true,
	description = 'Nho trắng đã được ép, sẵn sàng cho quá trình ủ rượu.'
},
['ruzovestlacene'] = {
	label = 'Nho hồng ép',
	weight = 25,
	stack = true,
	close = true,
	description = 'Nho hồng đã được ép, sẵn sàng cho quá trình ủ rượu.'
},
['cervenaflasa'] = {
	label = 'Rượu vang đỏ',
	weight = 250,
	stack = true,
	close = true,
	description = 'Một chai rượu vang đỏ hảo hạng được làm từ nho đỏ.'
},
['bielaflasa'] = {
	label = 'Rượu vang trắng',
	weight = 250,
	stack = true,
	close = true,
	description = 'Một chai rượu vang trắng tinh khiết được làm từ nho trắng.'
},
['ruzovaflasa'] = {
	label = 'Rượu vang hồng',
	weight = 250,
	stack = true,
	close = true,
	description = 'Một chai rượu vang hồng thơm dịu được làm từ nho hồng.'
},
['corn_seed'] = {
    label = 'Hạt Giống Ngô',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng ngô."
},

['corn_raw'] = {
    label = 'Ngô Thô',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['corn'] = {
    label = 'Ngô',
    weight = 500,
    stack = true,
    close = true,
},

['tomato_seed'] = {
    label = 'Hạt Giống Cà Chua',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng cà chua."
},

['tomato_raw'] = {
    label = 'Cà Chua Thô',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['tomato'] = {
    label = 'Cà Chua',
    weight = 500,
    stack = true,
    close = true,
},

['wheat_seed'] = {
    label = 'Hạt Giống Lúa Mì',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng lúa mì."
},

['wheat_raw'] = {
    label = 'Lúa Mì Thô',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['wheat'] = {
    label = 'Lúa Mì',
    weight = 500,
    stack = true,
    close = true,
},

['broccoli_seed'] = {
    label = 'Hạt Giống Bông Cải Xanh',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng bông cải xanh."
},

['broccoli_raw'] = {
    label = 'Bông Cải Xanh Thô',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['broccoli'] = {
    label = 'Bông Cải Xanh',
    weight = 500,
    stack = true,
    close = true,
},

['carrot_seed'] = {
    label = 'Hạt Giống Cà Rốt',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng cà rốt."
},

['carrot_raw'] = {
    label = 'Cà Rốt Thô',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['carrot'] = {
    label = 'Cà Rốt',
    weight = 500,
    stack = true,
    close = true,
},

['potato_seed'] = {
    label = 'Hạt Giống Khoai Tây',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng khoai tây."
},

['potato_raw'] = {
    label = 'Khoai Tây Thô',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['potato'] = {
    label = 'Khoai Tây',
    weight = 500,
    stack = true,
    close = true,
},

['pickle_seed'] = {
    label = 'Hạt Giống Dưa Chuột',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng dưa chuột."
},

['pickle_raw'] = {
    label = 'Dưa Chuột Thô',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['pickle'] = {
    label = 'Dưa Chuột',
    weight = 500,
    stack = true,
    close = true,
},

['weed_seed'] = {
    label = 'Hạt Giống Cần Sa',
    weight = 50,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng cần sa."
},

['weed_raw'] = {
    label = 'Cần Sa Thô',
    weight = 100,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['weed'] = {
    label = 'Cần Sa',
    weight = 500,
    stack = true,
    close = true,
},

['cocaine_seed'] = {
    label = 'Hạt Giống Coca',
    weight = 100,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng coca."
},

['cocaine_raw'] = {
    label = 'Coca Thô',
    weight = 200,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['cocaine'] = {
    label = 'Cocaine',
    weight = 500,
    stack = true,
    close = true,
},

['heroin_seed'] = {
    label = 'Hạt Giống Thuốc Phiện',
    weight = 50,
    stack = true,
    close = true,
    description = "Đây là hạt giống dùng để trồng cây thuốc phiện."
},

['heroin_raw'] = {
    label = 'Thuốc Phiện Thô',
    weight = 100,
    stack = true,
    close = true,
    description = "Bạn sẽ cần chế biến cái này."
},

['heroin'] = {
    label = 'Heroin',
    weight = 100,
    stack = true,
    close = true,
},

['garden_pitcher'] = {
    label = 'Bình Tưới Nước',
    weight = 200,
    stack = true,
    close = true,
},

['garden_shovel'] = {
    label = 'Xẻng Làm Vườn',
    weight = 1000,
    stack = true,
    close = true,
},
-- ITEMS NOEL - Thêm vào file items.lua
['christmas_gift'] = {
	label = 'Hộp Quà Noel',
	weight = 500,
	stack = true,
	close = true,
	description = 'Một hộp quà bí mật, bên trong chứa đầy bất ngờ!',
	client = {
		image = 'christmas_gift.png'
	}
},

['toy_material'] = {
	label = 'Nguyên Liệu Làm Đồ Chơi',
	weight = 300,
	stack = true,
	close = true,
	description = 'Gỗ, vải và bông để sản xuất đồ chơi Noel',
	client = {
		image = 'toy_material.png'
	}
},

['christmas_ornament'] = {
	label = 'Quả Châu Noel',
	weight = 200,
	stack = true,
	close = true,
	description = 'Quả châu lấp lánh để trang trí cây thông',
	client = {
		image = 'christmas_ornament.png'
	}
},

['christmas_light'] = {
	label = 'Dây Đèn Noel',
	weight = 800,
	stack = true,
	close = true,
	description = 'Dây đèn nháy nhiều màu để trang trí',
	client = {
		image = 'christmas_light.png'
	}
},

['santa_hat'] = {
	label = 'Nón Ông Noel',
	weight = 400,
	stack = false,
	close = true,
	description = 'Chiếc nón đỏ đặc trưng của ông già Noel',
	client = {
		image = 'santa_hat.png'
	}
},

['christmas_cookie'] = {
	label = 'Bánh Quy Noel',
	weight = 100,
	stack = true,
	close = true,
	description = 'Bánh quy hình người tuyết, rất ngon!',
	client = {
		image = 'christmas_cookie.png'
	}
},

['hot_chocolate'] = {
	label = 'Sôcôla Nóng',
	weight = 350,
	stack = true,
	close = true,
	description = 'Ly sôcôla nóng thơm ngon cho mùa đông',
	client = {
		image = 'hot_chocolate.png'
	}
},

['snowball'] = {
	label = 'Quả Tuyết',
	weight = 150,
	stack = true,
	close = true,
	description = 'Quả tuyết để ném bạn bè cho vui',
	client = {
		image = 'snowball.png'
	}
},

    ['christmas_star'] = {
	    label = 'Ngôi Sao Noel',
	    weight = 600,
	    stack = true,
	    close = true,
	    description = 'Ngôi sao để đặt trên đỉnh cây thông',
	    client = {
		    image = 'christmas_star.png'
	}
},

    ['christmas_tree'] = {
	    label = 'Cây Thông Noel',
	    weight = 5000,
	    stack = false,
	    close = true,
	    description = 'Cây thông Noel để trang trí',
	client = {
		image = 'christmas_tree.png'
	}
},

    ['letter_to_santa'] = {
	    label = 'Thư Gửi Ông Noel',
	    weight = 50,
	    stack = true,
	    close = true,
	    description = 'Lá thư viết điều ước gửi đến ông già Noel',
	client = {
		image = 'letter_to_santa.png'
	}
},
    ['gold_bell'] = {
	    label = 'Chuông Vàng',
	    weight = 300,
	    stack = true,
	    close = true,
	    description = 'Chiếc chuông vàng lấp lánh',
	client = {
		image = 'gold_bell.png'
	}
},
    ['candy_cane'] = {
	    label = 'Kẹo Gậy',
	    weight = 100,
	    stack = true,
	    close = true,
	    description = 'Kẹo gậy truyền thống ngày Noel',
	client = {
		image = 'candy_cane.png'
	}
},
    ['gingerbread'] = {
	    label = 'Bánh Gừng',
	    weight = 200,
	    stack = true,
	    close = true,
	    description = 'Bánh gừng hình người rất ngon',
	client = {
		image = 'gingerbread.png'
	}
},
['christmas_wreath'] = {
	label = 'Vòng Hoa Noel',
	weight = 1200,
	stack = false,
	close = true,
	description = 'Vòng hoa trang trí cửa nhà',
	client = {
		image = 'christmas_wreath.png'
	}
},
['snowman_kit'] = {
	label = 'Bộ Làm Người Tuyết',
	weight = 2000,
	stack = false,
	close = true,
	description = 'Bộ dụng cụ để xây người tuyết',
	client = {
		image = 'snowman_kit.png'
	}
},
['reindeer_toy'] = {
	label = 'Đồ Chơi Tuần Lộc',
	weight = 400,
	stack = true,
	close = true,
	description = 'Đồ chơi tuần lộc xinh xắn',
	client = {
		image = 'reindeer_toy.png'
	}
},
['christmas_sock'] = {
	label = 'Tất Noel',
	weight = 250,
	stack = true,
	close = true,
	description = 'Chiếc tất treo để nhận quà',
	client = {
		image = 'christmas_sock.png'
	}
},
['festive_hat'] = {
	label = 'Nón Lễ Hội',
	weight = 350,
	stack = false,
	close = true,
	description = 'Nón màu đỏ xanh cho mùa lễ hội',
	client = {
		image = 'festive_hat.png'
	}
},
['christmas_present'] = {
	label = 'Quà Tặng Đặc Biệt',
	weight = 1000,
	stack = false,
	close = true,
	description = 'Món quà đặc biệt chứa nhiều vật phẩm giá trị',
	client = {
		image = 'christmas_present.png'
	}
},
-- qbitems.lua
-- This file defines the items for the 0r-farming script in QBcore format.
    ["wateringcan"] = {
        name = "wateringcan",
        label = "Watering Can",
        weight = 100,
        type = "item",
        image = "wateringcan.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["raker"] = {
        name = "raker",
        label = "Raker",
        weight = 100,
        type = "item",
        image = "raker.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["shovel"] = {
        name = "shovel",
        label = "Shovel",
        weight = 100,
        type = "item",
        image = "shovel.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["melonseed"] = {
        name = "melonseed",
        label = "Melon Seed",
        weight = 100,
        type = "item",
        image = "melonseed.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["pumpkinseed"] = {
        name = "pumpkinseed",
        label = "Pumpkin Seed",
        weight = 100,
        type = "item",
        image = "pumpkinseed.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["wheatseed"] = {
        name = "wheatseed",
        label = "Wheat Seed",
        weight = 100,
        type = "item",
        image = "wheatseed.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["churn"] = {
        name = "churn",
        label = "Churn",
        weight = 100,
        type = "item",
        image = "churn.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["milkbottle"] = {
        name = "milkbottle",
        label = "Milk Bottle",
        weight = 100,
        type = "item",
        image = "milkbottle.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["melon"] = {
        name = "melon",
        label = "Cutted Melon",
        weight = 100,
        type = "item",
        image = "melon.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["pumpkin"] = {
        name = "pumpkin",
        label = "Cutted Pumpkin",
        weight = 100,
        type = "item",
        image = "pumpkin.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ["wheat"] = {
        name = "wheat",
        label = "Wheat",
        weight = 100,
        type = "item",
        image = "wheat.png",
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "",
    },
    ['dog_rope'] = {
        label = 'Chó Husky',
        weight = 500,
        stack = false,
        close = true,
    },
   ['pet_cargo'] = {
        label = 'Thòng lòng bắt chó',
        weight = 1000,
        stack = false,
        close = true,
    },
    ["vehiclekeys"] = {
	label = "Keys",
	weight = 1,
	stack = false,
	close = false,
	consume = 0,
	client = {
		export = 'qs-vehiclekeys.useKey',
	},
},

['plate'] = {
	label = 'Plate',
	weight = 100,
	stack = true,
	close = false,
	consume = 0,
	client = {
		export = 'qs-vehiclekeys.usePlate',
	},
},

['carlockpick'] = {
	label = 'Car Lockpick',
	weight = 100,
	stack = true,
	close = false,
	description = "Plate for vehicle",
	client = {
		export = 'qs-vehiclekeys.useCarlockpick',
	},
},

['caradvancedlockpick'] = {
	label = 'Advanced Lockpick',
	weight = 100,
	stack = true,
	close = false,
	description = "Plate for vehicle",
	client = {
		export = 'qs-vehiclekeys.useAdvancedCarlockpick',
	},
},

['vehiclegps'] = {
    label = 'Vehicle GPS',
    weight = 100,
    stack = true,
    close = false,
    description = "GPS device for what...?",
    client = {
        export = 'qs-vehiclekeys.useVehiclegps',
    },
},

['vehicletracker'] = {
    label = 'Vehicle Tracker',
    weight = 100,
    stack = true,
    close = false,
    description = "It seems to stream probes",
    client = {
        export = 'qs-vehiclekeys.useVehicletracker',
    },
},
            ['axe_rusty'] = {
			label = 'Rusty Axe',
			weight = 8,
			stack = false,
			close = true,
			client = {
				export = 'qs-lumberjack.toggleAxe'
			},
			server = {
				export = 'qs-lumberjack.axe'
			},
		},

		['axe_iron'] = {
			label = 'Iron-Edged Axe',
			weight = 8,
			stack = false,
			close = true,
			client = {
				export = 'qs-lumberjack.toggleAxe'
			},
			server = {
				export = 'qs-lumberjack.axe'
			},
		},
		
		['axe_mythical'] = {
			label = 'Mythical Axe',
			weight = 8,
			stack = false,
			close = true,
			client = {
				export = 'qs-lumberjack.toggleAxe'
			},
			server = {
				export = 'qs-lumberjack.axe'
			},
        },
         ['kuz_watch'] = {
        label = 'Đồng hồ',
        weight = 500,
        stack = true,
        close = true,
    },
    ['kuz_pearl'] = {
        label = 'Ngọc trai',
        weight = 500,
        stack = true,
        close = true,
    },
    ['kuz_goldcoin'] = {
        label = 'Đồng xu Vàng',
        weight = 500,
        stack = true,
        close = true,
    },
    ['kuz_jewelry'] = {
        label = 'Trang sức',
        weight = 500,
        stack = true,
        close = true,
    },
    ['kuz_rarecoin'] = {
        label = 'Đồng xu hiếm',
        weight = 500,
        stack = true,
        close = true,
    },
    ['kuz_silvercoin'] = {
        label = 'Đồng xu Bạc',
        weight = 500,
        stack = true,
        close = true,
    },
    ['kuz_merryweather'] = {
        label = 'Phụ tùng Thời tiết vui vẻ',
        weight = 500,
        stack = true,
        close = true,
    },
    ['kuz_plasmacutter'] = {
        label = 'Máy cắt plasma',
        weight = 2000,
        stack = true,
        close = true,
    },
    ['kuz_divinggeargood'] = {
        label = 'Bộ đồ lặn cao cấp',
        weight = 2000,
        stack = false,
        close = true,
    },
    ['kuz_divinggear'] = {
        label = 'Bộ đồ lặn',
        weight = 2000,
        stack = false,
        close = true,
    },
    ['neo_thuyen'] = {
        label = 'Neo thuyền',
        weight = 2000,
        stack = false,
        close = true,
    },
    ['casino_ticket'] = {
        label = 'Vé quay xổ số',
        weight = 100,
        stack = false,
        close = true,
    },
    ['casino_chips'] = {
        label = 'Chip Casino',
        weight = 100,
        stack = false,
        close = true,
    },
}
