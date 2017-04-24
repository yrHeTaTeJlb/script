SelectArenaScreenType = {}
--------------------------------------------------------------------------------
local mid = function(x, y)
  return math.max(x, y) - math.min(x, y)
end
--------------------------------------------------------------------------------
local center = function(start, finish)
  local x = mid(start.x, finish.x)
  local y = mid(start.y, finish.y)

  return Location(x, y)
end
--------------------------------------------------------------------------------
local swipe = function(start, finish)
  touchDown(start)
  touchMove(start)
  touchMove(center(start, finish))
  touchMove(finish)
  wait(0.5)
  touchUp(finish)
end
--------------------------------------------------------------------------------
local pattern = Pattern("SelectArenaScreen/pattern.png")
--------------------------------------------------------------------------------
function SelectArenaScreenType:match() 
  if exists(Region(270, 70, 335, 60), pattern) then
    return true
  else 
    return false
  end
end
--------------------------------------------------------------------------------
function SelectArenaScreenType:handle()
  local y = getRealScreenSize():getY() / 2
  click(Location(400, 100)) 

  if self.arena == 1 then
    click(Location(150, y)) 
  elseif self.arena == 2 then
    click(Location(450, y)) 
  else
    swipe(Location(390, y), Location(100, y))
    for i = 3, self.arena - 1 do
      swipe(Location(720, y), Location(100, y))
    end
    click(Location(780, y)) 
  end
end
--------------------------------------------------------------------------------
function SelectArenaScreenType:new(arena)
  local object = {arena = arena}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
SelectArenaScreen = function(arena)
  return SelectArenaScreenType:new(arena)
end
--------------------------------------------------------------------------------