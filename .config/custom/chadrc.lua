---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'everforest',
  statusline = {
    theme = "minimal"
  }
}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
