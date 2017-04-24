package.path = package.path .. ";" .. scriptPath() .. "?.lua"
--------------------------------------------------------------------------------
local pidFileName = scriptPath() .. ".pid"
--------------------------------------------------------------------------------
click = function(location)
  --Region(location.x - 5, location.y - 5, 10, 10):highlight(0.1)
  doubleClick(location)
end
--------------------------------------------------------------------------------
exists = function(region, pattern)
  region:highlight(0.1)
  return region:exists(pattern)
end
--------------------------------------------------------------------------------
exec = function(command)
  os.execute("su -c \"(" .. command .. ") & echo \\$!\" > " .. pidFileName)
  local pidFile = io.open(pidFileName)
  local pid = pidFile:read("*a")
  pidFile:close()
  return pid
end
--------------------------------------------------------------------------------
kill = function(pid)
  os.execute("su -c \"kill -9 " .. pid .. "\"")
end
--------------------------------------------------------------------------------
back = function()
  keyevent(4)
end
--------------------------------------------------------------------------------
setContinueClickTiming(10, 10)
setDragDropTiming(10, 10)
setDragDropStepCount(10)
setDragDropStepInterval(1)
--------------------------------------------------------------------------------
dialogInit()
addTextView("Номер арены")
addEditNumber("arena", 3)
newRow()
addTextView("Противник     ")
addSpinnerIndex("enemy", {"1", "2", "3"}, 1)
newRow()
addTextView("Автобой          ")
addCheckBox("auto", "", true)
dialogShow("Параметры скрипта")
--------------------------------------------------------------------------------
local controller = Controller(arena, enemy, auto)
controller:start()
--------------------------------------------------------------------------------