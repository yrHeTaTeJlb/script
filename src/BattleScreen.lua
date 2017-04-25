BattleScreenType = {}
--------------------------------------------------------------------------------
local pattern = Pattern("BattleScreen/pattern.png")
--------------------------------------------------------------------------------
function BattleScreenType:match() 
  if exists(Region(540, 0, 70, 70), pattern) then
    return true
  else 
    return false
  end
end
--------------------------------------------------------------------------------
function BattleScreenType:autoBattle()
  local pid = exec("." .. scriptPath() .. "src/battle.sh")
  repeat
  until not self:match()
  kill(pid)
end
--------------------------------------------------------------------------------
function BattleScreenType:manualBattle()
  while self:match() do
    wait(5)
  end
end
--------------------------------------------------------------------------------
function BattleScreenType:battle() 
  if self.auto then
    self:autoBattle()
  else
    self:manualBattle()
  end
end
--------------------------------------------------------------------------------
function BattleScreenType:handle()
  self:battle()
  wait(5)
end
--------------------------------------------------------------------------------
function BattleScreenType:new(auto)
  local object = {auto = auto}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
BattleScreen = function(auto)
  return BattleScreenType:new(auto)
end
--------------------------------------------------------------------------------
