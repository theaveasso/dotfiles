return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v2.x",
  dependencies = {
  cmd = "Neotree",
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>e",
      function ()
        require "neo-tree.command".execute({ toggle = true })
      end,
      desc = "Explorer Neotree",
    }
  }
}
