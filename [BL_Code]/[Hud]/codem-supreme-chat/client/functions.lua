local L0_1, L1_1
function L0_1()
  local L0_2, L1_2
  while true do
    L0_2 = interfaceLoaded
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
end
EnsureInterfaceLoaded = L0_1
currentMugshot = nil
cachedMugshotPed = nil
cachedMugshotTxd = nil
function L0_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = PlayerPedId
    L0_3 = L0_3()
    L1_3 = cachedMugshotPed
    if L1_3 == L0_3 then
      L1_3 = currentMugshot
      if L1_3 then
        L1_3 = IsPedheadshotValid
        L2_3 = currentMugshot
        L1_3 = L1_3(L2_3)
        if L1_3 then
          L1_3 = IsPedheadshotReady
          L2_3 = currentMugshot
          L1_3 = L1_3(L2_3)
          if L1_3 then
            L1_3 = cachedMugshotTxd
            if L1_3 then
              L1_3 = SendNUIMessage
              L2_3 = {}
              L2_3.action = "SET_MUGSHOT"
              L3_3 = {}
              L4_3 = cachedMugshotTxd
              L3_3.txd = L4_3
              L2_3.payload = L3_3
              L1_3(L2_3)
              return
            end
          end
        end
      end
    end
    L1_3 = DoesEntityExist
    L2_3 = L0_3
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L1_3 = IsPedAPlayer
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      if L1_3 then
        goto lbl_44
      end
    end
    do return end
    ::lbl_44::
    L1_3 = currentMugshot
    if L1_3 then
      L1_3 = UnregisterPedheadshot
      L2_3 = currentMugshot
      L1_3(L2_3)
      currentMugshot = nil
      cachedMugshotTxd = nil
      cachedMugshotPed = nil
    end
    L1_3 = Wait
    L2_3 = 50
    L1_3(L2_3)
    L1_3 = RegisterPedheadshot
    L2_3 = L0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 or 0 == L1_3 then
      return
    end
    L2_3 = 0
    while true do
      L3_3 = IsPedheadshotReady
      L4_3 = L1_3
      L3_3 = L3_3(L4_3)
      if not (not L3_3 and L2_3 < 100) then
        break
      end
      L3_3 = Wait
      L4_3 = 50
      L3_3(L4_3)
      L2_3 = L2_3 + 1
    end
    L3_3 = IsPedheadshotReady
    L4_3 = L1_3
    L3_3 = L3_3(L4_3)
    if not L3_3 then
      L3_3 = UnregisterPedheadshot
      L4_3 = L1_3
      L3_3(L4_3)
      return
    end
    currentMugshot = L1_3
    cachedMugshotPed = L0_3
    L3_3 = GetPedheadshotTxdString
    L4_3 = L1_3
    L3_3 = L3_3(L4_3)
    cachedMugshotTxd = L3_3
    L3_3 = SendNUIMessage
    L4_3 = {}
    L4_3.action = "SET_MUGSHOT"
    L5_3 = {}
    L6_3 = cachedMugshotTxd
    L5_3.txd = L6_3
    L4_3.payload = L5_3
    L3_3(L4_3)
  end
  L0_2(L1_2)
end
CaptureMugshot = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L6_2 = World3dToScreen2d
  L7_2 = A2_2
  L8_2 = A3_2
  L9_2 = A4_2
  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2, L9_2)
  if L6_2 then
    L9_2 = SetTextScale
    L10_2 = Config
    L10_2 = L10_2.MeDoTypingDots
    L10_2 = L10_2.dotSize
    L11_2 = Config
    L11_2 = L11_2.MeDoTypingDots
    L11_2 = L11_2.dotSize
    L9_2(L10_2, L11_2)
    L9_2 = SetTextFont
    L10_2 = 4
    L9_2(L10_2)
    L9_2 = SetTextProportional
    L10_2 = 1
    L9_2(L10_2)
    L9_2 = SetTextColour
    L10_2 = Config
    L10_2 = L10_2.MeDoTypingDots
    L10_2 = L10_2.dotColor
    L10_2 = L10_2.r
    L11_2 = Config
    L11_2 = L11_2.MeDoTypingDots
    L11_2 = L11_2.dotColor
    L11_2 = L11_2.g
    L12_2 = Config
    L12_2 = L12_2.MeDoTypingDots
    L12_2 = L12_2.dotColor
    L12_2 = L12_2.b
    L13_2 = Config
    L13_2 = L13_2.MeDoTypingDots
    L13_2 = L13_2.dotColor
    L13_2 = L13_2.a
    L9_2(L10_2, L11_2, L12_2, L13_2)
    L9_2 = SetTextEntry
    L10_2 = "STRING"
    L9_2(L10_2)
    L9_2 = SetTextCentre
    L10_2 = true
    L9_2(L10_2)
    L9_2 = AddTextComponentString
    L10_2 = A5_2
    L9_2(L10_2)
    L9_2 = DrawText
    L10_2 = L7_2
    L11_2 = L8_2
    L9_2(L10_2, L11_2)
  end
end
DrawText3D = L0_1