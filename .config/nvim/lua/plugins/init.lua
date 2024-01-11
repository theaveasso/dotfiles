return {
	-- surround
	{
		"tpope/vim-surround",
	},
	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.keymap.set("n", "<leader>gg", "<cmd> LazyGit <CR>", { desc = "Open LazyGit" })
		end,
	},
	-- comment
	{
		"numToStr/Comment.nvim",
		event = "InsertEnter",
		opts = true,
	},
	-- autopair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = true,
	},
  {
    "lewis6991/gitsigns.nvim",
    config = function() 
      require("gitsigns").setup()
    end
  }
}
