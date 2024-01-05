local wezterm = require("wezterm")
local  M  = {}

local appearance = wezterm.gui.get_appearance()

M.is_dark  = function()
  return appearance:find("dark")
end

M.get_random_entry = function(tbl)
  local keys = {}
  for k, _ in pairs(tbl) do
    table.insert(keys, k)
  end
  local random_key = keys[math.random(1, #keys)]
  return tbl[random_key]
end

return M
