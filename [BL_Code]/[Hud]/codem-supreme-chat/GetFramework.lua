local L0_1, L1_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L0_2 = Config
  L0_2 = L0_2.Framework
  if "standalone" == L0_2 then
    L0_2 = Config
    L0_2 = L0_2.Debug
    if L0_2 then
      L0_2 = print
      L1_2 = "^3[ DEBUG ]:^0 Running in standalone mode."
      L0_2(L1_2)
    end
    L0_2 = {}
    return L0_2
  end
  L0_2 = nil
  L1_2 = 3
  L2_2 = 500
  L3_2 = {}
  function L4_2()
    local L0_3, L1_3
    L0_3 = exports
    L0_3 = L0_3.es_extended
    L1_3 = L0_3
    L0_3 = L0_3.getSharedObject
    return L0_3(L1_3)
  end
  L3_2.newesx = L4_2
  function L4_2()
    local L0_3, L1_3, L2_3
    L0_3 = TriggerEvent
    L1_3 = "esx:getSharedObject"
    function L2_3(A0_4)
      local L1_4
      L0_2 = A0_4
    end
    return L0_3(L1_3, L2_3)
  end
  L3_2.oldesx = L4_2
  function L4_2()
    local L0_3, L1_3
    L0_3 = exports
    L0_3 = L0_3["qb-core"]
    L1_3 = L0_3
    L0_3 = L0_3.GetCoreObject
    return L0_3(L1_3)
  end
  L3_2.newqb = L4_2
  function L4_2()
    local L0_3, L1_3, L2_3
    L0_3 = TriggerEvent
    L1_3 = "QBCore:GetObject"
    function L2_3(A0_4)
      local L1_4
      L0_2 = A0_4
    end
    return L0_3(L1_3, L2_3)
  end
  L3_2.oldqb = L4_2
  function L4_2()
    local L0_3, L1_3
    L0_3 = exports
    L0_3 = L0_3["qb-core"]
    L1_3 = L0_3
    L0_3 = L0_3.GetCoreObject
    return L0_3(L1_3)
  end
  L3_2.qbox = L4_2
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = type
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if "function" ~= L1_3 then
      L1_3 = nil
      return L1_3
    end
    L1_3 = pcall
    L2_3 = A0_3
    L1_3, L2_3 = L1_3(L2_3)
    if L1_3 and nil ~= L2_3 then
      return L2_3
    end
    L3_3 = L0_2
    if nil ~= L3_3 then
      L3_3 = L0_2
      return L3_3
    end
    L3_3 = nil
    return L3_3
  end
  L5_2 = Config
  L5_2 = L5_2.Framework
  if "autodetect" == L5_2 then
    L5_2 = pairs
    L6_2 = L3_2
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = 1
      L12_2 = L1_2
      L13_2 = 1
      for L14_2 = L11_2, L12_2, L13_2 do
        L15_2 = L4_2
        L16_2 = L10_2
        L15_2 = L15_2(L16_2)
        L0_2 = L15_2
        if L0_2 then
          L15_2 = Config
          L15_2.Framework = L9_2
          L15_2 = Config
          L15_2 = L15_2.Debug
          if L15_2 then
            L15_2 = print
            L16_2 = string
            L16_2 = L16_2.format
            L17_2 = "^3[ DEBUG ]:^0 Successfully detected framework: %s on attempt ^1%d^0."
            L18_2 = L9_2
            L19_2 = L14_2
            L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2, L18_2, L19_2)
            L15_2(L16_2, L17_2, L18_2, L19_2)
          end
          return L0_2
        else
          L15_2 = Config
          L15_2 = L15_2.Debug
          if L15_2 then
            L15_2 = print
            L16_2 = string
            L16_2 = L16_2.format
            L17_2 = "^3[ DEBUG ]:^0 Attempt ^1%d^0 failed for framework %s."
            L18_2 = L14_2
            L19_2 = L9_2
            L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2, L18_2, L19_2)
            L15_2(L16_2, L17_2, L18_2, L19_2)
          end
          L15_2 = Wait
          L16_2 = L2_2
          L15_2(L16_2)
        end
      end
    end
    L5_2 = Config
    L5_2 = L5_2.Debug
    if L5_2 then
      L5_2 = print
      L6_2 = string
      L6_2 = L6_2.format
      L7_2 = "^3[ DEBUG ]:^0 All attempts failed. No supported framework detected."
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L6_2(L7_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    end
    L5_2 = Config
    L5_2.Framework = "standalone"
    L5_2 = print
    L6_2 = "^3[ DEBUG ]:^0 No framework found. Falling back to standalone mode."
    L5_2(L6_2)
    L5_2 = {}
    return L5_2
  else
    L5_2 = Config
    L5_2 = L5_2.Framework
    L5_2 = L3_2[L5_2]
    if L5_2 then
      L5_2 = 1
      L6_2 = L1_2
      L7_2 = 1
      for L8_2 = L5_2, L6_2, L7_2 do
        L9_2 = L4_2
        L10_2 = Config
        L10_2 = L10_2.Framework
        L10_2 = L3_2[L10_2]
        L9_2 = L9_2(L10_2)
        L0_2 = L9_2
        if L0_2 then
          L9_2 = Config
          L9_2 = L9_2.Debug
          if L9_2 then
            L9_2 = print
            L10_2 = string
            L10_2 = L10_2.format
            L11_2 = "^3[ DEBUG ]:^0 Successfully initialized framework: %s on attempt ^1%d^0."
            L12_2 = Config
            L12_2 = L12_2.Framework
            L13_2 = L8_2
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L10_2(L11_2, L12_2, L13_2)
            L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
          end
          return L0_2
        else
          L9_2 = Config
          L9_2 = L9_2.Debug
          if L9_2 then
            L9_2 = print
            L10_2 = string
            L10_2 = L10_2.format
            L11_2 = "^3[ DEBUG ]:^0 Attempt ^1%d^0 failed for framework: %s."
            L12_2 = L8_2
            L13_2 = Config
            L13_2 = L13_2.Framework
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L10_2(L11_2, L12_2, L13_2)
            L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
          end
          L9_2 = Wait
          L10_2 = L2_2
          L9_2(L10_2)
        end
      end
    else
      L5_2 = Config
      L5_2 = L5_2.Debug
      if L5_2 then
        L5_2 = print
        L6_2 = string
        L6_2 = L6_2.format
        L7_2 = "^3[ DEBUG ]:^0 Unknown framework specified in Config.Framework: %s"
        L8_2 = Config
        L8_2 = L8_2.Framework
        L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L6_2(L7_2, L8_2)
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      end
    end
  end
  if not L0_2 then
    L5_2 = print
    L6_2 = "^3[ DEBUG ]:^0 Framework not found. Make sure you set Config.Framework correctly or install a supported framework."
    L5_2(L6_2)
  end
  return L0_2
end
GetFramework = L0_1
L0_1 = GetFramework
L0_1 = L0_1()
Core = L0_1