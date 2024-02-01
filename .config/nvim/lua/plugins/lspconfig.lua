return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"tflint",
					"terraformls",
					"elixirls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local Map = require("utils").map
			local Merge = require("utils").merge

			local opts = { noremap = true, silent = true }
			local on_attach = function(_, bufnr)
				opts.buffer = bufnr

				Map("n", "K", vim.lsp.buf.hover, Merge(opts, { desc = "Show hover information" }))
				Map("n", "gi", vim.lsp.buf.implementation, Merge(opts, { desc = "Go to implementation" }))
				Map("n", "gd", vim.lsp.buf.definition, Merge(opts, { desc = "Go to definition" }))
				Map("n", "gD", vim.lsp.buf.declaration, Merge(opts, { desc = "Go to declaration" }))
				Map("n", "gr", vim.lsp.buf.references, Merge(opts, { desc = "Show references" }))
				Map("n", "<leader>rn", vim.lsp.buf.rename, Merge(opts, { desc = "Rename symbol" }))
				Map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, Merge(opts, { desc = "Code actions" }))
				Map("n", "<leader>e", vim.diagnostic.open_float, Merge(opts, { desc = "Open diagnostic float window" }))
				Map("n", "[d", vim.diagnostic.goto_prev, Merge(opts, { desc = "Go to previous diagnostic" }))
				Map("n", "]d", vim.diagnostic.goto_next, Merge(opts, { desc = "Go to next diagnostic" }))
				Map(
					"n",
					"<leader>q",
					vim.diagnostic.setloclist,
					Merge(opts, { desc = "Set location list with diagnostics" })
				)
			end

			local clients = {
				"docker_compose_language_service",
				"yamlls",
				"rust_analyzer",
				"lua_ls",
				"tsserver",
				"tflint",
				"terraformls",
        "taplo"
			}
			for _, lsp in ipairs(clients) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end

			lspconfig.elixirls.setup({
				cmd = { "elixir-ls" },
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					elixirLS = {
						dialyzerEnabled = true,
						fetchDeps = false,
						enableTestLenses = false,
						suggestSpecs = false,
					},
				},
			})

			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "docker-compose-langserver", "--stdio" },
        filetypes = { "yaml.docker-compose" },
        root_dir = lspconfig.util.root_pattern("docker-compose.yaml"),
        single_file_support = true
			})
		end,
	},
}
