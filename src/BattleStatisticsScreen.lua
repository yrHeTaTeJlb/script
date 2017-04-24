BattleStatisticsScreenType = {}
--------------------------------------------------------------------------------
local pattern = Pattern("BattleStatisticsScreen/pattern.png")
--------------------------------------------------------------------------------
function BattleStatisticsScreenType:match() 
  if exists(Region(505, 265, 145, 140), pattern) then
    return true
  else
    return false
  end
end
--------------------------------------------------------------------------------
function BattleStatisticsScreenType:handle()
  continueClick(850, 500, 10, 10, 30)
  wait(5)
end
--------------------------------------------------------------------------------
function BattleStatisticsScreenType:new()
  local object = {}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
BattleStatisticsScreen = function()
  return BattleStatisticsScreenType:new()
end