local wezterm = require("wezterm")
local h = require("utils.helpers")
local M = {}

M.get_wallpaper = function()
	local wallpapers = {}
	local wallpapers_glob = os.getenv("HOME") .. "/.dotfiles/wallpapers/*"
	for _, v in ipairs(wezterm.glob(wallpapers_glob)) do
		if not string.match(v, "%.DS_Store$") then
			table.insert(wallpapers, v)
		end
	end
	local wallpaper = h.get_random_entry(wallpapers)
	return {
		source = { File = { path = wallpaper } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1.0,
	}
end

M.set_nvim_wallpaper = function(name) 
  return {
    source = { File = { path = os.getenv("HOME") .. "/.dotfiles/wallpapers/nvim/" .. name} },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1.0,
  }
end

return M
