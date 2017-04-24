SelectEnemyScreenType = {}
--------------------------------------------------------------------------------
local pattern = Pattern("SelectEnemyScreen/pattern.png")
--------------------------------------------------------------------------------
function SelectEnemyScreenType:match() 
  if exists(Region(770, 185, 75, 75), pattern) then
    return true
  else 
    return false
  end
end
--------------------------------------------------------------------------------
function SelectEnemyScreenType:handle()
  click(Location(700, 180 * self.enemy))
  click(Location(1000, 650))
  wait(1)
end
--------------------------------------------------------------------------------
function SelectEnemyScreenType:new(enemy)
  local object = {enemy = enemy}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
SelectEnemyScreen = function(enemy)
  return SelectEnemyScreenType:new(enemy)
end
--------------------------------------------------------------------------------