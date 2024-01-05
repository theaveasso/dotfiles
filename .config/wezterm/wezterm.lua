local wezterm = require('wezterm')
local act = wezterm.action

local b = require("utils/background")
local w = require("utils/wallpaper")
local f = require("utils/font")
local k = require("utils/keys")

local config = {
  background = {
    w.get_wallpaper(),
    b.get_background(),
  },

  font_size = 16,
  font = f.get_font({ "JetBrainsMono Nerd Font" }),

  window_padding = {
    left = 30,
    right = 30,
    top = 20 ,
    bottom = 20
  },

  enable_tab_bar = false,
  native_macos_fullscreen_mode = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.3,
  macos_window_background_blur = 20,

  enable_kitty_keyboard = true,
  enable_csi_u_key_encoding = false
}

return config
