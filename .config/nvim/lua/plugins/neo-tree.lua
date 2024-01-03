return {
  { "nvim-neo-tree/neo-tree.nvim",
    branch="v3.x",
    dependencies=
    { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    config = function()
      vim.keymap.set("n", "<C-n>", "<cmd> Neotree toggle <CR>", {})

      local signs = {
        {name="DiagnosticSignError",text=" "},
        {name="DiagnosticSignWarn",text=" "},
        {name="DiagnosticSignInfo",text=" "},
        {name="DiagnosticSignHint",text="󰌵 "},
      }
      for _, s in ipairs(signs) do
        vim.fn.sign_define(s.name, {text=s.text, texthl=s.name})
      end

      require("neo-tree").setup({
        close_if_last_window=false
      })
    end
  }
}
