return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null = require("null-ls")
		null.setup({
			sources = {
				null.builtins.formatting.stylua,
        null.builtins.formatting.prettier,
        null.builtins.diagnostics.eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
