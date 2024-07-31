return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null = require("null-ls")
        null.setup({
            sources = {
                null.builtins.formatting.stylua,
                null.builtins.formatting.prettier,
                null.builtins.formatting.gofumpt,
                null.builtins.formatting.golines,
                null.builtins.formatting.goimports_reviser,
                null.builtins.formatting.clang_format,
                -- null.builtins.diagnostics.eslint_d,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
