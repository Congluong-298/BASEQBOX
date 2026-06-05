Config = Config or {}
-- newesx / oldesx / newqb / oldqb / qbox / standalone / autodetect
Config.Framework = 'qbox'

-- oxmysql / mysql-async / ghattimysql
Config.SQL = 'oxmysql'

Config.Debug = false
Config.VersionChecker = false

Config.Language = 'en'

Config.PlayerName = 'game'

Config.OpenSettingsCommand = 'chatsettings'
Config.EnablePlayerJoinedMessage = true
Config.EnablePlayerDroppedMessage = true
Config.EnableMeDoFloatingMessage = true

Config.MeDoFloatingMessage = {
    anchor = 'head', -- 'head' or 'chest'
    extraOffset = { x = 0.0, y = 0.0, z = 0.0 }
}

Config.Settings = {
    theme = 'light', -- light / dark / dynamic
    backgroundBlur = true,
    chatCategoryBar = true,
    chatSize = 'M', -- XS / S / M / L / XL
    chatPosition = { x = 0, y = 0 },
    chatVisibility = 'ON_INPUT', -- VISIBLE / ON_INPUT / HIDDEN
    meDoTypingDots = true,
    soundEffect = true,
    accentColor = '#48CBFF',
    channelColors = {
        ['all']      = { backgroundColor = '#00000033', textColor = '#FFFFFF' },
        ['ooc']      = { backgroundColor = '#48FFF433', textColor = '#48FFF4' },
        ['me']       = { backgroundColor = '#FF48F333', textColor = '#FF48F3' },
        ['do']       = { backgroundColor = '#FFAA4833', textColor = '#FFAA48' },
        ['pm']       = { backgroundColor = '#B048FF33', textColor = '#B048FF' },
        ['server']   = { backgroundColor = '#FFFFFF33', textColor = '#FFFFFF' },
        ['dispatch'] = { backgroundColor = '#FF4E4833', textColor = '#FF4E48' },
        ['gang']     = { backgroundColor = '#FFA50033', textColor = '#FFA500' },
        ['history']  = { backgroundColor = '#FFFFFF33', textColor = '#FFFFFF' },
    }
}

Config.Channels = {
    [1] = { id = 'all',      label = 'ALL',      placeholder = 'Press [TAB] to cycle through channels...' },
    [2] = { id = 'ooc',      label = 'OOC',      placeholder = '/ooc type your ooc message...' },
    [3] = { id = 'me',       label = 'ME',        placeholder = '/me type your me command...' },
    [4] = { id = 'do',       label = 'DO',        placeholder = '/do type your do command...' },
    [5] = { id = 'pm',       label = 'PM',        placeholder = '/pm [ID] type your private message...' },
    [6] = { id = 'server',   label = 'SV',        placeholder = '/server type your server message...' },
    [7] = { id = 'dispatch', label = 'DISPATCH',  placeholder = '/dp type your dispatch message...' },
    [8] = { id = 'gang',     label = 'GANG',      placeholder = '/g type your gang message...' },
    [9] = { id = 'history',  label = 'HISTORY',   placeholder = '' },
}

Config.EnableOOCCommand = true
Config.OOCCommandSettings = {
    channel = 'ooc',
    command = 'ooc',
    showChannelTag = true,
    showPlayerData = { id = true, name = true },
    proximity = { enabled = false, distance = 5 },
    params = { { name = 'message' } }
}

Config.EnableMECommand = true
Config.MECommandSettings = {
    channel = 'me',
    command = 'me',
    showChannelTag = true,
    showPlayerData = { id = true, name = true },
    proximity = { enabled = true, distance = 5 },
    params = { { name = 'action' } }
}

Config.EnableDOCommand = true
Config.DOCommandSettings = {
    channel = 'do',
    command = 'do',
    showChannelTag = true,
    showPlayerData = { id = true, name = true },
    proximity = { enabled = true, distance = 5 },
    params = { { name = 'action' } }
}

Config.EnablePMCommand = true
Config.PMCommandSettings = {
    channel = 'pm',
    command = 'pm',
    showChannelTag = true,
    showPlayerData = { id = true, name = true },
    params = { { name = 'ID' }, { name = 'message' } }
}

Config.EnableServerCommand = true
Config.ServerCommandSettings = {
    channel = 'server',
    command = 'server',
    showChannelTag = true,
    showPlayerData = { id = false, name = false },
    requiredPermissions = { 'admin' },
    params = { { name = 'message' } }
}

