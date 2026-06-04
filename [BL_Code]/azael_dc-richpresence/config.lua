--===== FiveM Script =========================================
--= DC - Rich Presence
--===== Developed By: ========================================
--= Azael Dev
--===== Website: =============================================
--= https://www.azael.dev
--===== License: =============================================
--= Copyright (C) Azael Dev - All Rights Reserved
--= You are not allowed to sell this script
--============================================================ 

CONFIG = {}

CONFIG.Option = {                                           
    Update = {                                              
        Time = 15                                           
    },

    Display = {                                             
        ID = {                                              
            Enable = true                                   
        },

        Name = {                                            
            Enable = false                                   
        },

        Online = {                                          
            Enable = true                                   
        },

        Activity = {                                       
            Enable = true,                                  

            Plate = {                                      
                Enable = true                               
            }
        }
    }
}

CONFIG.Discord = {                                         
    Application = {                                        
        ID = 1329536526975238204                            
    },

    Asset = {                                              
        Logo = {                                            
            Name = 'WAGYU_TOWN',                          
            Text = 'WAGYU TOWN [ VIỆT NAM ]'
        },

        Icon = {                                           
            Name = 'WAGYU_TOWN',                          
            Text = 'WAGYU TOWN [ VIỆT NAM ]'                   
        }
    },

    Button = {                                              
        [1] = {                                             
            Text = 'Tham Gia Discord',                        
            URL = 'https://discord.gg/HbjZWKFQK3'             
        },

        [2] = {                             
            Text = 'Vào Thành Phố',                
            URL = 'cfx.re/join/zeakdp'      
        }
    }
}

CONFIG.Translate = {                         
    General = {                                        
        Slot = 'Cư dân',                      
        Player = 'Cư dân',                              
        Loading = 'Đang Tải...'                      
    },

    Unknown = {                                          
        Zone = 'Khu vực không xác định',              
        Activity = 'Hoạt động không xác định'             
    },
    
    Activity = {                               
        Dead = {                                          
            Ground = 'Chết tại %s',                     
            Water = 'Chết dưới nước tại %s',                
            Vehicle = 'Chết trên %s trong một chiếc %s %s'   
        },
    
        Ground = {                        
            Sprinting = 'Chạy nhanh trên %s',             
            Running = 'Chạy trên %s',                       
            Walking = 'Đi bộ trên %s',                 
            Standing = 'Đứng tại %s'                      
        },
    
        Water = {                                         
            Swimming = 'Bơi lội trên %s'                    
        },
    
        Vehicle = {                                        
            Sailing = 'Lướt sóng trên %s trong một chiếc %s %s', 
            Drowning = 'Chết đuối tại %s trong một chiếc %s %s', 
            Flying = 'Đang bay qua %s trong một chiếc %s %s',
            Landed = 'Hạ cánh tại %s trong một chiếc %s %s', 
            Parked = 'Đỗ xe tại %s trong một chiếc %s %s',  
            Cruising = 'Đi chậm trên %s trong một chiếc %s %s', 
            Speeding = 'Lái xe nhanh trên %s trong một chiếc %s %s' 
        }
    },
}

CONFIG.Zone = {                                  
    AIRP = 'Sân bay quốc tế Los Santos',
    ALAMO = 'Biển Alamo',
    ALTA = 'Alta',
    ARMYB = 'Fort Zancudo',
    BANHAMC = 'Banham Canyon Dr',
    BANNING = 'Banning',
    BEACH = 'Bãi biển Vespucci',
    BHAMCA = 'Banham Canyon',
    BRADP = 'Braddock Pass',
    BRADT = 'Braddock Tunnel',
    BURTON = 'Burton',
    CALAFB = 'Cầu Calafia',
    CANNY = 'Hẻm núi Raton',
    CCREAK = 'Suối Cassidy',
    CHAMH = 'Chamberlain Hills',
    CHIL = 'Vinewood Hills',
    CHU = 'Chumash',
    CMSW = 'Khu bảo tồn núi Chiliad',
    CYPRE = 'Cypress Flats',
    DAVIS = 'Davis',
    DELBE = 'Bãi biển Del Perro',
    DELPE = 'Del Perro',
    DELSOL = 'La Puerta',
    DESRT = 'Sa mạc Grand Senora',
    DOWNT = 'Khu trung tâm',
    DTVINE = 'Vinewood trung tâm',
    EAST_V = 'Đông Vinewood',
    EBURO = 'El Burro Heights',
    ELGORL = 'Hải đăng El Gordo',
    ELYSIAN = 'Đảo Elysian',
    GALFISH = 'Galilee',
    GOLF = 'GWC & Cộng đồng Golf',
    GRAPES = 'Grapeseed',
    GREATC = 'Great Chaparral',
    HARMO = 'Harmony',
    HAWICK = 'Hawick',
    HORS = 'Đường đua Vinewood',
    HUMLAB = 'Phòng thí nghiệm & Nghiên cứu Humane',
    JAIL = 'Nhà tù Bolingbroke',
    KOREAT = 'Little Seoul',
    LACT = 'Hồ Reservoir',
    LAGO = 'Lago Zancudo',
    LDAM = 'Đập Reservoir',
    LEGSQU = 'Quảng trường Legion',
    LMESA = 'La Mesa',
    LOSPUER = 'La Puerta',
    MIRR = 'Mirror Park',
    MORN = 'Morningwood',
    MOVIE = 'Richards Majestic',
    MTCHIL = 'Núi Chiliad',
    MTGORDO = 'Núi Gordo',
    MTJOSE = 'Núi Josiah',
    MURRI = 'Murrieta Heights',
    NCHU = 'Chumash phía Bắc',
    NOOSE = 'N.O.O.S.E',
    OCEANA = 'Thái Bình Dương',
    PALCOV = 'Vịnh Paleto',
    PALETO = 'Vịnh Paleto',
    PALFOR = 'Rừng Paleto',
    PALHIGH = 'Palomino Highlands',
    PALMPOW = 'Trạm điện Palmer-Taylor',
    PBLUFF = 'Pacific Bluffs',
    PBOX = 'Pillbox Hill',
    PROCOB = 'Bãi biển Procopio',
    RANCHO = 'Rancho',
    RGLEN = 'Richman Glen',
    RICHM = 'Richman',
    ROCKF = 'Đồi Rockford',
    RTRAK = 'Đường đua Redwood Lights',
    SANAND = 'San Andreas',
    SANCHIA = 'Dãy núi San Chianski',
    SANDY = 'Sandy Shores',
    SKID = 'Mission Row',
    SLAB = 'Stab City',
    STAD = 'Đấu trường Maze Bank',
    STRAW = 'Strawberry',
    TATAMO = 'Núi Tataviam',
    TERMINA = 'Ga tàu',
    TEXTI = 'Textile City',
    TONGVAH = 'Núi Tongva',
    TONGVAV = 'Thung lũng Tongva',
    VCANA = 'Kênh Vespucci',
    VESP = 'Vespucci',
    VINE = 'Vinewood',
    WINDF = 'Trang trại gió Ron Alternates',
    WVINE = 'Vinewood phía Tây',
    ZANCUDO = 'Sông Zancudo',
    ZP_ORT = 'Cảng South Los Santos',
    ZQ_UAR = 'Davis Quartz',
    PROL = 'Prologue / North Yankton',
    ISHeist = 'Đảo Cayo Perico'
}
