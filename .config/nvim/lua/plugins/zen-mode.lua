return {
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
        window = {
          width = 0.75,
          backdrop = 0.1,
        },
        options = {
          number = true
        },
        plugins = {
          wezterm = {
            enabled = true,
            font = "+2"
          }
        }
			})

      local Map = require("utils").map

      Map("n", "<leader>zz", "<cmd>ZenMode<CR>", { desc = "Zen Mode" })
		end,
	},
	{ "folke/twilight.nvim", config = true },
	-- { "folke/whitespace.nvim", config = true },
}