Config.EnableDispatchCommand = true
Config.DispatchCommandSettings = {
    channel = 'dispatch',
    command = 'dp',
    showChannelTag = false,
    showPlayerData = { id = true, name = true },
    params = { { name = 'message' } },
    restrictTabToAllowedJobs = true,
    allowedJobs = {
        ['police'] = {
            jobTag = {
                enabled = true,
                label = 'PD',
                colors = { backgroundColor = '#4882FF33', textColor = '#4882FF' }
            },
            badge = {
                enabled = true,
                colors = { backgroundColor = '#FF484833', textColor = '#FF4848' },
                fn = function(source)
                    return math.random(0, 9999)
                end
            }
        },
        ['ambulance'] = {
            jobTag = {
                enabled = true,
                label = 'EMS',
                colors = { backgroundColor = '#FF48C233', textColor = '#FF48C2' }
            },
            badge = {
                enabled = true,
                colors = { backgroundColor = '#FF48C233', textColor = '#FF48C2' },
                fn = function(source)
                    return math.random(0, 9999)
                end
            }
        }
    }
}

Config.EnableGangCommand = true
Config.GangCommandSettings = {
    channel = 'gang',
    command = 'g',
    showChannelTag = false,
    showPlayerData = { id = true, name = true },
    params = { { name = 'message' } },
    restrictTabToAllowedJobs = true,
    allowedJobs = {
        ['ballas'] = {
            jobTag = {
                enabled = true,
                label = 'BALLAS',
                colors = { backgroundColor = '#8B00FF33', textColor = '#8B00FF' }
            },
            badge = {
                enabled = true,
                colors = { backgroundColor = '#8B00FF33', textColor = '#8B00FF' },
                fn = function(source)
                    return math.random(0, 9999)
                end
            }
        },
        ['vagos'] = {
            jobTag = {
                enabled = true,
                label = 'VAGOS',
                colors = { backgroundColor = '#FFD70033', textColor = '#FFD700' }
            },
            badge = {
                enabled = true,
                colors = { backgroundColor = '#FFD70033', textColor = '#FFD700' },
                fn = function(source)
                    return math.random(0, 9999)
                end
            }
        }
    },
    restrictTabToAllowedGangs = true,
    allowedGangs = {
        ['ballas'] = {
            jobTag = {
                enabled = true,
                label = 'BALLAS',
                colors = { backgroundColor = '#8B00FF33', textColor = '#8B00FF' }
            },
            badge = {
                enabled = true,
                colors = { backgroundColor = '#8B00FF33', textColor = '#8B00FF' },
                fn = function(source)
                    return math.random(0, 9999)
                end
            }
        },
        ['vagos'] = {
            jobTag = {
                enabled = true,
                label = 'VAGOS',
                colors = { backgroundColor = '#FFD70033', textColor = '#FFD700' }
            },
            badge = {
                enabled = true,
                colors = { backgroundColor = '#FFD70033', textColor = '#FFD700' },
                fn = function(source)
                    return math.random(0, 9999)
                end
            }
        }
    }
}

Config.AutoMessages = {
    enabled = true,
    period = 10,
    messages = {
        "Please don't forget about the server rules. Happy gaming!",
        "https://discord.gg/bGTwVVFXqU",
        "Welcome to Under The Crown RP",
        "Follow the rules"
    }
}

Config.MaskAnonymity = {
    enabled = true,
    anonymousName = 'ANONYMOUS',
    nonMaskProps = {
        [0] = true, [1] = true, [12] = true, [16] = true, [23] = true, [24] = true, [25] = true,
        [26] = true, [27] = true, [28] = true, [29] = true, [31] = true, [32] = true,
        [33] = true, [34] = true, [35] = true, [36] = true, [38] = true, [42] = true,
        [50] = true, [51] = true, [52] = true, [53] = true, [57] = true, [62] = true,
        [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true,
        [74] = true, [75] = true, [76] = true, [77] = true, [78] = true, [89] = true,
        [135] = true, [171] = true, [176] = true, [182] = true, [183] = true, [184] = true,
        [210] = true, [294] = true, [300] = true, [301] = true, [302] = true, [306] = true,
        [308] = true, [311] = true, [316] = true, [322] = true, [333] = true, [342] = true,
        [343] = true, [344] = true, [345] = true, [347] = true, [348] = true, [349] = true,
        [352] = true, [353] = true, [354] = true, [355] = true, [356] = true, [357] = true,
        [358] = true, [359] = true, [360] = true, [363] = true, [364] = true, [365] = true,
        [366] = true, [367] = true, [368] = true, [369] = true, [370] = true, [371] = true,
        [372] = true, [373] = true, [374] = true, [375] = true
    }
}

Config.MeDoTypingDots = {
    dotSize = 0.6,
    dotColor = { r = 255, g = 255, b = 255, a = 255 }
}

Config.Admins = {
    -- "license:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", -- standalone
    -- "admin", -- framework
}

Config.StandaloneTags = {
    -- ['police'] = {
    --     members = {
    --         "license:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    --     }
    -- },
    -- ['ambulance'] = {
    --     members = {
    --         "license:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    --     }
    -- },
}
