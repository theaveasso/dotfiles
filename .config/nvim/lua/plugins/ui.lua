return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "folke/noice.nvim",
    config = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
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
