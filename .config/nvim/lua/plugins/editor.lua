-- ╭──────────────────────────────────────────────────────────╮
-- │ Editor Plugins                                           │
-- ╰──────────────────────────────────────────────────────────╯

return {
  {
    "folke/flash.nvim",
    config = function()
      local flash = require("flash")
      flash.setup()
      local Map = require("utils").map
      Map({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
      Map({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter" })
      Map({ "n", "x", "o" }, "R", flash.treesitter_search, { desc = "Treesitter Search" })
      Map({ "o" }, "r", flash.remote, { desc = "Remote Flash" })
      Map({ "c" }, "<c-s>", flash.toggle, { desc = "Toggle Flash Search" })
    end,
  },
  {
    'echasnovski/mini.hipatterns',
    version = '*',
    config = function()
      require('mini.hipatterns').setup()
    end
  },
}
