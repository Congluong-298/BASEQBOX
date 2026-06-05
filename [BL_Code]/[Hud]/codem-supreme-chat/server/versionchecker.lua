if not Config.VersionChecker then return end

local CURRENT_VERSION = '1.2'
local VERSION_URL     = 'https://raw.githubusercontent.com/Negativ-FiveM/codem-supreme-chat/main/version.txt'

CreateThread(function()
    Wait(3000)
    PerformHttpRequest(VERSION_URL, function(code, body, headers)
        if code ~= 200 or not body then
            print('^3[ codem-supreme-chat ]^0 Could not check for updates (HTTP ' .. tostring(code) .. ').')
            return
        end
        local latest = body:gsub('%s+', '')
        if latest ~= CURRENT_VERSION then
            print('^3[ codem-supreme-chat ]^0 A new version is available: ^2' .. latest .. '^0 (current: ^1' .. CURRENT_VERSION .. '^0). Please update!')
        else
            print('^2[ codem-supreme-chat ]^0 You are running the latest version (' .. CURRENT_VERSION .. ').')
        end
    end, 'GET', '', {})
end)