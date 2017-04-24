SortTeamScreenType = {}
--------------------------------------------------------------------------------
local slot = Pattern("SortTeamScreen/slot.png")
--------------------------------------------------------------------------------
local isSorted = function()
  if exists(Region(410, 220, 50, 100), slot) then
    return false
  else
    return true
  end
end
--------------------------------------------------------------------------------
local pattern = Pattern("SortTeamScreen/pattern.png")
--------------------------------------------------------------------------------
local check = function() 
  if exists(Region(835, 280, 155, 100), pattern) then   
    return true
  else 
    return false
  end
end
--------------------------------------------------------------------------------
function SortTeamScreenType:match() 
  if check() then   
    wait(3)
    if check() then   
      return true
    end
  end

  return false
end
--------------------------------------------------------------------------------
function SortTeamScreenType:handle()
  if not isSorted() then
    click(Location(1000, 650))
    wait(1)
  end
  click(Location(1000, 650))
  wait(5)
end
--------------------------------------------------------------------------------
function SortTeamScreenType:new()
  local object = {}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
SortTeamScreen = function()
  return SortTeamScreenType:new()
end
--------------------------------------------------------------------------------
