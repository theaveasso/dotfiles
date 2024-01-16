return {
	"vim-test/vim-test",
	config = function()
		local Map = require("utils").map

		vim.cmd([[
      function! BufferTermStrategy(cmd)
        exec 'te ' . a:cmd
      endfunction

      let g:test#custom_strategies = {"bufferterm": function("BufferTermStrategy")}
      let g:test#strategy = "bufferterm"
    ]])

		Map("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test nearest" })
		Map("n", "<leader>tf", ":TestFile<CR>", { desc = "Test file" })
		Map("n", "<leader>ts", ":TestSuite<CR>", { desc = "Test suite" })
		Map("n", "<leader>tl", ":TestLast<CR>", { desc = "Test last" })
	end,
}
