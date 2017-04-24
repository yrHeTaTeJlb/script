ControllerType = {}
--------------------------------------------------------------------------------
local selectArena      = 1
local makeTeam         = 2
local selectEnemy      = 3
local battleStatistics = 4
local sortTeam         = 5
local battle           = 6
local rewards          = 7
local stages           = 8
--------------------------------------------------------------------------------
local match = function(screens, index)
  local screen = screens[index]

  if screen.screen:match() then
    return screen
  end

  if index ~= battle then
    screen = screens[battle]
    if screen.screen:match() then
      return screen
    end
  end
end
--------------------------------------------------------------------------------
local findScreenHelper = function(screens, from, to)
  for i = from, to do
    local screen = match(screens, i)
    if screen then
      return screen
    end
  end
end
--------------------------------------------------------------------------------
function ControllerType:findScreen(hint)
  local length = #self.screens

  local screen = findScreenHelper(self.screens, hint, length)
  if not screen then
    screen = findScreenHelper(self.screens, 1, hint - 1)
  end

  if screen then
    return screen.screen, screen.hint
  else
    return nil, 1
  end
end
--------------------------------------------------------------------------------
function ControllerType:start()
  local screen = nil
  local hint = selectArena
  local isFirstFail = true

  while true do
    screen, hint = self:findScreen(hint)
    if screen then 
      screen:handle()
      isFirstFail = true
    else
      toast("Где я?")
      if not isFirstFail then
        back()
      end
      isFirstFail = false
    end
  end
end
--------------------------------------------------------------------------------
function ControllerType:new(arena, enemy, auto)
  local screens = {}

  screens[selectArena]      = {screen = SelectArenaScreen(arena),  hint = makeTeam}
  screens[makeTeam]         = {screen = MakeTeamScreen(),          hint = selectEnemy}
  screens[selectEnemy]      = {screen = SelectEnemyScreen(enemy),  hint = sortTeam}
  screens[battleStatistics] = {screen = BattleStatisticsScreen(),  hint = sortTeam}
  screens[sortTeam]         = {screen = SortTeamScreen(),          hint = battle}
  screens[battle]           = {screen = BattleScreen(auto),        hint = battleStatistics}
  screens[rewards]          = {screen = RewardsScreen(),           hint = stages}
  screens[stages]           = {screen = StagesScreen(),            hint = selectArena}

  local object = {screens = screens}
  self.__index = self
  return setmetatable(object, self) 
end
--------------------------------------------------------------------------------
Controller = function(arena, enemy, auto)
  return ControllerType:new(arena, enemy, auto)
end
--------------------------------------------------------------------------------
