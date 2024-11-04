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
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<Esc>"] = actions.close,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
          file_ignore_patterns = {
            "node_modules",
            "external",
          },
        },
      })

      local Map = require("utils").map

      Map("n", "<C-p>", builtin.find_files, {})
      Map("n", "<leader>fw", builtin.live_grep, { desc = "Live grep" })
      Map("n", "<leader>f;", builtin.resume, { desc = "Resume last search" })
      Map("n", "<leader>fd", builtin.diagnostics, { desc = "Lists Diagnostics" })
      Map("n", "<leader>ft", builtin.treesitter, { desc = "Lists Function names, variables, etc." })
      Map("n", "<leader>fb", builtin.buffers, { desc = "Lists open buffers" })
    end,
  },
}
