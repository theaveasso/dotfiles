local wezterm = require("wezterm")
local actions = wezterm.action

local b = require("utils/background")
local w = require("utils/wallpaper")
local f = require("utils/font")
local k = require("utils/keys")

local config = {
  background = {
    w.get_wallpaper("/.dotfiles/wallpapers/*"),
    b.get_background(0.75),
  },

  font_size = 14,
  line_height = 1.2,
  font = f.get_font({
    "JetBrainsMono Nerd Font",
    "CommitMono",
    "Monaspace Argon",
    "Monaspace Krypton",
    "Monaspace Neon",
    "Monaspace Radon",
    "Monaspace Xenon",
  }),

  window_padding = {
    left = 30,
    right = 30,
    top = 20,
    bottom = 20,
  },

  keys = {
    -- split
    k.key_table("CTRL", "\\", actions.SplitHorizontal({ domain = "CurrentPaneDomain" })),
    k.key_table("CTRL", "-", actions.SplitVertical({ domain = "CurrentPaneDomain" })),
    k.key_table("CTRL", "x", actions.CloseCurrentPane({ confirm = true })),
    -- navigate
    k.key_table("CMD|CTRL", "h", actions.ActivatePaneDirection("Left")),
    k.key_table("CMD|CTRL", "l", actions.ActivatePaneDirection("Right")),
    k.key_table("CMD|CTRL", "k", actions.ActivatePaneDirection("Up")),
    k.key_table("CMD|CTRL", "j", actions.ActivatePaneDirection("Down")),
    -- resize
    k.key_table("CMD|SHIFT", "h", actions.AdjustPaneSize({ "Left", 5 })),
    k.key_table("CMD|SHIFT", "l", actions.AdjustPaneSize({ "Right", 5 })),
    k.key_table("CMD|SHIFT", "k", actions.AdjustPaneSize({ "Up", 5 })),
    k.key_table("CMD|SHIFT", "j", actions.AdjustPaneSize({ "Down", 5 })),
    -- refresh config
    k.key_table(
      "CMD",
      "s",
      actions.Multiple({
        actions.SendKey({ key = "\x1b" }),
        k.multiple_actions(":w"),
      })
    ),
  },

  enable_tab_bar = false,
  native_macos_fullscreen_mode = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.3,
  macos_window_background_blur = 20,

  enable_kitty_keyboard = true,
  enable_csi_u_key_encoding = false,
}

wezterm.on("user-var-changed", function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)

    if incremental ~= nil then
      while number_value > 0 do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end

      overrides.background = {
        b.get_background(0.9),
      }
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
    else
      overrides.background = nil
      overrides.font_size = number_value
    end
  end
  window:set_config_overrides(overrides)
end)

return config
