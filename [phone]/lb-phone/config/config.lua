Config = {}
Config.Debug = false -- 设置为 true 以启用调试模式

Config.Logs = {}
Config.Logs.Enabled = false
-- 在 https://refer.fivemanage.com/lb 使用优惠码 "LBPHONE25" 可永久享受 25% 折扣
-- 联盟链接 - 通过此链接购买将为我们带来佣金，且不会增加您的额外费用
Config.Logs.Service = "discord" -- fivemanage、discord 或 ox_lib。若使用 discord，请在 server/apiKeys.lua 中设置 webhook
Config.Logs.Avatar = false -- 是否尝试获取玩家头像用于 Discord 日志记录？
Config.Logs.Dataset = "default" -- fivemanage 数据集
Config.Logs.Actions = {
    Calls = true,
    Messages = true,
    InstaPic = true,
    Birdy = true,
    YellowPages = true,
    Marketplace = true,
    Mail = true,
    Wallet = true,
    DarkChat = true,
    Services = true,
    Crypto = true,
    Trendy = true,
    Uploads = true
}

Config.DatabaseChecker = {}
Config.DatabaseChecker.Enabled = true -- 若为 true，手机将检查数据库是否存在问题，并在可能的情况下自动修复
Config.DatabaseChecker.AutoFix = true

--[[ 框架选项 ]] --
Config.Framework = "auto"
--[[
    支持的框架：
        * auto: 自动检测框架
        * esx: es_extended - https://github.com/esx-framework/esx-legacy
        * qb: qb-core - https://github.com/qbcore-framework/qb-core
        * qbox: qbx_core - https://github.com/Qbox-project/qbx_core
        * ox: ox_core - https://github.com/overextended/ox_core
        * vrp2: vrp 2.0（仅限官方 vRP 2.0，不支持自定义版本）
        * standalone: 无框架。注意：除非您自行实现相关函数，否则依赖框架的特定应用将无法使用
]]
Config.CustomFramework = false -- 若设为 true 且使用 standalone，您将可以使用依赖框架的特定应用
Config.QBMailEvent = false -- 若希望此脚本监听 qb 邮件事件，请启用此项
Config.QBOldJobMethod = false -- 是否使用旧方法检查 qb-core 中的职业？此方法较慢，仅在使用过时的 qb-core 版本时需要

Config.Item = {}
-- 若需设置多个物品及手机边框颜色，请参阅 https://docs.lbscripts.com/phone/configuration/#multiple-items--colored-phones
Config.Item.Require = false -- 是否需要手机物品才能使用手机
Config.Item.Name = "phone" -- 手机物品名称
-- Config.Item.Names = {
--     {
--         name = "phone",
--         model = `lb_phone_prop`,
--         textureVariation = 0,
--         rotation = vector3(0.0, 0.0, 180.0),
--         offset = vector3(0.0, -0.005, 0.0),
--         landscapeOffset = vector3(-0.03, -0.005, -0.02),
--         landscapeRotation = vector3(0.0, 90.0, 180.0)
--     },
--     {
--         name = "phone_green",
--         model = `prop_phone_cs_frank`,
--         frameColor = "#3cff00",
--         textureVariation = 0,
--         rotation = vector3(0.0, 0.0, 0.0),
--         offset = vector3(0.0, -0.005, 0.0),
--         landscapeOffset = vector3(-0.03, -0.005, -0.02),
--         landscapeRotation = vector3(0.0, 90.0, 0.0)
--     },
--     {
--         name = "phone_orange",
--         model = `prop_phone_cs_frank`,
--         frameColor = "#ffa142",
--         textureVariation = 2,
--         rotation = vector3(0.0, 0.0, 0.0),
--         offset = vector3(0.0, -0.005, 0.0),
--         landscapeOffset = vector3(-0.03, -0.005, -0.02),
--         landscapeRotation = vector3(0.0, 90.0, 0.0)
--     }
-- }

Config.Item.Unique = false -- 每部手机是否应唯一？https://docs.lbscripts.com/phone/configuration/#unique-phones
Config.Item.Inventory = "auto" --[[
    您使用的背包系统，若已禁用 Config.Item.Unique 则忽略此项。

    支持的背包脚本：（若您未使用以下背包之一，则必须保持 Config.Item.Unique 为禁用状态）
        * auto: 自动检测背包
        * ox_inventory - https://github.com/overextended/ox_inventory
        * qb-inventory - https://github.com/qbcore-framework/qb-inventory
        * lj-inventory - https://github.com/loljoshie/lj-inventory
        * core_inventory - https://www.c8re.store/package/5121548
        * mf-inventory - https://modit.store/products/mf-inventory?variant=39985142268087
        * qs-inventory - https://buy.quasar-store.com/package/4770732
        * codem-inventory - https://codem.tebex.io/package/5900973
]]

Config.ServerSideSpawn = false -- 是否应在服务端生成实体？（车辆）
Config.PropSpawn = "state" --[[
    - client: 网络化，在客户端生成
    - server: 网络化，在服务端生成
    - state: 在每个客户端生成，非网络化
]]

