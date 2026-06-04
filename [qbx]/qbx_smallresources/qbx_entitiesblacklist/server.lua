local config = require 'qbx_entitiesblacklist.config'
local bucketLockDownMode = GetConvar('qbx:bucketlockdownmode', 'relaxed')

if bucketLockDownMode == 'inactive' or table.type(config.blacklisted) == 'empty' then return end


AddEventHandler('entityCreating', function(handle)
    local entityModel = GetEntityModel(handle)

    if config.blacklisted[entityModel] then
        CancelEvent()
    end
end)
