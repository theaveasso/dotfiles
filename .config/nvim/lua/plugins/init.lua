return {
	-- surround
	{
		"tpope/vim-surround",
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
}
