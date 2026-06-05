-- Discord Webhook Configuration
-- Fill in your webhook URL to log chat messages to Discord

Config.Discord = {
    enabled = false,
    webhookURL = '', -- Paste your Discord webhook URL here

    -- Which channels to log
    logChannels = {
        ['all']      = true,
        ['ooc']      = true,
        ['me']       = true,
        ['do']       = true,
        ['pm']       = false,  -- Private messages are not logged by default
        ['server']   = true,
        ['dispatch'] = true,
        ['gang']     = false,
    },

    -- Embed colors per channel (decimal)
    embedColors = {
        ['all']      = 16777215,  -- white
        ['ooc']      = 4767476,   -- cyan
        ['me']       = 16729331,  -- pink
        ['do']       = 16751688,  -- orange
        ['server']   = 16777215,  -- white
        ['dispatch'] = 16729160,  -- red
        ['gang']     = 10878272,  -- orange-yellow
    },

    serverName  = 'Supreme RP',
    botName     = 'Supreme Chat',
    botAvatar   = '',  -- URL to a bot avatar image (optional)
}
