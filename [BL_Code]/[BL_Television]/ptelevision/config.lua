Config = {}

Config.Models = { -- Any TV Models used on the map or in locations must be defined here.
    [`prop_tv_flat_01`] = {
        DefaultVolume = 0.8,
        Range = 12.0,
        Target = "tvscreen", -- Only use if prop has render-target name.
        Scale = 0.085, 
        Offset = vector3(-1.02, -0.055, 1.04)
    },
}

Config.Locations = { -- REMOVE ALL IF NOT USING ONESYNC, OR IT SHALL BREAK.
    {
        Model = `prop_tv_flat_01`,
        Position = vector4(359.4411, -1419.81, 32.511, 232.2 + 180.0),
    },
    {
        Model = `prop_tv_flat_01`,
        Position = vector4(456.6820, -1001.58, 32.026, 92.44 + 180.0),
    },
    -- {
    --     Model = `prop_tv_flat_01`,
    --     Position = vector4(312.25, -579.9, 44.47, 341.62),
    -- },
    -- {
    --     Model = `prop_tv_flat_01`,
    --     Position = vector4(426.68, -990.25, 31.56, 1.7),
    -- },
    -- {
    --     Model = `prop_tv_flat_01`, -- dam cưới--
    --     Position = vector4(-3083.32, 1442.81, 24.41, 322.06),
    -- },
}

Config.Channels = { -- These channels are default channels and cannot be overriden.
    {name = "Twitch", url = "twitch.tv/twitch"},
}

Config.BannedWords = {
    "google",
}

Config.Events = { -- Events for approving broadcasts / interactions (due to popular demand).
    ScreenInteract = function(source, data, key, value, cb) -- cb() to approve. 
        if value.url then 
            for i=1, #Config.BannedWords do 
                if string.find(value.url, Config.BannedWords[i]) then 
                    return
                end
            end
        end
        cb()
    end,    
    Broadcast = function(source, data, cb)  -- cb() to approve. 
        cb()
    end,
}
