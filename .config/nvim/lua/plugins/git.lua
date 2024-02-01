local Map = require("utils").map
return {
	{
		"kdheepak/lazygit.nvim",
		config = function()
			Map("n", "<leader>gg", "<cmd> LazyGit <CR>", { desc = "Open LazyGit" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

      Map("n", "<leader>gj", "<cmd> Gitsigns next_hunk <CR>", { desc = "Next git hunk" })
      Map("n", "<leader>gk", "<cmd> Gitsigns prev_hunk <CR>", { desc = "Previous git hunk" })
      Map("n", "<leader>gp", "<cmd> Gitsigns preview_hunk <CR>", { desc = "Preview git hunk" })
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			Map("n", "<leader>gs", "<cmd> Git <CR>", { desc = "Git status" })
			Map("n", "<leader>ga", "<cmd> Git add <CR>", { desc = "Git add" })
			Map("n", "<leader>gc", "<cmd> Git commit <CR>", { desc = "Git commit" })
			Map("n", "<leader>gb", "<cmd> Git blame <CR>", { desc = "Git blame" })
			Map("n", "<leader>gd", "<cmd> Git diff <CR>", { desc = "Git diff" })
			Map("n", "<leader>gl", "<cmd> Git log <CR>", { desc = "Git log" })
		end,
	},
}
