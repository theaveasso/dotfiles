return {
    'krivahtoo/silicon.nvim',
    build = './install.sh',
    cmd = "Silicon",
    config = function()
        local Map = require("utils").map

        Map("n", "<leader>ss", "<cmd>Silicon<CR>", { desc = "Silicon" })
        require("silicon").setup({
            font = "JetBrainsMono Nerd Font",
            line_number = true,
            watermark = {
                text = ' @theaveasso',
            },
        })
    end
}
