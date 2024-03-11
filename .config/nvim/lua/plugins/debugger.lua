return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local Map   = require("utils").map

            Map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
            Map("n", "<leader>dus", function()
                local widgets = require("dap.ui.widgets")
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open()
            end, { desc = "Open debugging sidebar" })
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local dapgo = require("dap-go").setup()

            local Map   = require("utils").map

            Map("n", "<leader>dgt", function ()
                dapgo.debug_test()
            end, { desc = "Debug go test" })
            Map("n", "<leader>dgl", function()
                dapgo.debug_last()
            end, { desc = "Open debugging sidebar" })
        end

    }
}
