return {
  { "nvim-telescope/telescope.nvim", tag="0.1.5",
    dependencies=
    { "nvim-lua/plenary.nvim" },
    config=function()
      local builtin = require("telescope.builtin")
      local keymap = vim.keymap.set

      -- find
      keymap("n", "<C-p>", builtin.find_files, {})
      keymap("n", "<leader>fw", builtin.live_grep, {})

      -- git

    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config=function()
      require("telescope").setup({
        extensions={
          ["ui-select"]={
            require("telescope.themes").get_dropdown {}
          }
        },
        require("telescope").load_extension("ui-select")
      })
    end

  }
}
