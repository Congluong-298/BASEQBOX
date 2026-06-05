Config = {}

Config.ServerName = "BB Studio" 
Config.ServerLogo = "https://projetcartylion.fr/wp-content/uploads/2020/08/Placeholder.png" -- The url to the server logo

Config.SoQuanAo = 16
Config.CamSlotUpdate = 14
Config.SlotBalo = 17
Config.TinhKhoDo = 5 + 1
Config.MaxTuiDo = 21 + Config.TinhKhoDo
Config.MaxCanNang = 20000
-- Config.SoQuanAo = 27
-- Config.CamSlotUpdate = -1
-- Config.SlotBalo = 27
-- Config.TinhKhoDo = 20 + 5
-- Config.MaxTuiDo = 5 + Config.TinhKhoDo -- thay doi so slost inven ben duoi
-- Config.MaxCanNang = 20000              -- so KG
Config.TuiDo = {
    [1] = {
        ["so_Slot"] = 31,
        ["so_Ky"] = 30000, 
    },
    [10] = {
        ["so_Slot"] = 31,
        ["so_Ky"] = 30000,
    },
    [21] = {
        ["so_Slot"] = 3,
        ["so_Ky"] = 30000,
    },
    [37] = {
        ["so_Slot"] = 31,
        ["so_Ky"] = 30000,
    },
    [81] = {
        ["so_Slot"] = 31,
        ["so_Ky"] = 40000,
    },
    [82] = {
        ["so_Slot"] = 41,
        ["so_Ky"] = 40000,
    },
    [85] = {
        ["so_Slot"] = 41,
        ["so_Ky"] = 40000,
    },
    [86] = {
        ["so_Slot"] = 41,
        ["so_Ky"] = 40000,
    },
    [92] = { --Balo 1
        ["so_Slot"] = 31,
        ["so_Ky"] = 30000,
    },
    [120] = { --Balo 1
        ["so_Slot"] = 41,
        ["so_Ky"] = 40000,
    },
    [122] = { --Balo 1
        ["so_Slot"] = 41,
        ["so_Ky"] = 40000,
    },
    [121] = { --Balo 1
        ["so_Slot"] = 41,
        ["so_Ky"] = 40000,
    },
    [125] = { --Balo 1
        ["so_Slot"] = 41,
        ["so_Ky"] = 40000,
    },
    --------Balo3
    [129] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    [130] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    [131] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    -- [135] = {
    --     ["so_Slot"] = 51,
    --     ["so_Ky"] = 50000,
    -- },
    [134] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    [136] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    [138] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000, --balo3
    },
    [141] = { --balo3
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    [142] = { --balo3
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    [143] = { --balo3
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    ---balo4
    [128] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 50000,
    },
    [138] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000, --balo4
    },
    [139] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000, --balo4
    },
    [140] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000,
    },
    [141] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000,
    },
    [147] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000,
    },
    [149] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000,
    },
    [150] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000,
    },
    [151] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000,
    },
    [152] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000,
    },
    [154] = {
        ["so_Slot"] = 51,
        ["so_Ky"] = 60000,
    },
}

