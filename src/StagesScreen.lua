StagesScreenType = {}
--------------------------------------------------------------------------------
local pattern = Pattern("StagesScreen/pattern.png")
--------------------------------------------------------------------------------
function StagesScreenType:match() 
  if exists(Region(245, 270, 30, 45), pattern) then
    return true
  else 
    return false
  end
end
--------------------------------------------------------------------------------
function StagesScreenType:handle()
  click(Location(1000, 630))
end
--------------------------------------------------------------------------------
function StagesScreenType:new()
  local object = {}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
StagesScreen = function()
  return StagesScreenType:new()
end
--------------------------------------------------------------------------------