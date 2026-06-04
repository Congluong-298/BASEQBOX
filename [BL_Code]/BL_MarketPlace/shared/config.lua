Config = {}

Config.Marketplace = {
    MinPrice = 100,
    
    MaxPrice = 100000000,
    
    CommissionPercent = 5,
    
    MaxListingsPerPlayer = 5,
    
    ListingExpiryHours = 168, 
    
    OpenCommand = 'marketplace',
    
    Keybind = nil,
    
    ItemsPerPage = 16,
}

Config.BlackList = {
    'vehiclekeys', 
    'money', 
    'dong_xu_ban', 
    'cuon_tien_ban', 
    'day_dong', 
    'day_chuyen', 
    'kim_cuong', 
    'the_nha', 
    'vi_tien', 
    'bao_thuoc_la',
}

Config.UsingLuaNestMailBox = false

Config.Categories = {
    food = {
        label = "Thực phẩm",
        subCategories = {
            drinks = { label = "Đồ uống" },
            foods = { label = "Đồ ăn" }
        }
    },
    tool = {
        label = "Công cụ",
        subCategories = {
            hand_tools = { label = "Dụng cụ cầm tay" }
        }
    },
    job = {
        label = "Công việc",
        subCategories = {
            uniform = { label = "Đồng phục" }
        }
    },
    weapon = {
        label = "Vũ khí",
        subCategories = {}
    },
    other = {
        label = "Khác",
        subCategories = {}
    }
}

Config.ItemCategories = {
    food = {
        drinks = {"water", "beer", "whiskey", "vodka", "wine", "coffee", "energy_drink", "soda", "juice"},
        foods = {"bread", "burger", "pizza", "hotdog", "sandwich"}
    },
    tool = {
        hand_tools = {"hammer", "screwdriver", "wrench", "knife", "bat", "crowbar"}
    },
    job = {
        uniform = {"uniform", "backpack", "handcuffs", "zipties", "gloves", "mask"}
    },
    weapon = {"weapon_pistol", "weapon_rifle", "weapon_smg", "weapon_shotgun", "weapon_sniper", "ammo_pistol", "ammo_rifle", "ammo_smg", "ammo_shotgun", "ammo_sniper"}
}

Config.ItemImageUrl = "https://raw.githubusercontent.com/Congluong-298/Imagegrapestown/main/%s.png"

Config.MarketplacePed = {
    enabled = true,
    model = `s_m_y_shop_mask`, 
    coords = vector4(211.9905, -911.547, 31.362, 253.6),
    text = "THƯƠNG NHÂN BUÔN BÁN",
    interactionDistance = 3.0
}

