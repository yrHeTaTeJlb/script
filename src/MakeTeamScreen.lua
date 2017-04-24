MakeTeamScreenType = {}
--------------------------------------------------------------------------------
local closeInfoWindow = function()
  click(Location(100, 500))
  wait(0.25)
end
--------------------------------------------------------------------------------
local freeSlot = Pattern("MakeTeamScreen/freeSlot.png")
--------------------------------------------------------------------------------
local findFreeSlot = function()
  return exists(Region(125, 70, 100, 300), freeSlot)
end
--------------------------------------------------------------------------------
local cooldown = Pattern("MakeTeamScreen/cooldown.png")
--------------------------------------------------------------------------------
local isChampionReady = function()
  if exists(Region(280, 150, 70, 70), cooldown) then
    return false
  else
    return true
  end
end
--------------------------------------------------------------------------------
local needHelp = Pattern("MakeTeamScreen/needHelp.png")
--------------------------------------------------------------------------------
local helpRequest = function()
  closeInfoWindow()

  local match = exists(Region(280, 150, 70, 70), needHelp)
  if match then
    click(match)
    return true
  end

  return false
end
--------------------------------------------------------------------------------
local addChampoin = function(location)
  closeInfoWindow()

  if not isChampionReady() then
    return false
  end

  dragDrop(Location(380, 250), location)
  return true
end
--------------------------------------------------------------------------------
local makeTeam = function()
  while true do
    local slot = findFreeSlot()

    if not slot then
      return true
    end

    if not addChampoin(slot:getTarget()) then
      return false
    end
  end
end
--------------------------------------------------------------------------------
local pattern = Pattern("MakeTeamScreen/pattern.png")
--------------------------------------------------------------------------------
function MakeTeamScreenType:match() 
  if exists(Region(1075, 70, 75, 75), pattern) then
    return true
  else 
    return false
  end
end
--------------------------------------------------------------------------------
function MakeTeamScreenType:handle()
  while helpRequest() do
    wait(1)
  end

  local result
  
  if makeTeam() then
    click(Location(100, 600))
    result = false
  else
    back()
    result = true
  end 
  
  wait(3)
  return result
end
--------------------------------------------------------------------------------
function MakeTeamScreenType:new()
  local object = {}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
MakeTeamScreen = function()
  return MakeTeamScreenType:new()
end
--------------------------------------------------------------------------------