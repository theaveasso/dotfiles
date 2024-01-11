return {
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
  { "folke/twilight.nvim", config = true },
  -- { "folke/whitespace.nvim", config = true },
}
