local L0_1, L1_1, L2_1
interfaceLoaded = false
showChat = false
showSettings = false
isThemeDynamic = false
isDotsEnabled = true
isTyping = false
blockPauseFrames = 0
cachedSettings = nil
L0_1 = {}
registeredCommands = L0_1
lastTheme = nil
L0_1 = {}
typingPlayers = L0_1
L0_1 = {}
typingLastCoords = L0_1
L0_1 = {}
overheadMessages = L0_1
L0_1 = {}
overheadLastCoords = L0_1
L0_1 = RegisterNetEvent
L1_1 = "codem-supreme-chat:client:GetPlayerData"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "codem-supreme-chat:client:GetPlayerData"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = EnsureInterfaceLoaded
  L1_2()
  L1_2 = A0_2.settings
  cachedSettings = L1_2
  L1_2 = A0_2.settings
  L1_2 = L1_2.meDoTypingDots
  isDotsEnabled = L1_2
  L1_2 = A0_2.settings
  L1_2 = L1_2.theme
  L1_2 = "dynamic" == L1_2
  isThemeDynamic = L1_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "SET_PLAYERDATA"
  L2_2.payload = A0_2
  L1_2(L2_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "SET_THEME_COLORS"
  L3_2 = {}
  L4_2 = A0_2.settings
  L4_2 = L4_2.theme
  L3_2.theme = L4_2
  L4_2 = A0_2.settings
  L4_2 = L4_2.accentColor
  if not L4_2 then
    L4_2 = Config
    L4_2 = L4_2.Settings
    L4_2 = L4_2.accentColor
  end
  L3_2.accentColor = L4_2
  L4_2 = A0_2.settings
  L4_2 = L4_2.channelColors
  L3_2.channelColors = L4_2
  L2_2.payload = L3_2
  L1_2(L2_2)
  L1_2 = CaptureMugshot
  L1_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "codem-supreme-chat:client:OpenSettings"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "codem-supreme-chat:client:OpenSettings"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = EnsureInterfaceLoaded
  L0_2()
  L0_2 = showChat
  if L0_2 then
    showChat = false
    L0_2 = TriggerServerEvent
    L1_2 = "codem-supreme-chat:server:TypingIndicator"
    L2_2 = false
    L0_2(L1_2, L2_2)
  end
  isTyping = false
  L0_2 = SetNuiFocusKeepInput
  L1_2 = false
  L0_2(L1_2)
  showSettings = true
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "OPEN_SETTINGS"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "codem-supreme-chat:client:TypingIndicator"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "codem-supreme-chat:client:TypingIndicator"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = typingPlayers
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = nil
  end
  L2_2[A0_2] = L3_2
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "codem-supreme-chat:client:OverheadDisplay"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "codem-supreme-chat:client:OverheadDisplay"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = A0_2
  L3_2 = "_"
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  L2_2 = L2_2 .. L3_2 .. L4_2
  L3_2 = pairs
  L4_2 = overheadMessages
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.serverId
    if L9_2 == A0_2 then
      L9_2 = SendNUIMessage
      L10_2 = {}
      L10_2.action = "REMOVE_OVERHEAD_MESSAGE"
      L11_2 = {}
      L11_2.key = L7_2
      L10_2.payload = L11_2
      L9_2(L10_2)
      L9_2 = overheadMessages
      L9_2[L7_2] = nil
    end
  end
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "ADD_OVERHEAD_MESSAGE"
  L5_2 = {}
  L5_2.key = L2_2
  L6_2 = {}
  L7_2 = A1_2.channel
  L6_2.channel = L7_2
  L7_2 = A1_2.content
  L6_2.content = L7_2
  L5_2.data = L6_2
  L4_2.payload = L5_2
  L3_2(L4_2)
  L3_2 = overheadMessages
  L4_2 = {}
  L4_2.serverId = A0_2
  L5_2 = GetGameTimer
  L5_2 = L5_2()
  L5_2 = L5_2 + 10000
  L4_2.expires = L5_2
  L3_2[L2_2] = L4_2
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "onResourceStart"
function L2_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 1000
  L0_2(L1_2)
  L0_2 = TriggerServerEvent
  L1_2 = "codem-supreme-chat:server:GetPlayerData"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "QBCore:Client:OnGangUpdate"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "QBCore:Client:OnGangUpdate"
function L2_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = TriggerServerEvent
  L1_2 = "codem-supreme-chat:server:GetPlayerData"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "QBCore:Client:OnJobUpdate"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "QBCore:Client:OnJobUpdate"
function L2_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = TriggerServerEvent
  L1_2 = "codem-supreme-chat:server:GetPlayerData"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:addMessage"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "chat:addMessage"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = A0_2.content
    if L1_2 then
      L1_2 = tostring
      L2_2 = A0_2.content
      L1_2 = L1_2(L2_2)
      L2_2 = L1_2
      L1_2 = L1_2.gsub
      L3_2 = "%s+"
      L4_2 = ""
      L1_2 = L1_2(L2_2, L3_2, L4_2)
      if "" ~= L1_2 then
        goto lbl_16
      end
    end
  end
  do return end
  ::lbl_16::
  L1_2 = EnsureInterfaceLoaded
  L1_2()
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "NEW_MESSAGE"
  L2_2.payload = A0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "__cfx_internal:serverPrint"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "__cfx_internal:serverPrint"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = tostring
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = L1_2
    L1_2 = L1_2.gsub
    L3_2 = "%s+"
    L4_2 = ""
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    if "" ~= L1_2 then
      goto lbl_13
    end
  end
  do return end
  ::lbl_13::
  L1_2 = EnsureInterfaceLoaded
  L1_2()
  L1_2 = print
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = TriggerEvent
  L2_2 = "chat:addMessage"
  L3_2 = {}
  L3_2.channel = "server"
  L3_2.showChannelTag = true
  L3_2.content = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:addSuggestion"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "chat:addSuggestion"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = EnsureInterfaceLoaded
  L3_2()
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "ADD_SUGGESTION"
  L5_2 = {}
  L5_2.name = A0_2
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = ""
  end
  L5_2.help = L6_2
  L5_2.params = A2_2
  L4_2.payload = L5_2
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:addSuggestions"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "chat:addSuggestions"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = EnsureInterfaceLoaded
  L1_2()
  L1_2 = ipairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = SendNUIMessage
    L8_2 = {}
    L8_2.action = "ADD_SUGGESTION"
    L8_2.payload = L6_2
    L7_2(L8_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:removeSuggestion"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "chat:removeSuggestion"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = EnsureInterfaceLoaded
  L1_2()
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "REMOVE_SUGGESTION"
  L3_2 = {}
  L3_2.name = A0_2
  L2_2.payload = L3_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "codem-supreme-chat:client:SetRegisteredCommands"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "codem-supreme-chat:client:SetRegisteredCommands"
function L2_1(A0_2)
  local L1_2
  L1_2 = A0_2 or nil
  if not A0_2 then
    L1_2 = {}
  end
  registeredCommands = L1_2
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:clear"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "chat:clear"
function L2_1()
  local L0_2, L1_2
  L0_2 = EnsureInterfaceLoaded
  L0_2()
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "CLEAR_CHAT"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterCommand
L1_1 = "clear"
function L2_1()
  local L0_2, L1_2
  L0_2 = TriggerEvent
  L1_2 = "chat:clear"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = EnsureInterfaceLoaded
  L0_2()
  L0_2 = SetTextChatEnabled
  L1_2 = false
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = {}
  L1_2 = Config
  L1_2 = L1_2.EnableOOCCommand
  if not L1_2 then
    L0_2.ooc = true
  end
  L1_2 = Config
  L1_2 = L1_2.EnableMECommand
  if not L1_2 then
    L0_2.me = true
  end
  L1_2 = Config
  L1_2 = L1_2.EnableDOCommand
  if not L1_2 then
    L0_2["do"] = true
  end
  L1_2 = Config
  L1_2 = L1_2.EnablePMCommand
  if not L1_2 then
    L0_2.pm = true
  end
  L1_2 = Config
  L1_2 = L1_2.EnableServerCommand
  if not L1_2 then
    L0_2.server = true
  end
  L1_2 = Config
  L1_2 = L1_2.EnableDispatchCommand
  if not L1_2 then
    L0_2.dispatch = true
  end
  L1_2 = Config
  L1_2 = L1_2.EnableGangCommand
  if not L1_2 then
    L0_2.gang = true
  end
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = Config
  L3_2 = L3_2.Channels
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.id
    L8_2 = L0_2[L8_2]
    if not L8_2 then
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L1_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
    end
  end
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "SET_CHANNELS"
  L3_2.payload = L1_2
  L2_2(L3_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "SET_LOCALES"
  L4_2 = Config
  L4_2 = L4_2.Locales
  L5_2 = Config
  L5_2 = L5_2.Language
  L4_2 = L4_2[L5_2]
  L3_2.payload = L4_2
  L2_2(L3_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "SET_THEME_COLORS"
  L4_2 = {}
  L5_2 = Config
  L5_2 = L5_2.Settings
  L5_2 = L5_2.theme
  L4_2.theme = L5_2
  L5_2 = Config
  L5_2 = L5_2.Settings
  L5_2 = L5_2.accentColor
  L4_2.accentColor = L5_2
  L3_2.payload = L4_2
  L2_2(L3_2)
  L2_2 = Config
  L2_2 = L2_2.DispatchCommandSettings
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.DispatchCommandSettings
    L2_2 = L2_2.restrictTabToAllowedJobs
    if L2_2 then
      L2_2 = Config
      L2_2 = L2_2.DispatchCommandSettings
      L2_2 = L2_2.allowedJobs
      if L2_2 then
        L2_2 = {}
        L3_2 = pairs
        L4_2 = Config
        L4_2 = L4_2.DispatchCommandSettings
        L4_2 = L4_2.allowedJobs
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = table
          L9_2 = L9_2.insert
          L10_2 = L2_2
          L11_2 = L7_2
          L9_2(L10_2, L11_2)
        end
        L3_2 = SendNUIMessage
        L4_2 = {}
        L4_2.action = "SET_DISPATCH_ALLOWED_JOBS"
        L4_2.payload = L2_2
        L3_2(L4_2)
      end
    end
  end
  L2_2 = Config
  L2_2 = L2_2.GangCommandSettings
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.GangCommandSettings
    L2_2 = L2_2.restrictTabToAllowedJobs
    if L2_2 then
      L2_2 = Config
      L2_2 = L2_2.GangCommandSettings
      L2_2 = L2_2.allowedJobs
      if L2_2 then
        L2_2 = {}
        L3_2 = pairs
        L4_2 = Config
        L4_2 = L4_2.GangCommandSettings
        L4_2 = L4_2.allowedJobs
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = table
          L9_2 = L9_2.insert
          L10_2 = L2_2
          L11_2 = L7_2
          L9_2(L10_2, L11_2)
        end
        L3_2 = SendNUIMessage
        L4_2 = {}
        L4_2.action = "SET_GANG_ALLOWED_JOBS"
        L4_2.payload = L2_2
        L3_2(L4_2)
      end
    end
    L2_2 = Config
    L2_2 = L2_2.GangCommandSettings
    L2_2 = L2_2.restrictTabToAllowedGangs
    if L2_2 then
      L2_2 = Config
      L2_2 = L2_2.GangCommandSettings
      L2_2 = L2_2.allowedGangs
      if L2_2 then
        L2_2 = {}
        L3_2 = pairs
        L4_2 = Config
        L4_2 = L4_2.GangCommandSettings
        L4_2 = L4_2.allowedGangs
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = table
          L9_2 = L9_2.insert
          L10_2 = L2_2
          L11_2 = L7_2
          L9_2(L10_2, L11_2)
        end
        L3_2 = SendNUIMessage
        L4_2 = {}
        L4_2.action = "SET_GANG_ALLOWED_GANGS"
        L4_2.payload = L2_2
        L3_2(L4_2)
      end
    end
  end
  while true do
    L2_2 = 0
    L3_2 = showChat
    if not L3_2 then
      L3_2 = showSettings
      if not L3_2 then
        L3_2 = IsControlPressed
        L4_2 = 0
        L5_2 = 245
        L3_2 = L3_2(L4_2, L5_2)
        if L3_2 then
          showChat = true
          isTyping = true
          L3_2 = SetNuiFocus
          L4_2 = true
          L5_2 = true
          L3_2(L4_2, L5_2)
          L3_2 = SetNuiFocusKeepInput
          L4_2 = true
          L3_2(L4_2)
          L3_2 = SendNUIMessage
          L4_2 = {}
          L4_2.action = "OPEN_CHAT"
          L3_2(L4_2)
          L3_2 = TriggerServerEvent
          L4_2 = "codem-supreme-chat:server:TypingIndicator"
          L5_2 = true
          L3_2(L4_2, L5_2)
        end
      end
    end
    L3_2 = Citizen
    L3_2 = L3_2.Wait
    L4_2 = L2_2
    L3_2(L4_2)
  end
end
L0_1(L1_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = blockPauseFrames
    if L0_2 > 0 then
      L0_2 = DisableControlAction
      L1_2 = 0
      L2_2 = 199
      L3_2 = true
      L0_2(L1_2, L2_2, L3_2)
      L0_2 = DisableControlAction
      L1_2 = 0
      L2_2 = 200
      L3_2 = true
      L0_2(L1_2, L2_2, L3_2)
      L0_2 = blockPauseFrames
      L0_2 = L0_2 - 1
      blockPauseFrames = L0_2
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = 0
      L0_2(L1_2)
    else
      L0_2 = showChat
      if L0_2 then
        L0_2 = isTyping
        if L0_2 then
          L0_2 = DisableAllControlActions
          L1_2 = 0
          L0_2(L1_2)
          L0_2 = EnableControlAction
          L1_2 = 0
          L2_2 = 249
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = EnableControlAction
          L1_2 = 0
          L2_2 = 250
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
        else
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 1
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 2
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 24
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 25
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 37
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 44
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 45
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 47
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 58
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 140
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 141
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 142
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 143
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 199
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 200
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 245
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 257
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 322
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
        end
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 0
        L0_2(L1_2)
      else
        L0_2 = Citizen
        L0_2 = L0_2.Wait
        L1_2 = 500
        L0_2(L1_2)
      end
    end
  end
end
L0_1(L1_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  while true do
    L0_2 = 5000
    L1_2 = isThemeDynamic
    if L1_2 then
      L1_2 = GetClockHours
      L1_2 = L1_2()
      L2_2 = L1_2 < 6 or L1_2 > 18
      if L2_2 then
        L3_2 = "light"
        if L3_2 then
          goto lbl_19
        end
      end
      L3_2 = "dark"
      ::lbl_19::
      L4_2 = lastTheme
      if L3_2 ~= L4_2 then
        lastTheme = L3_2
        L4_2 = SendNUIMessage
        L5_2 = {}
        L5_2.action = "SET_RESOLVED_THEME"
        L5_2.payload = L3_2
        L4_2(L5_2)
        L4_2 = SendNUIMessage
        L5_2 = {}
        L5_2.action = "SET_THEME_COLORS"
        L6_2 = {}
        L6_2.theme = L3_2
        L5_2.payload = L6_2
        L4_2(L5_2)
        L4_2 = TriggerEvent
        L5_2 = "chat:addMessage"
        L6_2 = {}
        L6_2.channel = "server"
        L6_2.showChannelTag = true
        L7_2 = string
        L7_2 = L7_2.format
        L8_2 = Config
        L8_2 = L8_2.Locales
        L9_2 = Config
        L9_2 = L9_2.Language
        L8_2 = L8_2[L9_2]
        L8_2 = L8_2.NOTIFICATIONS
        L8_2 = L8_2.THEME_CHANGED
        L9_2 = L3_2
        L7_2 = L7_2(L8_2, L9_2)
        L6_2.content = L7_2
        L4_2(L5_2, L6_2)
      end
    else
      lastTheme = nil
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L0_1(L1_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  while true do
    L0_2 = 500
    L1_2 = isDotsEnabled
    if L1_2 then
      L1_2 = next
      L2_2 = typingPlayers
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = PlayerPedId
        L1_2 = L1_2()
        L2_2 = GetEntityCoords
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        L3_2 = false
        L4_2 = pairs
        L5_2 = typingPlayers
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          if L9_2 then
            L10_2 = GetPlayerFromServerId
            L11_2 = L8_2
            L10_2 = L10_2(L11_2)
            if -1 ~= L10_2 then
              L11_2 = GetPlayerPed
              L12_2 = L10_2
              L11_2 = L11_2(L12_2)
              L12_2 = GetEntityCoords
              L13_2 = L11_2
              L12_2 = L12_2(L13_2)
              L13_2 = L2_2 - L12_2
              L13_2 = #L13_2
              if L13_2 <= 5.0 then
                L14_2 = HasEntityClearLosToEntity
                L15_2 = L1_2
                L16_2 = L11_2
                L17_2 = 17
                L14_2 = L14_2(L15_2, L16_2, L17_2)
                if L14_2 then
                  L3_2 = true
                  L14_2 = math
                  L14_2 = L14_2.floor
                  L15_2 = GetGameTimer
                  L15_2 = L15_2()
                  L15_2 = L15_2 / 400
                  L14_2 = L14_2(L15_2)
                  L14_2 = L14_2 % 3
                  L14_2 = L14_2 + 1
                  L15_2 = DrawText3D
                  L16_2 = L1_2
                  L17_2 = L11_2
                  L18_2 = L12_2.x
                  L19_2 = L12_2.y
                  L20_2 = L12_2.z
                  L20_2 = L20_2 + 0.95
                  L21_2 = string
                  L21_2 = L21_2.rep
                  L22_2 = "."
                  L23_2 = L14_2
                  L21_2, L22_2, L23_2 = L21_2(L22_2, L23_2)
                  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                end
              end
            end
          end
        end
        if L3_2 then
          L4_2 = 0
          if L4_2 then
            goto lbl_80
            L0_2 = L4_2 or L0_2
          end
        end
        L0_2 = 500
      end
    end
    ::lbl_80::
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L0_1(L1_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  while true do
    L0_2 = 500
    L1_2 = Config
    L1_2 = L1_2.EnableMeDoFloatingMessage
    if L1_2 then
      L1_2 = next
      L2_2 = overheadMessages
      L1_2 = L1_2(L2_2)
      if L1_2 then
        L1_2 = PlayerPedId
        L1_2 = L1_2()
        L2_2 = GetEntityCoords
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        L3_2 = false
        L4_2 = pairs
        L5_2 = overheadMessages
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = GetGameTimer
          L10_2 = L10_2()
          L11_2 = L9_2.expires
          if L10_2 < L11_2 then
            L10_2 = GetPlayerFromServerId
            L11_2 = L9_2.serverId
            L10_2 = L10_2(L11_2)
            if nil == L10_2 then
              goto lbl_181
            end
            L11_2 = GetPlayerPed
            L12_2 = L10_2
            L11_2 = L11_2(L12_2)
            L12_2 = GetEntityCoords
            L13_2 = L11_2
            L12_2 = L12_2(L13_2)
            L13_2 = L2_2 - L12_2
            L13_2 = #L13_2
            if L13_2 <= 5.0 then
              L14_2 = HasEntityClearLosToEntity
              L15_2 = L1_2
              L16_2 = L11_2
              L17_2 = 17
              L14_2 = L14_2(L15_2, L16_2, L17_2)
              if L14_2 then
                L14_2 = Config
                L14_2 = L14_2.MeDoFloatingMessage
                if not L14_2 then
                  L14_2 = {}
                end
                L15_2 = L14_2.anchor
                if "head" == L15_2 then
                  L15_2 = "head"
                  if L15_2 then
                    goto lbl_62
                  end
                end
                L15_2 = "chest"
                ::lbl_62::
                if "head" == L15_2 then
                  L16_2 = 31086
                  if L16_2 then
                    goto lbl_68
                  end
                end
                L16_2 = 24818
                ::lbl_68::
                if "head" == L15_2 then
                  L17_2 = 0.35
                  if L17_2 then
                    goto lbl_74
                  end
                end
                L17_2 = 0.15
                ::lbl_74::
                L18_2 = L14_2.extraOffset
                if not L18_2 then
                  L18_2 = {}
                  L18_2.x = 0.0
                  L18_2.y = 0.0
                  L18_2.z = 0.0
                end
                L19_2 = GetPedBoneIndex
                L20_2 = L11_2
                L21_2 = L16_2
                L19_2 = L19_2(L20_2, L21_2)
                L20_2 = GetWorldPositionOfEntityBone
                L21_2 = L11_2
                L22_2 = L19_2
                L20_2 = L20_2(L21_2, L22_2)
                L21_2 = GetScreenCoordFromWorldCoord
                L22_2 = L20_2.x
                L23_2 = L18_2.x
                if not L23_2 then
                  L23_2 = 0.0
                end
                L22_2 = L22_2 + L23_2
                L23_2 = L20_2.y
                L24_2 = L18_2.y
                if not L24_2 then
                  L24_2 = 0.0
                end
                L23_2 = L23_2 + L24_2
                L24_2 = L20_2.z
                L24_2 = L24_2 + L17_2
                L25_2 = L18_2.z
                if not L25_2 then
                  L25_2 = 0.0
                end
                L24_2 = L24_2 + L25_2
                L21_2, L22_2, L23_2 = L21_2(L22_2, L23_2, L24_2)
                L24_2 = L22_2 * 100
                L25_2 = L23_2 * 100
                L26_2 = overheadLastCoords
                L26_2 = L26_2[L8_2]
                L3_2 = true
                L27_2 = overheadLastCoords
                L28_2 = {}
                L28_2.x = L24_2
                L28_2.y = L25_2
                L28_2.visible = true
                L27_2[L8_2] = L28_2
                L27_2 = SendNUIMessage
                L28_2 = {}
                L28_2.action = "UPDATE_OVERHEAD_MESSAGE"
                L29_2 = {}
                L29_2.key = L8_2
                L29_2.x = L24_2
                L29_2.y = L25_2
                L29_2.visible = L21_2
                L28_2.payload = L29_2
                L27_2(L28_2)
            end
            else
              L14_2 = overheadLastCoords
              L14_2 = L14_2[L8_2]
              if L14_2 then
                L14_2 = overheadLastCoords
                L14_2 = L14_2[L8_2]
                L14_2 = L14_2.visible
              end
              if L14_2 then
                L14_2 = {}
                L14_2.x = 0
                L14_2.y = 0
                L14_2.visible = false
                overheadLastCoords = L14_2
                L14_2 = SendNUIMessage
                L15_2 = {}
                L15_2.action = "UPDATE_OVERHEAD_MESSAGE"
                L16_2 = {}
                L16_2.key = L8_2
                L16_2.visible = false
                L15_2.payload = L16_2
                L14_2(L15_2)
              end
            end
          else
            L10_2 = SendNUIMessage
            L11_2 = {}
            L11_2.action = "REMOVE_OVERHEAD_MESSAGE"
            L12_2 = {}
            L12_2.key = L8_2
            L11_2.payload = L12_2
            L10_2(L11_2)
            L10_2 = overheadMessages
            L10_2[L8_2] = nil
            L10_2 = overheadLastCoords
            L10_2[L8_2] = nil
          end
          ::lbl_181::
        end
        if L3_2 then
          L4_2 = 0
          if L4_2 then
            goto lbl_190
            L0_2 = L4_2 or L0_2
          end
        end
        L0_2 = 500
      end
    end
    ::lbl_190::
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L0_1(L1_1)
function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Config
  L0_2 = L0_2.MaskAnonymity
  if L0_2 then
    L0_2 = Config
    L0_2 = L0_2.MaskAnonymity
    L0_2 = L0_2.enabled
    if L0_2 then
      goto lbl_12
    end
  end
  L0_2 = false
  do return L0_2 end
  ::lbl_12::
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = GetPedDrawableVariation
  L2_2 = L0_2
  L3_2 = 1
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = Config
  L2_2 = L2_2.MaskAnonymity
  L2_2 = L2_2.nonMaskProps
  L2_2 = L2_2[L1_2]
  L2_2 = -1 ~= L1_2 and 0 ~= L1_2 and L2_2
  return L2_2
end
IsWearingMask = L0_1
function L0_1()
  local L0_2, L1_2
  L0_2 = cachedSettings
  if not L0_2 then
    L0_2 = Config
    L0_2 = L0_2.Settings
  end
  return L0_2
end
GetSettings = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = {}
  L1_2 = Config
  L1_2 = L1_2.DispatchCommandSettings
  if L1_2 then
    L1_2 = Config
    L1_2 = L1_2.DispatchCommandSettings
    L1_2 = L1_2.restrictTabToAllowedJobs
    if L1_2 then
      L1_2 = Config
      L1_2 = L1_2.DispatchCommandSettings
      L1_2 = L1_2.allowedJobs
      if L1_2 then
        L1_2 = {}
        L0_2.dispatch = L1_2
        L1_2 = pairs
        L2_2 = Config
        L2_2 = L2_2.DispatchCommandSettings
        L2_2 = L2_2.allowedJobs
        L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
        for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
          L7_2 = table
          L7_2 = L7_2.insert
          L8_2 = L0_2.dispatch
          L9_2 = L5_2
          L7_2(L8_2, L9_2)
        end
      end
    end
  end
  L1_2 = Config
  L1_2 = L1_2.GangCommandSettings
  if L1_2 then
    L1_2 = {}
    L2_2 = {}
    L1_2.jobs = L2_2
    L2_2 = {}
    L1_2.gangs = L2_2
    L0_2.gang = L1_2
    L1_2 = Config
    L1_2 = L1_2.GangCommandSettings
    L1_2 = L1_2.restrictTabToAllowedJobs
    if L1_2 then
      L1_2 = Config
      L1_2 = L1_2.GangCommandSettings
      L1_2 = L1_2.allowedJobs
      if L1_2 then
        L1_2 = pairs
        L2_2 = Config
        L2_2 = L2_2.GangCommandSettings
        L2_2 = L2_2.allowedJobs
        L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
        for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
          L7_2 = table
          L7_2 = L7_2.insert
          L8_2 = L0_2.gang
          L8_2 = L8_2.jobs
          L9_2 = L5_2
          L7_2(L8_2, L9_2)
        end
      end
    end
    L1_2 = Config
    L1_2 = L1_2.GangCommandSettings
    L1_2 = L1_2.restrictTabToAllowedGangs
    if L1_2 then
      L1_2 = Config
      L1_2 = L1_2.GangCommandSettings
      L1_2 = L1_2.allowedGangs
      if L1_2 then
        L1_2 = pairs
        L2_2 = Config
        L2_2 = L2_2.GangCommandSettings
        L2_2 = L2_2.allowedGangs
        L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
        for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
          L7_2 = table
          L7_2 = L7_2.insert
          L8_2 = L0_2.gang
          L8_2 = L8_2.gangs
          L9_2 = L5_2
          L7_2(L8_2, L9_2)
        end
      end
    end
  end
  return L0_2
end
GetRestrictedChannels = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = cachedSettings
  if L1_2 then
    L1_2 = pairs
    L2_2 = A0_2
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = cachedSettings
      L7_2[L5_2] = L6_2
    end
  else
    cachedSettings = A0_2
  end
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "UPDATE_SETTINGS_FROM_HUD"
  L2_2.payload = A0_2
  L1_2(L2_2)
  L1_2 = A0_2.meDoTypingDots
  if nil ~= L1_2 then
    L1_2 = A0_2.meDoTypingDots
    isDotsEnabled = L1_2
  end
  L1_2 = A0_2.theme
  if nil ~= L1_2 then
    L1_2 = A0_2.theme
    L1_2 = "dynamic" == L1_2
    isThemeDynamic = L1_2
  end
  L1_2 = {}
  L2_2 = A0_2.theme
  if L2_2 then
    L2_2 = A0_2.theme
    L1_2.theme = L2_2
  end
  L2_2 = A0_2.accentColor
  if L2_2 then
    L2_2 = A0_2.accentColor
    L1_2.accentColor = L2_2
  end
  L2_2 = A0_2.channelColors
  if L2_2 then
    L2_2 = A0_2.channelColors
    L1_2.channelColors = L2_2
  end
  L2_2 = next
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = "SET_THEME_COLORS"
    L3_2.payload = L1_2
    L2_2(L3_2)
  end
end
UpdateSettings = L0_1