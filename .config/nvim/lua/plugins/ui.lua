return {
  {
    "neanias/everforest-nvim",
    name = "everforest",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "folke/noice.nvim",
    config = function()
      local noice = require("noice")
      noice.setup({
      })
    end
  },
  {
    "folke/twilight.nvim",
    config = true
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 120,
          height = 1,
          backdrop = 0.95,
          options = {
            number = false,
          },
        },
        plugins = {
          wezterm = {
            enabled = true,
            font = "+2",
          },
        },
      })

      local Map = require("utils").map

      Map("n", "<leader>zz", "<cmd>ZenMode<CR>", { desc = "Zen Mode" })
    end,
  },
}
