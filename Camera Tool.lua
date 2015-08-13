local ReadFloat, WriteFloat, GameHeroes = Memory.ReadFloat, Memory.WriteFloat, Game.Heroes

function OnGameStart()
  dwAddress = ReadMultiPtr(Utility.GetModule("League of Legends.exe").base, 0x02D54740, 0xC, 0x680, 0x00, 0xC4) + 0x120
  Callback.Bind("Draw", OnDraw)

  print("Jorj's Camera Tool Loaded!")
end

function ReadMultiPtr(dwBaseAddr, ...)
  local args = { ... }

  local dwReturn = Memory.ReadDword(dwBaseAddr + args[1])
  table.remove(args, 1)

  if args[2] then
    for _, offset in pairs(args) do
      dwReturn = Memory.ReadDword(dwReturn + offset)
    end
  end

  return dwReturn
end

function OnDraw()
  local centerPos = { x = (myHero.x + mousePos.x) / 2, y = (myHero.z + mousePos.z) / 2 }
  local cameraPos = { x = ReadFloat(dwAddress + 0x00), y = ReadFloat(dwAddress + 0x08) }
  local curZoom_sqr = ReadFloat(dwAddress + 0x120) ^ 2

  for _, hero in pairs(GameHeroes()) do
    if hero.visible and not hero.dead and hero.team ~= myHero.team then
      if (hero.x - myHero.x) ^ 2 + (hero.z - myHero.z) ^ 2 < curZoom_sqr / 2 then
        centerPos.x = (centerPos.x + hero.x) / 2
        centerPos.y = (centerPos.y + hero.z) / 2
      end
    end
  end

  WriteFloat(dwAddress + 0x00, cameraPos.x + (centerPos.x - cameraPos.x) / 50)
  WriteFloat(dwAddress + 0x08, cameraPos.y + (centerPos.y - cameraPos.y) / 50)
end

Callback.Bind("GameStart", OnGameStart)