Config.PhoneModel = `wyc_17pm` -- 手机模型，若需使用自定义手机模型，可在此修改
Config.PhoneRotation = vector3(0.0, 0.0, 180.0) -- 手机附着于玩家时的旋转角度
Config.PhoneOffset = vector3(0.0, -0.005, 0.0) -- 手机附着于玩家时的偏移量
Config.LandscapeRotation = vector3(0.0, 90.0, 180.0) -- 横屏模式（相机）下手机的旋转角度
Config.LandscapeOffset = vector3(-0.03, -0.005, -0.02) -- 横屏模式（相机）下手机的偏移量

Config.DisableOpenNUI = true -- 当其他脚本占用 NUI 焦点时，是否禁止打开手机？

Config.LiveTray = true
Config.SetupScreen = true -- 若启用，玩家首次使用手机时将显示设置引导界面
Config.AppDownloadTime = 2000 -- 从应用商店下载应用所需时间（毫秒）

Config.AutoDisableSparkAccounts = true -- 是否自动禁用不活跃的 Spark 账户？可设为账户不活跃多少天后禁用，或设为 true 表示 7 天后禁用
Config.AutoDeleteNotifications = true -- 超过 X 小时的通知将被删除。设为 false 以禁用。若设为 true，将删除 1 周前的通知
Config.MaxNotifications = 50 -- 玩家可拥有的最大通知数量。超出后将删除最旧的通知。设为 false 以禁用
Config.NotificationsUpdateZIndex = true -- 收到通知时是否更新 z-index？这将使通知显示在 HUD 上方
Config.DisabledNotifications = { -- 不应发送通知的应用数组，注意应使用 config.json 中的应用标识符
    -- "DarkChat",
}

-- 用户首次创建 DarkChat 账户时将自动加入以下频道
Config.AutoJoinDarkChat = {
    -- "general",
}

--[[
    在此可为特定职业设置应用白名单/黑名单。有两种格式：

    允许/禁止的职业数组
    例如：{ "police", "ambulance" }

    允许/禁止的职业键值对，键为职业名称，值为访问该应用所需的最低等级
    例如：{ ["police"] = 1, ["ambulance"] = 1 }

    键为应用标识符。默认应用标识符可在 config/config.json 中找到。自定义应用请咨询应用作者。
--]]

Config.WhitelistApps = {
    -- ["Weather"] = { "police", "ambulance" }
}

Config.BlacklistApps = {
    -- ["Maps"] = { "police" }
}

Config.ChangePassword = {
    ["Trendy"] = true,
    ["InstaPic"] = true,
    ["Birdy"] = true,
    ["DarkChat"] = true,
    ["Mail"] = true,
}

Config.DeleteAccount = {
    ["Trendy"] = false,
    ["InstaPic"] = false,
    ["Birdy"] = false,
    ["DarkChat"] = false,
    ["Mail"] = false,
    ["Spark"] = false,
}

