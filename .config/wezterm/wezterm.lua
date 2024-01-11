local wezterm = require("wezterm")
local actions = wezterm.action
local mux = wezterm.mux

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
    --- open config
    k.key_table(
      "CMD",
      ",",
      actions.SpawnCommandInNewTab({
        cwd = os.getenv("WEZTERM_CONFIG_DIR"),
        set_environment_variables = {
          TERM = "screen-256color",
        },
        args = {
          "/opt/homebrew/bin/nvim",
          os.getenv("WEZTERM_CONFIG_FILE"),
        },
      })
    ),

    --- pane
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
    k.key_table("CMD|SHIFT", "f", actions.ToggleFullScreen),
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

    --- tab 
    k.key_table("ALT|SHIFT", "t", actions.SpawnTab("CurrentPaneDomain")),
    k.key_table("CMD|SHIFT", "t", actions.ShowTabNavigator),
    k.key_table(
      "CMD|SHIFT",
      "R",
      actions.PromptInputLine({
        description = "Enter new name for tab",
        action = wezterm.action_callback(function(window, _, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      })
    ),

    -- Natural text editing
    k.key_table("CMD", "Backspace", actions.SendKey({ mods = "CTRL", key = "u" })),
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

  debug_key_events = true,
}

wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
