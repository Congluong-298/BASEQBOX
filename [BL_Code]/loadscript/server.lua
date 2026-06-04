math.randomseed(os.time())  -- Khởi tạo seed cho random để cải thiện tính ngẫu nhiên

function GenerateToken()
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local token = "VNG:"
    
    for i = 1, 10 do
        local randomIndex = math.random(1, #chars)
        local randomChar = chars:sub(randomIndex, randomIndex)
        token = token .. randomChar
    end
    
    return token:upper()
end

-- Xử lý khi người chơi gia nhập
RegisterNetEvent("ox_load:server:playerJoined", function()
    local playerId = source 
    local newToken = GenerateToken()
    Player(playerId).state:set("token", newToken, true)
end)

-- Đăng ký sự kiện với kiểm tra token
local Events = {}
exports("RegisterNetEvent", function(eventName, eventFunc)
    if Events[eventName] then 
        RemoveEventHandler(Events[eventName])
    end

    Events[eventName] = RegisterNetEvent(eventName, function(Token, ...)
        local PlayerState = Player(source).state
        local PlayerToken = PlayerState.token
        if PlayerState.token ~= PlayerToken then 
            DropPlayer(source, "Này này làm gì đấy :)))")
            return
        end

        PlayerState:set("token", GenerateToken(source), true)
        return eventFunc(source, ...)
    end)
end)
