return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      local Map = require("utils").map

      Map("n", "<leader>a", function()
        harpoon:list():append()
      end)
      Map("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      Map("n", "<leader>1", function()
        harpoon:list():select(1)
      end)
      Map("n", "<leader>2", function()
        harpoon:list():select(2)
      end)
      Map("n", "<leader>3", function()
        harpoon:list():select(3)
      end)
      Map("n", "<leader>4", function()
        harpoon:list():select(4)
      end)
      Map("n", "<C-[>", function()
        harpoon:list():prev()
      end)
      Map("n", "<C-]>", function()
        harpoon:list():next()
      end)
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      local spectre = require("spectre")
      spectre.setup({
        result_padding = "",
        default = {
          replace = {
            cmd = "sed"
          }
        }
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
    config = function()


    end
  }
}
