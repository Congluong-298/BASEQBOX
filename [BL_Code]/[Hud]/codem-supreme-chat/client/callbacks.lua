local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "INTERFACE_LOADED"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  interfaceLoaded = true
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "CLOSE_CHAT"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  showChat = false
  isTyping = false
  blockPauseFrames = 10
  L2_2 = SetNuiFocusKeepInput
  L3_2 = false
  L2_2(L3_2)
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = TriggerServerEvent
  L3_2 = "codem-supreme-chat:server:TypingIndicator"
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "INPUT_FOCUSED"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.focused
  isTyping = L2_2
  L2_2 = showChat
  if L2_2 then
    L2_2 = SetNuiFocusKeepInput
    L3_2 = A0_2.focused
    L3_2 = not L3_2
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "CLOSE_SETTINGS"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  showSettings = false
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "SET_ME_DO_TYPING_DOTS"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.value
  isDotsEnabled = L2_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "SET_THEME"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.value
  if "dynamic" == L2_2 then
    L2_2 = true
    if L2_2 then
      goto lbl_8
    end
  end
  L2_2 = false
  ::lbl_8::
  isThemeDynamic = L2_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "SET_THEME_COLORS"
  L4_2 = {}
  L5_2 = A0_2.value
  L4_2.theme = L5_2
  L3_2.payload = L4_2
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "SET_ACCENT_COLOR"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.color
  if L2_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = "SET_THEME_COLORS"
    L4_2 = {}
    L5_2 = A0_2.color
    L4_2.accentColor = L5_2
    L3_2.payload = L4_2
    L2_2(L3_2)
    L2_2 = cachedSettings
    if L2_2 then
      L2_2 = cachedSettings
      L3_2 = A0_2.color
      L2_2.accentColor = L3_2
    end
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "SAVE_SETTINGS"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = cachedSettings
  if L2_2 then
    L2_2 = pairs
    L3_2 = A0_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = cachedSettings
      L8_2[L6_2] = L7_2
    end
  else
    cachedSettings = A0_2
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "HANDLE_INPUT"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = tostring
  L3_2 = A0_2.raw
  if not L3_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.gsub
  L4_2 = "^%s+"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L2_2
  L2_2 = L2_2.gsub
  L4_2 = "^%+$"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = A0_2.channel
  L4_2 = TriggerServerEvent
  L5_2 = "codem-supreme-chat:server:UpdateMaskState"
  L6_2 = IsWearingMask
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2()
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L4_2 = Citizen
  L4_2 = L4_2.Wait
  L5_2 = 50
  L4_2(L5_2)
  L5_2 = L2_2
  L4_2 = L2_2.sub
  L6_2 = 1
  L7_2 = 1
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if "/" == L4_2 then
    L5_2 = L2_2
    L4_2 = L2_2.sub
    L6_2 = 2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = L4_2
    L4_2 = L4_2.match
    L6_2 = "^(%S+)%s*(.*)$"
    L4_2, L5_2 = L4_2(L5_2, L6_2)
    if L4_2 and "" ~= L4_2 then
      L6_2 = ExecuteCommand
      L7_2 = L4_2
      if "" ~= L5_2 then
        L8_2 = " "
        L9_2 = L5_2
        L8_2 = L8_2 .. L9_2
        if L8_2 then
          goto lbl_51
        end
      end
      L8_2 = ""
      ::lbl_51::
      L7_2 = L7_2 .. L8_2
      L6_2(L7_2)
    else
      L6_2 = TriggerEvent
      L7_2 = "chat:addMessage"
      L8_2 = {}
      L8_2.channel = "server"
      L8_2.showChannelTag = true
      L9_2 = Config
      L9_2 = L9_2.Locales
      L10_2 = Config
      L10_2 = L10_2.Language
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.NOTIFICATIONS
      L9_2 = L9_2.INVALID_COMMAND
      L8_2.content = L9_2
      L6_2(L7_2, L8_2)
    end
  else
    L4_2 = #L2_2
    if L4_2 > 0 then
      L5_2 = L2_2
      L4_2 = L2_2.match
      L6_2 = "^(%S+)%s*(.*)$"
      L4_2, L5_2 = L4_2(L5_2, L6_2)
      if L4_2 then
        L6_2 = registeredCommands
        L8_2 = L4_2
        L7_2 = L4_2.lower
        L7_2 = L7_2(L8_2)
        L6_2 = L6_2[L7_2]
        if L6_2 then
          L6_2 = ExecuteCommand
          L8_2 = L4_2
          L7_2 = L4_2.lower
          L7_2 = L7_2(L8_2)
          if "" ~= L5_2 then
            L8_2 = " "
            L9_2 = L5_2
            L8_2 = L8_2 .. L9_2
            if L8_2 then
              goto lbl_95
            end
          end
          L8_2 = ""
          ::lbl_95::
          L7_2 = L7_2 .. L8_2
          L6_2(L7_2)
      end
      elseif L3_2 and "all" ~= L3_2 and "history" ~= L3_2 then
        L6_2 = {}
        L7_2 = Config
        L7_2 = L7_2.OOCCommandSettings
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.OOCCommandSettings
          L7_2 = L7_2.command
        end
        L6_2.ooc = L7_2
        L7_2 = Config
        L7_2 = L7_2.MECommandSettings
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.MECommandSettings
          L7_2 = L7_2.command
        end
        L6_2.me = L7_2
        L7_2 = Config
        L7_2 = L7_2.DOCommandSettings
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.DOCommandSettings
          L7_2 = L7_2.command
        end
        L6_2["do"] = L7_2
        L7_2 = Config
        L7_2 = L7_2.PMCommandSettings
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.PMCommandSettings
          L7_2 = L7_2.command
        end
        L6_2.pm = L7_2
        L7_2 = Config
        L7_2 = L7_2.DispatchCommandSettings
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.DispatchCommandSettings
          L7_2 = L7_2.command
        end
        L6_2.dispatch = L7_2
        L7_2 = Config
        L7_2 = L7_2.GangCommandSettings
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.GangCommandSettings
          L7_2 = L7_2.command
        end
        L6_2.gang = L7_2
        L7_2 = Config
        L7_2 = L7_2.ServerCommandSettings
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.ServerCommandSettings
          L7_2 = L7_2.command
        end
        L6_2.server = L7_2
        L7_2 = L6_2[L3_2]
        if L7_2 then
          L8_2 = ExecuteCommand
          L9_2 = L7_2
          L10_2 = " "
          L11_2 = L2_2
          L9_2 = L9_2 .. L10_2 .. L11_2
          L8_2(L9_2)
        end
      end
    end
  end
  L4_2 = A1_2
  L5_2 = "ok"
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)