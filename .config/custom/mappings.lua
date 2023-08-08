local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ["jj"] = { "<Esc>", "Normal mode" },
  },

  n = {
    ["<C-q>"] = { "<cmd> q! <cr>", "Force quit" },
    ["|"] = { "<cmd> vsplit <cr>", "Vertical split" },
    ["_"] = { "<cmd> split <cr>", "Horizontal split" },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>pd"] = {
      function()
        vim.diagnostic.goto_prev({ float = { border = "rounded" }})
      end,
      "Goto prev diagnostic",
    },

    ["<leader>nd"] = {
      function()
        vim.diagnostic.goto_next({ float = { border = "rounded" }})
      end,
      "Goto next diagnostic",
    },

    ["<S-f>"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  }
}

return M