Config.Url = "https://raw.githubusercontent.com/Congluong-298/clothesgrapestown/master/" -- The url to the image exemple (https://localhost:3000/images) or if in the folder images put (/web/build/images)
Config.Extension = "png" -- The extension of the image (png, webp, jpg, etc.)
Config.UrlInventory = true -- use only if you use a cloud for images (if disabled disable NoImage)
Config.NoImage = false --if true, the image will be the same on all categories (if enabled disable UrlInventory)

Config.EnableSound = true -- if true, the sound will be played when you click on an item

Config.StaffGroup = {
    "license2:7ffa50fbec304cd71fd372b4197e17873738d520",
}

Config.MajUrl = "https://raw.githubusercontent.com/MaskeZenY/Clothing-Shops-Fivem/refs/heads/main/version"
Config.Version = 1.93

Config.Animation = false 
Config.AnimationName = "anim@heists@heist_corona@single_team"
Config.AnimationName2 = "single_team_loop_boss"

Config.SaveOutfit = true 
Config.SaveOutfitPrice = 1000 
Config.CopyOutfitPrice = 1000 
Config.TakeOutfitPrice = 1000

Config.UseIllenium = true

Config.InventorySlot = 41

Config.UseScreenshot = false 
Config.ScreenshotUrl = "https://api2.discordtools.lol/upload"  
Config.ScreenshotGetUrl = "https://api2.discordtools.lol/getimage" 

Config.PedDepth = 1.5 

Config.UseCustomOXInventory = true 

Config.Decription = "Quần Áo đẹp thì làm gì cũng tự tin!"

Config.DefaultOutfit = {
    components = {
        {component_id = 1, drawable = 0, texture = 0, name = "mask_1"},
        {component_id = 3, drawable = 15, texture = 0, name = "arms"},
        {component_id = 4, drawable = 61, texture = 0, name = "pants_1"},
        {component_id = 5, drawable = 0, texture = 0, name = "bags_1"},
        {component_id = 6, drawable = 34, texture = 0, name = "shoes_1"},
        {component_id = 7, drawable = 1, texture = 0, name = "chain_1"},
        {component_id = 8, drawable = 15, texture = 0, name = "tshirt_1"},
        {component_id = 9, drawable = 0, texture = 0, name = "bproof_1"},
        {component_id = 10, drawable = 0, texture = 0, name = "decals"},
        {component_id = 11, drawable = 15, texture = 0, name = "torso_1"},

    },
    props = {
        {prop_id = 0, drawable = -1, texture = 0, name = "helmet_1"},
        {prop_id = 1, drawable = 0, texture = 0, name = "glasses_1"},
        {prop_id = 6, drawable = -1, texture = 0, name = "watches_1"},
        {prop_id = 7, drawable = -1, texture = 0, name = "bracelets_1"},
        {prop_id = 2, drawable = -1, texture = 0, name = "ears_1"},
    }
}

Config.DefaultOutfitWoman = {
    components = {
        {component_id = 1, drawable = 0, texture = 0, name = "mask_1"},
        {component_id = 3, drawable = 15, texture = 0, name = "arms"},
        {component_id = 4, drawable = 15, texture = 0, name = "pants_1"},
        {component_id = 5, drawable = 0, texture = 0, name = "bags_1"},
        {component_id = 6, drawable = 35, texture = 0, name = "shoes_1"},
        {component_id = 7, drawable = 0, texture = 0, name = "chain_1"},
        {component_id = 8, drawable = 15, texture = 0, name = "tshirt_1"},
        {component_id = 9, drawable = 0, texture = 0, name = "bproof_1"},
        {component_id = 10, drawable = 0, texture = 0, name = "decals"},
        {component_id = 11, drawable = 15, texture = 0, name = "torso_1"},

    },
    props = {
        {prop_id = 0, drawable = -1, texture = 0, name= "helmet_1"},
        {prop_id = 1, drawable = 0, texture = 0, name= "glasses_1"},
        {prop_id = 6, drawable = -1, texture = 0, name= "watches_1"},
        {prop_id = 7, drawable = -1, texture = 0, name= "bracelets_1"},
        {prop_id = 2, drawable = -1, texture = 0, name= "ears_1"},
    }
}

-- 158.11, -1057.27, 24.77, 347.95
Config.Coords = {
    {x = 72.3, y = -1399.1, z = 28.4, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = -703.8, y = -152.3, z = 36.4, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag",  "pants", "shoes", "hat"}},
    {x = -167.9, y = -299.0, z = 38.7, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag",  "pants", "shoes", "hat"}},
    {x = 428.7, y = -800.1, z = 28.5, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = -829.4, y = -1073.7, z = 10.3, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = -1447.8, y = -242.5, z = 48.8, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag",  "pants", "shoes", "hat"}},
    {x = 11.6, y = 6514.2, z = 30.9, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = 123.6, y = -219.4, z = 53.6, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = 1696.3, y = 4829.3, z = 41.1, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = 618.1, y = 2759.6, z = 41.1, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = 1190.6, y = 2713.4, z = 37.2, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = -1193.4, y = -772.3, z = 16.3, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = -3172.5, y = 1048.1, z = 19.9, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = -1108.4, y = 2708.9, z = 18.1, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = 158.11, y = -1057.27, z = 23.81, blips = true,BlipsName = "Cửa hàng quần áo",blipsid = 73,blipcolor = 1, category = {"shirt","torso", "glasses", "watch", "bracelets", "gloves", "earrings", "chain", "bag", "pants", "shoes", "hat"}},
    {x = -1337.459351, y = -1277.657104, z = 4.064502, blips = true,BlipsName = "Cửa hàng mặt nạ",blipsid = 362,blipcolor = 3, category = {"mask"}}
}

Config.ShowNotificationHelpMessage = "Nhấn ~r~E~s~ để thay đổi trang phục"

Config.DrawMarker = {
    draw = true,
    scale = 0.7,
    color = {r = 255, g = 0, b = 0, a = 100},
    type = 27,
    bobUpAndDown = false,
    faceCamera = false,
    rotate = false,
}

Config.Blips = {
    scale = 0.7,
    shortRange = true,
}

Config.WeightBag = 10000 --10kg
Config.WeightBagIndex = {1,10,21,37,41,44,45,81,82,83,85,86,92,120,121,122,125,128,129,130,131,134,136,138,139,140,141,142,143,147,149,150,151,152,154} --Index của balo

Config.Notification = {
    ['notenoughtmoney'] = "Bạn không có đủ tiền",
    ['cannotechange'] = "Bạn không thể trao đổi quần áo từ hoặc đến các vị trí này",
    ['cannotcarry'] = "Bạn không thể mang vật phẩm này",
    ['othersex'] = "Bạn không thể sao chép trang phục của giới tính khác",
    ['reservedto'] = "Vị trí này được dành riêng cho ",
    ['outfitnamelength'] = "Tên trang phục phải có ít nhất 3 ký tự",
    ['outfitnameexists'] = "Tên này đã tồn tại",
    ['outfitsaved'] = "Trang phục đã được lưu thành công",
    ['outfitdeleted'] = "Trang phục đã được xóa thành công",
    ['outfitnotfound'] = "Không tìm thấy trang phục",
    ['outfitexported'] = "Trang phục đã được xuất thành công",
    ['outfitexporterror'] = "Lỗi khi xuất trang phục",
    ['outfitequipped'] = "Bạn đã trang bị trang phục thành công",
    ['priceupdated'] = "Giá đã được cập nhật thành công"
}


Config.BlackList = {
    {index = {5, 3}, componentNumber = 5, prop = false},
    --{index = {5, 3}, componentNumber = 2, prop = false}, 
    -- (5,3 = chỉ số của thành phần 1 = mask prop = false = không phải là prop)
    -- (44 = chỉ số của thành phần 1 = mask prop = true = là một prop)
    {
        index = {
            0,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,
            22,23,24,25,26,27,28,29,30,
            31,32,33,34,35,36,38,39,40,
            41,42,43,44,45,46,47,48,49,50,
            51,52,53,54,55,56,57,58,59,60,
            61,62,63,64,65,66,67,68,69,70,
            71,72,73,74,75,76,77,78,79,80,
            81,82,83,84,85,86,87,88,89,90,
            91,92,93,94,95,96,97,98,99,100,
            101,102,103,104,105,106,107,108,
            109,110,111,112,113,114,115,116,
            117,118,119,120,121,122,123,124,
            125,126,127,128,129,130,131,132,
            133,134,135,136,137,138,139,140,
            141,142,143,144,145,146,147,148,
            149,150,151,152,153,154,155,156,
            157,158,159,160,161,162,163,164,
            165,166,167,168,169,170,171,172,
            173,174,175,176,177,178,179,180,
            181,182,183,184,185,186,187,188,
            189,190,191,192,193,194,195,196,
            197,198,199,200,201,202,203,204,
            205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,
        },
        componentNumber = 5, prop = false
    },

    {index = {5, 3}, componentNumber = 11, prop = false},
    --{index = {5, 3}, componentNumber = 2, prop = false}, 
    -- (5,3 = chỉ số của thành phần 1 = mask prop = false = không phải là prop)
    -- (44 = chỉ số của thành phần 1 = mask prop = true = là một prop)
    {
        index = {
            -- 0,958,957,955,15,16,19,20,21,26,29,30,33,37,52,53,55,63,64,65,75,80,81,91,92,93,94,101,102,108,118,123,143,145,149,150,151,154,159,160,166,183,187,190,193,196,200,209,212,213,214,215,219,220,239,252,250,255,259,262,263,
            -- 265,266,307,311,312,314,315,316,317,318,319,325,445,446,447,448,449,451,452,453,454,456,457,458,459,460,462,465,466,468,469,470,471,474,475,476,478,482,483,484,487,488,489,493,494,496,500,503,504,505,506,509,510,
            -- 511,513,516,517,518,565,566,568,569,570,571,572,573,574,575,576,577,588,534,535,540,541,542,543,544,545,546,547,548,549,550,551,586,589,593,599,552,553,554,555,556,557,558,559,564,514,502,
            -- 604,618,613,619,620,621,622,623,624,625,626,627,628,629,617,616,615,614,613,612,611,610,609,608,607,606,605,604,603,602,601,600,599,598,597,596,595,594,593,592,591,590,580,581,582,583,583,584,585,587,588,571,570,572,573,574,575,576,577,578,579,560,561,562,563,565,567,
            -- 630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,
            -- 661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,
            -- 692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,
            -- 721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,
            -- 741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,
            -- 761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,
            -- 781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,
            -- 801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,
            -- 821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,
            -- 841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,
            -- 861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879,880,
            -- 881,882,883,884,885,886,887,888,889,890,891,892,893,894,895,896,897,898,899,900,
            -- 901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,
            -- 921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,
            -- 941,942,943,944,945,946,947,948,949,950,951,952,953,954,955,956,959,960,961,962,
            -- 963,964,
        },
        componentNumber = 11, prop = false
    },

--     {index = {5, 3}, componentNumber = 9, prop = false},
--     --{index = {5, 3}, componentNumber = 2, prop = false}, 
--     -- (5,3 = chỉ số của thành phần 1 = mask prop = false = không phải là prop)
--     -- (44 = chỉ số của thành phần 1 = mask prop = true = là một prop)
--     {
--         index = {
--             0,1,2,3,4,5,6,7,8,9,10,
--             11,12,13,14,15,16,17,18,19,20,
--             21,22,23,24,25,26,27,28,29,30,
--             31,32,33,34,35,36,37,38,39,40,
--             41,42,43,44,45,46,47,48,49,50,
--             51,52,53,54,55,56,57,58,59,60,
--             61,62,63,64,65,66,67,68,69,70,
--             71,72,73,74,75,76,77,78,79,80,
--             81,82,83,84,85,86,87,88,89,90,
--             91,92,93,94,95,96,97,98,99,100,
--             101,102,103,104,105,106,107,108,
--             109,110,111,112,113,114,115,116,
--             117,118,119,120,121,122,123,124,
--             125,126,127,128,129,130,131,132,
--             133,134,135,136,137,138,139,140,
--             141,142,143,144,145,146,147,148,
--             149,150,151,152,153,154,155,156,
--             157,158,159,160,161,162,163,164,
--             165,166,167,168,169,170,171,172,
--             173,174,175,176,177,178,179,180,
--             181,182,183,184,185,186,187,188,
--             189,190,191,192,193,194,195,196,
--             197,198,199,200,201,202,203,204,205,206,
--             207,208,209,210,211,212,213,214,215,216,
--             217,218,219,220,221,222,223,224,225,226,
--             227,228,229,230,231,232,233,234,235,236,237,238
--         },
--         componentNumber = 9, prop = false
--     },

    {index = {5, 3}, componentNumber = 8, prop = false},
    --{index = {5, 3}, componentNumber = 2, prop = false}, 
    -- (5,3 = chỉ số của thành phần 1 = mask prop = false = không phải là prop)
    -- (44 = chỉ số của thành phần 1 = mask prop = true = là một prop)
    {
        index = {
            -- 0,105,122,129,130,153,154,155,170,172,189,190,193,194,195,196,197,201,202,203,204,205,206,207,
            -- 200,211,212,
            -- 213,214,215,216,217,218,219,220,221,222,223,224,225,226,
            -- 227,228,229,230,231,232,233,234,235,236,237,238,239,240,
            -- 241,242,243,244,245,246,247,248,249,250,
            -- 251,252,253,254,255,256,257,258,259,260,
            -- 261,262,263,264,265,266,267,268,269,270,271
        },
        componentNumber = 8, prop = false
    },
    --{index = {5, 3}, componentNumber = 2, prop = false}, 
    {index = {5, 3}, componentNumber = 4, prop = false},
    -- (5,3 = chỉ số của thành phần 1 = mask prop = false = không phải là prop)
    -- (44 = chỉ số của thành phần 1 = mask prop = true = là một prop)
    {
        index = {
            0,11,34,44,56,84,89,91,92,120,145,160,161,162,163,164,165,166,167,169,
            171,181,182,183,184,185,186,188,189,190,193,195,198,213,238,244,245,250,251,269,
            276,277,278,279,280,281,282,283,284,288,289,290,291,285
        },
        componentNumber = 4, prop = false
    },
    --{index = {5, 3}, componentNumber = 2, prop = false}, 
    -- (5,3 = chỉ số của thành phần 1 = mask prop = false = không phải là prop)
    -- (44 = chỉ số của thành phần 1 = mask prop = true = là một prop)
    {index = {5, 3}, componentNumber = 6, prop = false},
    {
        index = {
            0,2,7,13,33,84,85,86,127,128,129,130,131,140,141,142,143,163,165,171,
            176,175,181,182,187,198,202,203,204,205,206,210,211,212,213,214,215,216,217,218,219,220,221,222,223
        },
        componentNumber = 6, prop = false
    },
    -- {index = {5, 3}, componentNumber = 2, prop = false}, 
    -- (5,3 = chỉ số của thành phần 1 = mask prop = false = không phải là prop)
    -- (44 = chỉ số của thành phần 1 = mask prop = true = là một prop)
    {index = {5, 3}, componentNumber = 3, prop = false},
    {
        index = {0, 214, 215, 216},
        componentNumber = 3, prop = false
    },
    {index = {44}, componentNumber = 0, prop = true},
    {
        index = {
            46,111,113,114,115,116,117,118,119,121,123,124,137,138,144,147,148,150,190,191,
            201,202,205,207,208,214,215,222,224,225,226
        },
        componentNumber = 0, prop = true
    },
}


Config.PriceClothes = {
    -- {index = {1,2,3,4,5}, componentNumber = 5, prop = false, price = 100000}, 
    --{index = {8,9,2,3,6}, componentNumber = 11, prop = false, price = 50}, 
}

Config.DefaultPrice = {
    shirt = 2000,
    torso = 2000,
    pants = 2000,
    shoes = 2000,
    gloves = 2000,
    hat = 2000,
    glasses = 2000,
    mask = 10000,
    vest = 2000,
    bracelets = 2000,
    earrings = 2000,
    chain = 2000,
    watch = 2000,
    bag = 100000,
}

local function calculateSlot(baseSlot)
    return baseSlot
end

local minSlot = 999

local maxSlot = 0

componentMapping = { 
    -- CỘT BÊN TRÁI (Slot 6 đến 13)
    hat = { component = 0, prop = true , itemname = 'cloth_helmet', clothesSlotID = calculateSlot(6) , camera = 'head', label = 'Mũ' },
    mask = { component = 1, prop = false , itemname = 'cloth_mask', clothesSlotID = calculateSlot(7) , camera = 'head', label = 'Mặt nạ' },
    glasses = { component = 1, prop = true , itemname = 'cloth_glasses', clothesSlotID = calculateSlot(8) , camera = 'head', label = 'Kính' },
    chain = { component = 7, prop = false , itemname = 'cloth_chain', clothesSlotID = calculateSlot(9) , camera = 'default', label = 'Dây chuyền' },
    gloves = { component = 3, prop = false , itemname = 'cloth_arms', clothesSlotID = calculateSlot(10) , camera = 'default', label = 'Găng tay' },
    torso = { component = 11, prop = false , itemname = 'cloth_torso', clothesSlotID = calculateSlot(11) , camera = 'body', label = 'Áo khoác' }, -- Ô THỨ 6 BÊN TRÁI
    watch = { component = 6, prop = true , itemname = 'cloth_watches', clothesSlotID = calculateSlot(12) , camera = 'head', label = 'Đồng hồ' },
    pants = { component = 4, prop = false , itemname = 'cloth_pants', clothesSlotID = calculateSlot(13) , camera = 'pants', label = 'Quần' },

    -- CỘT BÊN PHẢI (Slot 14 đến 21)
    clothes = {itemname = 'clothes', clothesSlotID = calculateSlot(14), label = "Trang phục"},
    earrings = { component = 2, prop = true , itemname = 'cloth_ears', clothesSlotID = calculateSlot(15) , camera = 'head', label = 'Khuyên tai' },
    -- Slot 16 hiện tại bạn đang để trống hoặc có thể gán cho một phụ kiện khác
    bag = { component = 5, prop = false , itemname = 'cloth_bags', clothesSlotID = calculateSlot(17) , camera = 'default', label = 'Túi xách' },
    shirt = { component = 8, prop = false , itemname = 'cloth_tshirt', clothesSlotID = calculateSlot(18) , camera = 'body' , label = 'Áo thun' },
    vest = { component = 9, prop = false , itemname = 'cloth_bproof', clothesSlotID = calculateSlot(19) , camera = 'default', label = 'Áo chống đạn' },
    bracelets = { component = 7, prop = true , itemname = 'cloth_bracelets', clothesSlotID = calculateSlot(20) , camera = 'default', label = 'Vòng tay' },
    shoes = { component = 6, prop = false , itemname = 'cloth_shoes', clothesSlotID = calculateSlot(21) , camera = 'bottom', label = 'Giày' }
}

for _, item in pairs(componentMapping) do
    if item.clothesSlotID then
        if item.clothesSlotID < minSlot then
            minSlot = item.clothesSlotID
    
        end
        if item.clothesSlotID > maxSlot then
            maxSlot = item.clothesSlotID
       
        end
    end
end

Config.MinClothesSlot = minSlot
Config.MaxClothesSlot = maxSlot

Config.Camera = {
    default = {
        vec3(0, 2.2, 0.2),
        vec3(0, 0, -0.05),
    },
    head = {
        vec3(0, 0.9, 0.65),
        vec3(0, 0, 0.6),
    },
    body = {
        vec3(0, 1.2, 0.2),
        vec3(0, 0, 0.2),
    },
    pants = {
        vec3(0, 1.0, 0.2),
        vec3(0, 0, -0.3),
    },
    bottom = {
        vec3(0, 0.98, -0.7),
        vec3(0, 0, -0.9),
    },
}

Config.Clothes = {
    ["shirt"] = {
        male = 15,
        female = 15,
        dict = "clothingshirt",
        anim = "try_shirt_positive_d"
    },
    ["torso"] = {
        male = 252,
        female = 15,
        dict = "clothingshirt",
        anim = "try_shirt_positive_d"
    },
    ["pants"] = {
        male = 61,
        female = 15,
        dict = "re@construction",
        anim = "out_of_breath"
    },
    ["shoes"] = {
        male = 34,
        female = 118,
        dict = "random@domestic",
        anim = "pickup_low"
    },
    ["mask"] = {
        male = 0,
        female = 0,
        dict = "misscommon@van_put_on_masks",
        anim = "put_on_mask_ps"
    },
    ["gloves"] = {
        male = 0,
        female = 0,
        dict = "nmt_3_rcm-10",
        anim = "cs_nigel_dual-10"
    },
	["vest"] = {
        male = 0,
        female = 0,
        dict = "anim@heists@ornate_bank@grab_cash",
        anim = "intro"
    },
    ["bag"] = {
        male = 0,
        female = 0,
        dict = "anim@heists@ornate_bank@grab_cash",
        anim = "intro"
    },
    ["hat"] = {
        dict = "misscommon@van_put_on_masks",
        anim = "put_on_mask_ps"
    },
    ["glasses"] = {
        dict = "clothingspecs",
        anim = "take_off"
    },
    ["earrings"] = {
        dict = "mp_cp_stolen_tut",
        anim = "b_think"
    },
    ["watch"] = {
        dict = "nmt_3_rcm-10",
        anim = "cs_nigel_dual-10"
    },
    ["chain"] = {
        dict = "nmt_3_rcm-10",
        anim = "cs_nigel_dual-10"
    },
    ["bracelets"] = {
        dict = "nmt_3_rcm-10",
        anim = "cs_nigel_dual-10"
    },

	
}

Config.DefaultClothes = {
    torso = {
        components = {
            {component = 11, default_male = 15, default_female = 15}, -- torso
            {component = 8, default_male = 15, default_female = 15},  -- tshirt
            {component = 3, default_male = 15, default_female = 15}   -- arms
        }
    },
    shirt = {
        components = {
            {component = 8, default_male = 15, default_female = 15}
        }
    },
    pants = {
        components = {
            {component = 4, default_male = 61, default_female = 15}
        }
    },
    shoes = {
        components = {
            {component = 6, default_male = 34, default_female = 35}
        }
    },
    bag = {
        components = {
            {component = 5, default_male = 9, default_female = 9}
        }
    },
    vest = {
        components = {
            {component = 9, default_male = 0, default_female = 0}
        }
    },
    arms = {
        components = {
            {component = 3, default_male = 15, default_female = 15}
        }
    },
    gloves = {
        components = {
            {component = 3, default_male = 15, default_female = 15}
        }
    },
    mask = {
        components = {
            {component = 1, default_male = 0, default_female = 0}
        }
    },
    hat = {
        components = {
            {component = 0, default_male = -1, default_female = -1, prop = true}
        }
    },
    glasses = {
        components = {
            {component = 1, default_male = -1, default_female = -1, prop = true}
        }
    },
    earrings = {
        components = {
            {component = 2, default_male = -1, default_female = -1, prop = true}
        }
    },
    watch = {
        components = {
            {component = 6, default_male = -1, default_female = -1, prop = true}
        }
    },
    chain = {
        components = {
            {component = 7, default_male = 0, default_female = 0}
        }
    },
    bracelets = {
        components = {
            {component = 7, default_male = -1, default_female = -1, prop = true}
        }
    }
}

clothesComponentID = { 
    1, -- Mặt nạ
    0, -- Mũ
    2, -- Tai (phụ kiện)
    1, -- Kính
    5, -- balo (đã chuyển đến đây)
    8, -- Áo phông
    11, -- Quần áo trên (phần thân trên)
    9, -- Áo chống đạn
    7, -- Vòng tay
    6, -- Đồng hồ
    7, -- Dây chuyền (vòng cổ)
    4, -- Quần
    6, -- Giày dép
    3, -- Cánh tay (thân hoặc các phụ kiện có thể nhìn thấy)
    14 -- Quần áo
}


clothesComponentNames = { 
    "cloth_mask",       -- Mặt nạ  
    "cloth_helmet",     -- Mũ  
    "cloth_ears",       -- Phụ kiện tai  
    "cloth_glasses",    -- Kính mắt  
    "cloth_bags",       -- Túi xách  
    "cloth_tshirt",     -- Áo thun  
    "cloth_torso",      -- Áo khoác / phần thân trên  
    "cloth_bproof",     -- Áo chống đạn  
    "cloth_bracelets",  -- Vòng tay  
    "cloth_watches",    -- Đồng hồ  
    "cloth_chain",      -- Dây chuyền  
    "cloth_pants",      -- Quần dài  
    "cloth_shoes",      -- Giày  
    "cloth_arms",       -- Tay (phụ kiện hoặc phần thân)  
    "clothes"           -- Quần áo
}


-- clothesSlotID = { 
--     calculateSlot(8),  -- Mặt nạ (Index 1)
--     calculateSlot(7),  -- Mũ (Index 2)
--     calculateSlot(16), -- Tai (Index 3)
--     calculateSlot(9),  -- Kính (Index 4)
--     calculateSlot(17), -- Balo (Index 5)
--     calculateSlot(18), -- Áo thun (Index 6)
--     calculateSlot(12), -- Áo khoác (Index 7)
--     calculateSlot(19), -- Áo giáp (Index 8)
--     calculateSlot(20), -- Vòng tay (Index 9)
--     calculateSlot(13), -- Đồng hồ (Index 10)
--     calculateSlot(10), -- Dây chuyền (Index 11)
--     calculateSlot(14), -- Quần (Index 12)
--     calculateSlot(21), -- Giày (Index 13)
--     calculateSlot(11), -- Găng tay (Index 14)
--     calculateSlot(15)  -- Trang phục (Index 15)
-- }
-- Lưu ý: Thứ tự các số dưới đây phải khớp với tên trong clothesComponentNames
clothesSlotID = { 
    calculateSlot(7),  -- 1. cloth_mask (Mặt nạ) -> Slot 7
    calculateSlot(6),  -- 2. cloth_helmet (Mũ) -> Slot 6
    calculateSlot(15), -- 3. cloth_ears (Khuyên tai) -> Slot 15
    calculateSlot(8),  -- 4. cloth_glasses (Kính) -> Slot 8
    calculateSlot(17), -- 5. cloth_bags (Balo) -> Slot 17
    calculateSlot(18), -- 6. cloth_tshirt (Áo thun) -> Slot 18
    calculateSlot(11), -- 7. cloth_torso (Áo khoác) -> Slot 11 (Đúng vị trí bạn vẽ mũi tên)
    calculateSlot(19), -- 8. cloth_bproof (Áo giáp) -> Slot 19
    calculateSlot(20), -- 9. cloth_bracelets (Vòng tay) -> Slot 20
    calculateSlot(12), -- 10. cloth_watches (Đồng hồ) -> Slot 12
    calculateSlot(9),  -- 11. cloth_chain (Dây chuyền) -> Slot 9
    calculateSlot(13), -- 12. cloth_pants (Quần) -> Slot 13
    calculateSlot(21), -- 13. cloth_shoes (Giày) -> Slot 21
    calculateSlot(10), -- 14. cloth_arms (Găng tay) -> Slot 10
    calculateSlot(14)  -- 15. clothes (Trang phục) -> Slot 14
}