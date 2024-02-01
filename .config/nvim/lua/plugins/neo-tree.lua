return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		config = function()
			local Map = require("utils").map

			local signs = {
				{ name = "DiagnosticSignError", text = " " },
				{ name = "DiagnosticSignWarn", text = " " },
				{ name = "DiagnosticSignInfo", text = " " },
				{ name = "DiagnosticSignHint", text = "󰌵 " },
			}
			for _, s in ipairs(signs) do
				vim.fn.sign_define(s.name, { text = s.text, texthl = s.name })
			end

			-- Mapping
			Map("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "NeoTree" })

			require("neo-tree").setup({
				sort_case_insensitive = true,
				filesystem = {
					follow_current_file = {
            enable = true,
          },
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},
			})
		end,
	},
}
