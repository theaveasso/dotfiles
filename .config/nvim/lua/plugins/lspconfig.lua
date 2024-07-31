return {
  {
    "gleam-lang/gleam.vim",
    ft = { "gleam" },
    config = function()
    end,
  },
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
          "gopls",
          "docker_compose_language_service",
          "yamlls",
          "rust_analyzer",
          "lua_ls",
          "tsserver",
          "tflint",
          "terraformls",
          "taplo",
          "zls"
          -- "htmx",
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
      local util = lspconfig.util

      local Map = require("utils").map
      local Merge = require("utils").merge

      local opts = { noremap = true, silent = true }
      local on_attach = function(_, bufnr)
        opts.buffer = bufnr

        Map("n", "<leader>lr", "<cmd>LspRestart<CR>", Merge(opts, { desc = "Restart LSP server" }))
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
        "sqls",
        "tsserver",
        "tflint",
        "sqlls",
        "terraformls",
        "taplo",
        "htmx",
        -- "gleam",
        "zls",
        "bashls",
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
        root_dir = util.root_pattern("docker-compose.yaml"),
        single_file_support = true,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        single_file_support = true,
      })

      lspconfig.templ.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "templ", "lsp" },
        filetypes = { "templ" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      })

      lspconfig.gleam.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "gleam", "lsp" },
        filetypes = { "gleam" },
        root_dir = util.root_pattern("gleam.toml", ".git"),
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        root_dir = util.root_pattern(
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac",
          ".git"
        ),
        single_file_support = true,
      })
    end,
  },
}
