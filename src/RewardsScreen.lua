RewardsScreenType = {}
--------------------------------------------------------------------------------
local pattern = Pattern("RewardsScreen/pattern.png")
--------------------------------------------------------------------------------
function RewardsScreenType:match() 
  if exists(Region(510, 200, 130, 30), pattern) then
    return true
  else 
    return false
  end
end
--------------------------------------------------------------------------------
function RewardsScreenType:handle()
  click(Location(1000, 630))
end
--------------------------------------------------------------------------------
function RewardsScreenType:new()
  local object = {}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
RewardsScreen = function()
  return RewardsScreenType:new()
end
--------------------------------------------------------------------------------