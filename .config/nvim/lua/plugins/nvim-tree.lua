return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local Map = require("utils").map

            -- Mapping
            Map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "NeoTree" })

            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                git = {
                    ignore = false,
                },
                diagnostics = {
                    enable = false,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = false
                },
                disable_netrw = true,
                hijack_netrw = true
            })
        end,
    },
}