Config.Companies = {}
Config.Companies.Enabled = true -- 是否允许玩家呼叫公司？
Config.Companies.MessageOffline = true -- 若为 true，即使公司内无人在线，玩家也可向公司发送消息
Config.Companies.DefaultCallsDisabled = false -- 是否默认禁用接收公司来电？
Config.Companies.AllowAnonymous = false -- 是否允许玩家在启用"隐藏来电显示"的情况下呼叫公司？
Config.Companies.SeeEmployees = "everyone" -- 谁可以查看员工信息？将显示姓名、在线状态和电话号码。选项："everyone"（所有人）、"employees"（员工）或 "none"（无人）
Config.Companies.DeleteConversations = true -- 是否允许员工删除对话？
Config.Companies.AllowNoService = false -- 是否允许玩家在无手机信号（无覆盖）的情况下呼叫和向公司发消息？
Config.Companies.Services = {
    {
        job = "police",
        name = "警察局",
        icon = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png",
        canCall = true, -- 若为 true，玩家可以呼叫该公司
        canMessage = true, -- 若为 true，玩家可以向该公司发送消息
        bossRanks = { "boss" }, -- 可管理公司的职级
        location = {
            name = "任务街",
            coords = {
                x = 428.9,
                y = -984.5,
            }
        },
        quickReplies = {
            ["APPS.SERVICES.QUICK_REPLIES.REQUEST_LOCATION.TITLE"] = "APPS.SERVICES.QUICK_REPLIES.REQUEST_LOCATION.MESSAGE",
            ["APPS.SERVICES.QUICK_REPLIES.OFFICER_EN_ROUTE.TITLE"] = "APPS.SERVICES.QUICK_REPLIES.OFFICER_EN_ROUTE.MESSAGE",
            -- ["警员已出发"] = "一名警员正在赶来。",
        },
        -- customIcon = "IoShield", -- 若需为公司使用自定义图标，请在此设置：https://react-icons.github.io/react-icons/icons?name=io5
        -- onCustomIconClick = function()
        --    print("Clicked")
        -- end
    },
    {
        job = "ambulance",
        name = "救护车",
        icon = "https://cdn-icons-png.flaticon.com/128/1032/1032989.png",
        canCall = true, -- 若为 true，玩家可以呼叫该公司
        canMessage = true, -- 若为 true，玩家可以向该公司发送消息
        bossRanks = {"boss", "doctor"}, -- 可管理公司的职级
        location = {
            name = "药盒山",
            coords = {
                x = 304.2,
                y = -587.0
            }
        }
    },
    {
        job = "mechanic",
        name = "修车厂",
        icon = "https://cdn-icons-png.flaticon.com/128/10281/10281554.png",
        canCall = true, -- 若为 true，玩家可以呼叫该公司
        canMessage = true, -- 若为 true，玩家可以向该公司发送消息
        bossRanks = {"boss", "worker"}, -- 可管理公司的职级
        location = {
            name = "LS 改装厂",
            coords = {
                x = -336.6,
                y = -134.3
            }
        }
    },
    {
        job = "taxi",
        name = "出租车",
        icon = "https://cdn-icons-png.flaticon.com/128/433/433449.png",
        canCall = true, -- 若为 true，玩家可以呼叫该公司
        canMessage = true, -- 若为 true，玩家可以向该公司发送消息
        bossRanks = {"boss", "driver"}, -- 可管理公司的职级
        location = {
            name = "出租车总部",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
}

Config.Companies.Contacts = { -- 若使用服务应用则不需要此项，这会将联系人添加到通讯录应用
    -- ["police"] = {
    --     name = "警察局",
    --     photo = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png"
    -- },
}

Config.Companies.Management = {
    Enabled = true, -- 若为 true，员工和老板可以管理公司

    Duty = true, -- 若为 true，员工可以上下班
    -- 老板操作
    Deposit = true, -- 若为 true，老板可以向公司存入资金
    Withdraw = true, -- 若为 true，老板可以从公司提取资金
    Hire = true, -- 若为 true，老板可以雇佣员工
    Fire = true, -- 若为 true，老板可以解雇员工
    Promote = true, -- 若为 true，老板可以晋升员工
}

Config.CustomApps = {} -- https://docs.lbscripts.com/phone/custom-apps/

Config.Valet = {}
Config.Valet.Enabled = true -- 是否允许玩家通过手机取车
Config.Valet.VehicleTypes = { "car", "vehicle" }
Config.Valet.Price = 100 -- 取车费用
Config.Valet.Model = `S_M_Y_XMech_01`
Config.Valet.Drive = true -- 是否由 NPC 将车送来，还是直接在玩家面前生成？
Config.Valet.DisableDamages = false -- 在 esx 上是否禁用车辆损坏（引擎和车身健康值）
Config.Valet.FixTakeOut = false -- 取车后是否修理车辆？

Config.HouseScript = "auto" --[[
    服务器上使用的房屋脚本
    支持：
        * loaf_housing - https://store.loaf-scripts.com/package/4310850
        * qb-houses
        * qs-housing
        * vms_housing
        * rtx_housing
]]

--[[ 语音选项 ]] --
Config.Voice = {}
Config.Voice.CallEffects = false -- 扬声器模式下是否启用通话音效？（注意：若服务器注册了过多 submix，可能会导致声音问题）
Config.Voice.SpatialAudio = true -- 是否为免提启用 3D 音频？
Config.Voice.SpatialAudioSubmixes = 1 -- 为空间音频创建的 submix 数量
Config.Voice.System = "auto"
--[[
    支持的语音系统：
        * pma: pma-voice - 强烈推荐
        * mumble: mumble-voip - 不推荐，请升级至 pma-voice
        * salty: saltychat - 不推荐，请更换为 pma-voice
        * toko: tokovoip - 不推荐，请更换为 pma-voice
]]

Config.Voice.HearNearby = true --[[
    仅适用于 pma-voice

    若为 true，InstaPic 直播时附近玩家可被听到
    若为 false，仅直播者本人可被听到

    若为 true，启用扬声器时附近玩家可旁听电话通话
    若为 false，仅通话参与者可以互相听到
]]

Config.Voice.RecordNearby = true -- 视频录制是否应包含附近玩家？
Config.Voice.WaitUntilNotTalking = false -- 录制音频前是否等待玩家停止说话？这可能修复 PTT 卡住的 bug

--[[ 手机选项 ]] --
Config.Sound = {}
Config.Sound.System = "native" -- native: 使用 GTA 原生音频，nui: 通过 nui 播放音频。注意：同步仅在使用 GTA 原生音频时有效
Config.Sound.Sync = true -- 音频同步仅在使用原生音频时有效
Config.Sound.Volume = {} -- 音量选项仅适用于原生音频
Config.Sound.Volume.Multiplier = 1.0
Config.Sound.Volume.Static = false -- 可在此为原生音效设置固定音量，而非允许用户自行调节
Config.Sound.Volume.Min = 0.0
Config.Sound.Volume.Max = 1.0
Config.Sound.MaxDistance = 30.0 -- 声音可被听到的最大距离（仅适用于原生音频）

Config.Sound.Ringtones = {
    ["default"] = {
        name = "23",
        soundSet = "ringtone"
    },
    ["铃声 1"] = {
        name = "1",
        soundSet = "ringtone"
    },
    ["铃声 2"] = {
        name = "7",
        soundSet = "ringtone"
    },
    ["铃声 3"] = {
        name = "10",
        soundSet = "ringtone"
    },
    ["铃声 4"] = {
        name = "13",
        soundSet = "ringtone"
    },
    ["铃声 5"] = {
        name = "15",
        soundSet = "ringtone"
    },
    ["铃声 6"] = {
        name = "17",
        soundSet = "ringtone"
    },
    ["铃声 7"] = {
        name = "19",
        soundSet = "ringtone"
    },
    ["铃声 8"] = {
        name = "21",
        soundSet = "ringtone"
    },
    ["铃声 9"] = {
        name = "24",
        soundSet = "ringtone"
    },
}

Config.Sound.Notifications = {
    ["default"] = {
        name = "1",
        soundSet = "notification"
    },
    ["通知音 1"] = {
        name = "2",
        soundSet = "notification"
    },
    ["通知音 2"] = {
        name = "3",
        soundSet = "notification"
    },
    ["通知音 3"] = {
        name = "4",
        soundSet = "notification"
    },
    ["通知音 4"] = {
        name = "5",
        soundSet = "notification"
    },
    ["通知音 5"] = {
        name = "6",
        soundSet = "notification"
    },
    ["通知音 6"] = {
        name = "7",
        soundSet = "notification"
    },
    ["通知音 7"] = {
        name = "8",
        soundSet = "notification"
    },
}

Config.Sound.AppNotifications = {
    -- ["Messages"] = "default"
}

Config.CellTowers = {}
Config.CellTowers.Enabled = true -- 是否使用 cellTowers.lua 文件中定义的基站来计算信号？若设为 false，将改用 GetZoneScumminess
Config.CellTowers.Debug = false -- 是否在地图上显示基站？
Config.CellTowers.MinService = 0 -- 信号格数始终不会低于此值
Config.CellTowers.Range = {
    [4] = 250.0, -- 距离基站 250 米内可获得 4 格信号
    [3] = 500.0,
    [2] = 750.0,
    [1] = 1500.0,
}

-- Config.CustomMaps = {
--     {
--         label = "RDR2",
--         url = "https://s.rsg.sc/sc/images/games/RDR2/map/{layer}/{z}/{x}/{y}.jpg",
--         center = { 5000, 5000 },
--         topLeft = { -7168, 4096 },
--         bottomRight = { 5120, -5632 },
--         resolution = { 48841, 38666 },
--         zoom = {
--             default = 2,
--             max = 8,
--             min = 2
--         },
--         styles = {
--             {
--                 name = "game",
--                 background = "#384950"
--             },
--         }
--     },
-- }

Config.Locations = { -- 将显示在地图应用中的位置
    {
        position = vector2(428.9, -984.5),
        name = "洛圣都警察局",
        description = "洛圣都警察局",
        icon = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png",
    },
    {
        position = vector2(304.2, -587.0),
        name = "药盒山",
        description = "药盒山医疗中心",
        icon = "https://cdn-icons-png.flaticon.com/128/1032/1032989.png",
    },
}

Config.Locales = { -- 若您需要的语言不在此列表中，可在 https://github.com/lbphone/lb-phone-locales 贡献翻译
    {
        locale = "en",
        name = "English"
    },
    {
        locale = "de",
        name = "Deutsch"
    },
    {
        locale = "fr",
        name = "Français"
    },
    {
        locale = "es",
        name = "Español"
    },
    {
        locale = "nl",
        name = "Nederlands"
    },
    {
        locale = "dk",
        name = "Dansk"
    },
    {
        locale = "no",
        name = "Norsk"
    },
    {
        locale = "th",
        name = "ไทย"
    },
    {
        locale = "ar",
        name = "عربي"
    },
    {
        locale = "ru",
        name = "Русский"
    },
    {
        locale = "cs",
        name = "Czech"
    },
    {
        locale = "sv",
        name = "Svenska"
    },
    {
        locale = "pl",
        name = "Polski"
    },
    {
        locale = "hu",
        name = "Magyar"
    },
    {
        locale = "tr",
        name = "Türkçe"
    },
    {
        locale = "pt-br",
        name = "Português (Brasil)"
    },
    {
        locale = "pt-pt",
        name = "Português"
    },
    {
        locale = "it",
        name = "Italiano"
    },
    {
        locale = "ua",
        name = "Українська"
    },
    {
        locale = "ba",
        name = "Bosanski"
    },
    {
        locale = "zh-cn",
        name = "简体中文"
    },
    {
        locale = "ro",
        name = "Romana"
    },
    {
        locale = "ja",
        name = "日本語",
    },
    {
        locale = "ko",
        name = "한국어",
    },
}

Config.DefaultLocale = "zh-cn"
Config.DateLocale = "zh-CN" -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat
Config.DateFormat = "auto" -- auto: 使用语言包中的日期格式，或设置自定义格式（例如 "DDDD, MMMM DD"）

Config.FrameColor = "#39334d" -- 手机边框颜色。默认 (#39334d) 为紫色
Config.AllowFrameColorChange = true -- 是否允许玩家更改手机边框颜色？

Config.PhoneNumber = {}
Config.PhoneNumber.Format = "({3}) {3}-{4}" -- 除非您了解其原理，否则请勿修改。重要：数字位数之和必须等于电话号码长度 + 前缀长度
Config.PhoneNumber.Length = 7 -- 不含前缀的电话号码长度
Config.PhoneNumber.Prefixes = { -- 电话号码的前几位，通常为区号。所有前缀长度必须相同
    "205",
    "907",
    "480",
    "520",
    "602"
}

Config.Battery = {} -- 使用以下设置，满电约可持续 2 小时
Config.Battery.Enabled = false -- 是否启用手机电池，您需要使用 exports 来充电
Config.Battery.ChargeInterval = { 5, 10 } -- 充电间隔
Config.Battery.DischargeInterval = { 50, 60 } -- 每减少 1% 电量所需的秒数
Config.Battery.DischargeWhenInactiveInterval = { 80, 120 } -- 手机未使用时，每减少 1% 电量所需的秒数
Config.Battery.DischargeWhenInactive = true -- 手机关闭时是否消耗电量？

Config.CurrencyFormat = "$%s" -- （$100）货币显示格式。%s 将被替换为金额
Config.MaxTransferAmount = 1000000 -- 通过钱包/消息一次性转账的最大金额
Config.TransferOffline = true -- 是否允许玩家通过钱包应用向离线玩家转账？

Config.TransferLimits = {}
Config.TransferLimits.Daily = false -- 每日最大转账金额。设为 false 表示无限制
Config.TransferLimits.Weekly = false -- 每周最大转账金额。设为 false 表示无限制

Config.EnableMessagePay = true -- 是否允许玩家通过消息付款？
Config.EnableVoiceMessages = true -- 是否允许玩家发送语音消息？
Config.EnableGIFs = true
Config.GIFsFilter = "low" -- https://developers.google.com/tenor/guides/content-filtering#ContentFilter-options

Config.CityName = "洛圣都" -- 在天气应用等中使用的城市名称
Config.RealTime = true -- 若为 true，时间将根据用户所在地使用真实时间；若为 false，时间将使用游戏内时间
Config.CustomTime = false -- 注意：使用此项时请禁用 Config.RealTime。可设为返回自定义时间的函数，格式为表：{ hour = 0-24, minute = 0-60 }

Config.EmailDomain = "lbscripts.com"
Config.AutoCreateEmail = false -- 玩家设置手机时是否自动创建邮箱？
Config.DeleteMail = true -- 是否允许玩家在邮件应用中删除邮件？
Config.ConvertMailToMarkdown = true -- 是否将邮件从 HTML 转换为 Markdown？

Config.DeleteMessages = true -- 是否允许玩家在消息应用中删除消息？
Config.GroupMessageMemberLimit = false -- 群聊的最大成员数量

Config.SyncFlash = true -- 是否在所有玩家之间同步手电筒？可能影响性能
Config.EndLiveClose = false -- 关闭手机时是否结束 InstaPic 直播？

Config.AllowExternal = { -- 是否允许上传外部图片？（注意：这意味着他们可以上传 NSFW/血腥等内容）
    Gallery = false, -- 是否允许将外部链接导入相册？
    Birdy = false, -- 设为 true 以在该特定应用启用外部图片，设为 false 以禁用
    InstaPic = false,
    Spark = false,
    Trendy = false,
    Pages = false,
    Marketplace = false,
    Mail = false,
    Messages = false,
    Other = false, -- 没有特定设置的其他应用（例如：为联系人设置头像、手机壁纸等）
}

-- 外部图片的屏蔽主机名。无法从这些主机名上传
Config.ExternalBlacklistedHostnames = {}

-- 外部图片的屏蔽域名（同时屏蔽所有子域名）
Config.ExternalBlacklistedDomains = {
    "imgur.com",
    "discord.com",
    "discordapp.com",
}

-- 外部图片的白名单主机名
Config.ExternalWhitelistedHostnames = {
    -- "*.fivemanage.com",
    -- "*.fmfile.com",
    "r2.qbox.re",
}

-- 外部图片的白名单域名（允许所有子域名）
Config.ExternalWhitelistedDomains = {
    "fivemanage.com"
}

-- 允许向手机上传图片的主机名（防止使用开发者工具上传图片）
-- 可在主机名开头使用 "*" 作为通配符以允许所有子域名（例如 "*.example.com" 将允许来自 "r2.example.com"、"s3.example.com" 等的上传）
Config.UploadWhitelistedHostnames = {
    -- "*.fivemanage.com",
    -- "*.fmfile.com",
    "r2.qbox.re", -- https://docs.qbox.re/dashboard/cdn
}

Config.UploadWhitelistedDomains = {
    "fivemanage.com",
    "fmfile.com",
    "amazonaws.com", -- lb-presigned (S3)
}

Config.NameFilter = ".+"
-- Config.NameFilter = "^[%w%s']+$" -- 仅允许字母数字字符、空格和 '

Config.WordBlacklist = {}
Config.WordBlacklist.Enabled = false
Config.WordBlacklist.Apps = { -- 应使用词汇黑名单的应用（若 Config.WordBlacklist.Enabled 为 true）
    Birdy = true,
    InstaPic = true,
    Trendy = true,
    Spark = true,
    Messages = true,
    Pages = true,
    Marketplace = true,
    DarkChat = true,
    Mail = true,
    Other = true,
}

Config.WordBlacklist.Words = {
    -- 屏蔽词数组，例如 "badword", "anotherbadword"
}

Config.AutoFollow = {}
Config.AutoFollow.Enabled = false

Config.AutoFollow.Birdy = {}
Config.AutoFollow.Birdy.Enabled = true
Config.AutoFollow.Birdy.Accounts = {} -- 创建账户时自动关注的用户名数组，例如 "username", "anotherusername"

Config.AutoFollow.InstaPic = {}
Config.AutoFollow.InstaPic.Enabled = true
Config.AutoFollow.InstaPic.Accounts = {} -- 创建账户时自动关注的用户名数组，例如 "username", "anotherusername"

Config.AutoFollow.Trendy = {}
Config.AutoFollow.Trendy.Enabled = true
Config.AutoFollow.Trendy.Accounts = {} -- 创建账户时自动关注的用户名数组，例如 "username", "anotherusername"

Config.AutoBackup = true -- 获得新手机时是否自动创建备份？

Config.Post = {} -- 哪些应用应将帖子发送到 Discord？可在 server/webhooks.lua 中设置 webhook
Config.Post.Birdy = true -- 是否在 Birdy 上公告新帖子？
Config.Post.InstaPic = true -- 是否在 InstaPic 上公告新帖子？
Config.Post.Accounts = {
    Birdy = {
        Username = "Birdy",
        Avatar = "https://assets.loaf-scripts.com/lb-phone/icons/Birdy.png"
    },
    InstaPic = {
        Username = "InstaPic",
        Avatar = "https://assets.loaf-scripts.com/lb-phone/icons/InstaPic.png"
    }
}

Config.BirdyTrending = {}
Config.BirdyTrending.Enabled = true -- 是否显示热门话题标签？
Config.BirdyTrending.Reset = 7 * 24 -- Birdy 热门话题标签多久重置一次？（小时）

Config.BirdyNotifications = false -- 是否在有新帖子时向所有人发送通知？（若为 false，仅粉丝会收到通知）
Config.InstaPicLiveNotifications = false -- 是否在某人 InstaPic 开播时向所有人发送通知？（若为 false，仅粉丝会收到通知）也可设为 "all" 以同时通知离线玩家

Config.PromoteBirdy = {}
Config.PromoteBirdy.Enabled = true -- 是否可以推广帖子？
Config.PromoteBirdy.Cost = 2500 -- 推广帖子的费用
Config.PromoteBirdy.Views = 100 -- 推广帖子获得的浏览量

--- Birdy 认证徽章等级（UI）。账户上的 `verified` 可为 `true`（视为等级 1）或等级数字。多等级需在数据库/支持层使用整数 `verified`
Config.Verified = {}
Config.Verified.Birdy = {
    [1] = {
        color = "#1d9af0",
        label = "APPS.TWITTER.VERIFIED.LABEL",
        description = "APPS.TWITTER.VERIFIED.DESCRIPTION"
    },
    [2] = {
        color = "#d4a017",
        label = "APPS.TWITTER.VERIFIED_GOVERNMENT.LABEL",
        description = "APPS.TWITTER.VERIFIED_GOVERNMENT.DESCRIPTION"
    }
}

Config.UsernameFilter = {
    Regex = "[a-zA-Z0-9]+", -- 此正则用于清理 @提及 和账户创建中的用户名
    LuaPattern = "^[%w]+$", -- 此模式用于确保创建账户时用户名不包含特殊字符
}

Config.TrendyTTS = {
    {"英语（美国）- 女声", "en_us_001"},
    {"英语（美国）- 男声 1", "en_us_006"},
    {"英语（美国）- 男声 2", "en_us_007"},
    {"英语（美国）- 男声 3", "en_us_009"},
    {"英语（美国）- 男声 4", "en_us_010"},

    {"英语（英国）- 男声 1", "en_uk_001"},
    {"英语（英国）- 男声 2", "en_uk_003"},

    {"英语（澳大利亚）- 女声", "en_au_001"},
    {"英语（澳大利亚）- 男声", "en_au_002"},

    {"法语 - 男声 1", "fr_001"},
    {"法语 - 男声 2", "fr_002"},

    {"德语 - 女声", "de_001"},
    {"德语 - 男声", "de_002"},

    {"西班牙语 - 男声", "es_002"},

    {"西班牙语（墨西哥）- 男声", "es_mx_002"},

    {"葡萄牙语（巴西）- 女声 2", "br_003"},
    {"葡萄牙语（巴西）- 女声 3", "br_004"},
    {"葡萄牙语（巴西）- 男声", "br_005"},

    {"印尼语 - 女声", "id_001"},

    {"日语 - 女声 1", "jp_001"},
    {"日语 - 女声 2", "jp_003"},
    {"日语 - 女声 3", "jp_005"},
    {"日语 - 男声", "jp_006"},

    {"韩语 - 男声 1", "kr_002"},
    {"韩语 - 男声 2", "kr_004"},
    {"韩语 - 女声", "kr_003"},

    {"歌唱 - 女低音", "en_female_f08_salut_damour"},
    {"歌唱 - 男高音", "en_male_m03_lobby"},
    {"歌唱 - Sunshine Soon", "en_male_m03_sunshine_soon"},
    {"歌唱 - Warmy Breeze", "en_female_f08_warmy_breeze"},
    {"歌唱 - Glorious", "en_female_ht_f08_glorious"},
    {"歌唱 - It Goes Up", "en_male_sing_funny_it_goes_up"},
    {"歌唱 - 花栗鼠", "en_male_m2_xhxs_m03_silly"},
    {"歌唱 - 戏剧性", "en_female_ht_f08_wonderful_world"}
}

Config.Pages = {}
Config.Pages.Cost = 0 -- 在 Pages 发帖的费用，设为 false/0 以禁用
Config.Pages.RateLimit = 0 -- 再次在 Pages 发帖前需等待的分钟数，设为 false/0 以禁用。始终启用 10 秒 1 帖的限制以防止刷屏
Config.Pages.MaxPosts = 10 -- 玩家在 Pages 上最多可拥有的帖子数，设为 false 以禁用
Config.Pages.DeleteOld = false -- 超过 X 小时的帖子将自动删除。设为 false 以禁用，或设为数字以启用（例如 7 * 24 表示删除超过 1 周的帖子）

Config.Marketplace = {}
Config.Marketplace.Cost = 0 -- 在 Marketplace 发帖的费用，设为 false/0 以禁用
Config.Marketplace.RateLimit = 0 -- 再次在 Marketplace 发帖前需等待的分钟数，设为 false/0 以禁用。始终启用 10 秒 1 帖的限制以防止刷屏
Config.Marketplace.MaxPosts = 10 -- 玩家在 Marketplace 上最多可拥有的帖子数，设为 false 以禁用
Config.Marketplace.DeleteOld = false -- 超过 X 小时的帖子将自动删除。设为 false 以禁用，或设为数字以启用（例如 7 * 24 表示删除超过 1 周的帖子）

-- 可在 lb-phone/server/custom/functions/webrtc.lua 中自定义函数
-- 可在 lb-phone/server/apiKeys.lua 中设置 API 密钥
Config.DynamicWebRTC = {}
Config.DynamicWebRTC.Enabled = false -- 是否启用动态 WebRTC？（这将为每个用户生成新的 WebRTC 凭证）
Config.DynamicWebRTC.Service = "cloudflare" -- 默认支持：cloudflare
Config.DynamicWebRTC.RemoveStun = false -- 是否移除 STUN 服务器？

-- WebRTC 的 ICE 服务器（IG 直播、视频直播）。若不了解，请保持默认
-- 参见 https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection
-- Config.RTCConfig = {
--     iceServers = {
--         { urls = "stun:stun.l.google.com:19302" },
--     }
-- }

Config.Crypto = {}
Config.Crypto.Enabled = true
Config.Crypto.Refund = false --[[
    用于向持有旧版（真实世界）加密货币的用户退款的方式。
    可设为：
    - "invested" 退还其投资金额
    - "lastValue" 退还其加密货币持仓的最后已知价值
    - "convert" 转换为 "LB Coin"（lbc）
]]
Config.Crypto.UpdateInterval = 5 -- 加密货币价格多久更新一次？（分钟）
Config.Crypto.Coins = {
    ["lbc"] = {
        name = "LB 币",
        icon = "./assets/img/icons/crypto/coins/lbc.webp",
        initialValue = 50.0,
        changes = {
            {
                weight = 500,
                change = { 0.0, 2.0 } -- 0.0 - 2.0% 上涨
            },
            {
                weight = 490,
                change = { -2.0, -0.0 } -- 0.0 - 2.0% 下跌
            },
            {
                weight = 5,
                change = { 5.0, 15.0 }
            },
            {
                weight = 5,
                change = { -15.0, -5.0 }
            }
        },
        permissions = {
            buy = true,
            sell = true,
            transfer = true
        }
    }
}

Config.Crypto.QBit = true -- 是否支持 QBit？（需要 qb-crypto 和 qb-core）
Config.Crypto.Limits = {}
Config.Crypto.Limits.Buy = 1000000 -- 单次最大购买金额（$）
Config.Crypto.Limits.Sell = 1000000 -- 单次最大出售金额（$）

--[[ 浏览器应用选项 ]] --
Config.Browser = {}

Config.Browser.CX = "32dca7fc9f06341d2" -- 用于 Google 搜索的 CX ID。您可在 https://cse.google.com/cse/all 获取自己的 ID

Config.Browser.DefaultBookmarks = {
    -- {
    --     title = "LB",
    --     url = "https://lbscripts.com/",
    --     icon = "https://lbscripts.com/assets/favicon.ico"
    -- }
}

Config.Browser.WhitelistedDomains = {
    -- "lbscripts.com",
}

Config.Browser.BlacklistedDomains = {
    -- "example.com",
}

Config.KeyBinds = {
    -- 按键绑定列表：https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Open = { -- 切换手机
        Command = "phone",
        Bind = "F1",
        Description = "打开手机"
    },
    Focus = { -- 切换鼠标光标的按键绑定
        Command = "togglePhoneFocus",
        Bind = "LMENU",
        Description = "切换手机光标"
    },
    StopSounds = { -- 若声音出现异常，可使用此命令停止所有声音
        Command = "stopSounds",
        Bind = false,
        Description = "停止所有手机声音"
    },

    FlipCamera = {
        Command = "flipCam",
        Bind = "UP",
        Description = "翻转手机摄像头"
    },
    TakePhoto = {
        Command = "takePhoto",
        Bind = "RETURN",
        Description = "拍照/录像"
    },
    ToggleFlash = {
        Command = "toggleCameraFlash",
        Bind = "E",
        Description = "切换闪光灯"
    },
    LeftMode = {
        Command = "leftMode",
        Bind = "LEFT",
        Description = "切换模式"
    },
    RightMode = {
        Command = "rightMode",
        Bind = "RIGHT",
        Description = "切换模式"
    },
    RollLeft = {
        Command = "cameraRollLeft",
        Bind = "Z",
        Description = "向左旋转摄像头"
    },
    RollRight = {
        Command = "cameraRollRight",
        Bind = "C",
        Description = "向右旋转摄像头"
    },
    FreezeCamera = {
        Command = "cameraFreeze",
        Bind = "X",
        Description = "冻结摄像头"
    },

    AnswerCall = {
        Command = "answerCall",
        Bind = "RETURN",
        Description = "接听来电"
    },
    DeclineCall = {
        Command = "declineCall",
        Bind = "BACK",
        Description = "拒接来电"
    },
    UnlockPhone = {
        Bind = "SPACE",
        Description = "打开手机",
    },
}

Config.KeepInput = true -- NUI 获得焦点时是否保持输入（意味着您可以继续行走等）
Config.DisableFocusTalking = false -- 游戏内通话时是否禁用焦点键（默认 ALT）？可能修复 PTT 卡住（麦克风常开）的问题

--[[ 照片/视频选项 ]] --
Config.Camera = {}
Config.Camera.ShowTip = true -- 是否在相机左上角显示按键提示？
Config.Camera.Walkable = true -- 是否使用允许拍照时走动的自定义相机？
Config.Camera.Roll = true -- 是否允许向左/右旋转相机？
Config.Camera.AllowRunning = true
Config.Camera.MaxFOV = 70.0 -- 数值越大 = 视野越广（拉远）
Config.Camera.DefaultFOV = 60.0
Config.Camera.MinFOV = 10.0 -- 数值越小 = 视野越窄（拉近）
Config.Camera.MaxLookUp = 80.0
Config.Camera.MaxLookDown = -80.0

Config.Camera.Vehicle = {}
Config.Camera.Vehicle.Zoom = true -- 是否允许在载具中缩放？
Config.Camera.Vehicle.MaxFOV = 80.0
Config.Camera.Vehicle.DefaultFOV = 60.0
Config.Camera.Vehicle.MinFOV = 10.0
Config.Camera.Vehicle.MaxLookUp = 50.0
Config.Camera.Vehicle.MaxLookDown = -30.0
Config.Camera.Vehicle.MaxLeftRight = 120.0
Config.Camera.Vehicle.MinLeftRight = -120.0

Config.Camera.Selfie = {}
Config.Camera.Selfie.Offset = vector3(0.05, 0.55, 0.6)
Config.Camera.Selfie.Rotation = vector3(10.0, 0.0, -180.0)
Config.Camera.Selfie.MaxFov = 90.0
Config.Camera.Selfie.DefaultFov = 60.0
Config.Camera.Selfie.MinFov = 50.0

Config.Camera.Freeze = {}
Config.Camera.Freeze.Enabled = false -- 是否允许玩家在拍照时冻结相机？（这将允许以第三人称拍照）
Config.Camera.Freeze.MaxDistance = 10.0 -- 冻结时相机与玩家的最大距离
Config.Camera.Freeze.MaxTime = 60 -- 相机最长可冻结时间（秒）

-- 在 lb-phone/server/apiKeys.lua 中设置 API 密钥
Config.UploadMethod = {}
-- 可在 lb-phone/shared/upload.lua 中编辑上传方式
-- 默认且推荐的上传方式为 Fivemanage
-- 使用优惠码 "LBPHONE25" 可永久享受 25% 折扣
-- 您可在 https://refer.fivemanage.com/lb 获取 API 密钥
-- 联盟链接 - 通过此链接购买将为我们带来佣金，且不会增加您的额外费用
-- Fivemanage 设置视频教程：https://www.youtube.com/watch?v=y3bCaHS6Moc
-- 若需使用 S3/R2，可使用 "LBPresigned"：https://github.com/lbphone/lb-presigned
Config.UploadMethod.Video = "Fivemanage"
Config.UploadMethod.Image = "Fivemanage"
Config.UploadMethod.Audio = "Fivemanage"

Config.Video = {}
Config.Video.VariableBitrate = true
Config.Video.Bitrate = 2000 -- 视频比特率（kbps），提高可改善画质，但文件会更大
Config.Video.AudioBitrate = 128 -- 音频比特率（kbps），提高可改善音质，但文件会更大。录制音频文件时也使用此比特率
Config.Video.FrameRate = 24 -- 视频帧率（fps），24 fps 在画质与文件大小之间取得较好平衡，多数电影采用此帧率
Config.Video.MaxSize = 25 -- 视频最大大小（MB）
Config.Video.MaxDuration = 60 -- 视频最大时长（秒）

Config.Image = {}
Config.Image.Mime = "image/webp" -- 图片 MIME 类型，"image/webp" 或 "image/png" 或 "image/jpg"
Config.Image.Quality = 0.95
