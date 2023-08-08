local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local servers = { "tsserver", "jsonls", 'angularls', "bashls", "terraformls","tflint", "tailwindcss", "html",  }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.hls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"haskell-language-server-wrapper", "--lsp"},
  filetypes = {"haskell", "lhaskell"},
  root_dir = util.root_pattern("*.cabal", "package.yaml"),
  settings = {
    haskell = {
      cabalFormattingProvider = "cabalfmt",
      formattingProvider = "ormolu"
    }
  }
}

lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"elixir-ls"},
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  root_dir = util.root_pattern("mix.exs", ".git"),
}

lspconfig.ocamllsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"ocamllsp"},
  filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
  root_dir = util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace")
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
