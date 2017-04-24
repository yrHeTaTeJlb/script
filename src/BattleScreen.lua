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
  repeat  
    stopLongClick()

    continueClick(850, 500, 10, 10, 200)

    longClick(Location(170, 600))
  until not self:match()
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
