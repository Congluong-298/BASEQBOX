return {
    -- If false restrictedChannels restricts all decimals, if true you need to manually add each subchannel (100.01, 100.02 etc)
    whitelistSubChannels = false,
    
    ---@alias channelNumber number
    ---@type table<channelNumber, {jobName: boolean, jobName2: boolean}>
    restrictedChannels = {
        [1] = {
            police = true,
        },
        [2] = {
            police = true,
        },
        [3] = {
            police = true,
        },
        [4] = {
            police = true,
        },
        [5] = {
            police = true,
        },
        [6] = {
            police = true,
        },
        [7] = {
            police = true,
        },
        [8] = {
            police = true,
        },
        [9] = {
            police = true,
        },
        [10] = {
            ambulance = true
        }
    }
}
