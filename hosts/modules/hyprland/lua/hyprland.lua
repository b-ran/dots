local function try_require(name)
  if package.searchpath(name, package.path) then
    require(name)
  end
end

try_require("monitors")

require("autostart")
require("binds")
require("env")
require("gestures")
require("variables")
require("window")
