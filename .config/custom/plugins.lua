local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "sh", "zsh", "javascript", "typescript", "css", "html", "json", "yaml", "elixir"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- go
        "gopls",
        "golines",
        "gofumpt",
        "goimports-reviser",

        -- functional
        "elixir-ls",
        "ocaml-lsp",
        "ormolu",
        "haskell-language-server",

        -- lua
        "lua-language-server",

        -- web dev
        "html-lsp",
        "json-lsp",
        "angular-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",

        -- devops
        "tflint",
        "terraform-ls",
        "bash-language-server",

        -- formating linting
        "cspell",
        "beautysh",
        "prettierd",
        "shellcheck",
        "codespell",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",
        "go",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "json",

        -- other
        "ocaml",
        "elixir",
        "dockerfile",
        "regex",
        "sql",
        "terraform"
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "┊"
    }
  },
}
return plugins
