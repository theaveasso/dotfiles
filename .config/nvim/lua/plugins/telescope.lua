return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-media-files.nvim"
        },
        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    path_display = { "truncate" },
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
                extensions = {
                    media_files = {
                        filetypes = { "png", "webp", "jpg", "jpeg" },
                        find_cmd = "rg",
                    },
                },
            })

            local Map = require("utils").map

            Map("n", "<C-p>", builtin.find_files, {})
            Map("n", "<leader>fw", builtin.live_grep, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
                require("telescope").load_extension("ui-select"),
            })
        end,
    },
}
