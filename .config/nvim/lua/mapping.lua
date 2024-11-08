vim.g.mapleader = " "
local keymap = vim.keymap.set


local mappings = {
  n = {
    ["<leader>term"] = { ":!", noremap = true, silent = true, desc = "Run current file" },
    ["<leader>rr"] = { ":!!<CR>", noremap = true, silent = true, desc = "Run current file" },
    ["<leader>tg"] = { ":!go leader -v ./...<CR>", noremap = true, silent = true, desc = "Run go leader" },

    -- file management
    ["<C-s>"] = { "<cmd>w<CR>", silent = true, desc = "Save file" },
    ["<C-q><C-q>"] = { "<cmd>cq<CR>", silent = true, desc = "Force Quit all" },
    ["<leader>so"] = { "<cmd>source %<CR>", silent = false, desc = "Source current file" },
    ["<leader>nh"] = { "<cmd>nohlsearch<CR>", silent = true, desc = "Clear Search highlight" },

    -- pane
    ["|"] = { "<cmd>vsplit<CR>", silent = true, desc = "Vertical split" },
    ["-"] = { "<cmd>split<CR>", silent = true, desc = "Horizontal split" },
    ["<leader>se"] = { "<C-w>", silent = true, desc = "Equalize windows" },
    ["<C-q>"] = { "<cmd>close<CR>", silent = true, desc = "Close window" },

    ["<C-h>"] = { "<C-w>h", silent = true, desc = "Window left" },
    ["<C-j>"] = { "<C-w>j", silent = true, desc = "Window down" },
    ["<C-k>"] = { "<C-w>k", silent = true, desc = "Window up" },
    ["<C-l>"] = { "<C-w>l", silent = true, desc = "Window right" },

    -- detail
    ["J"] = { "mzJ`z", silent = false, desc = "Move text down" },
    ["<C-d>"] = { "<C-d>zz", silent = false, desc = "Move text down" },
    ["<C-u>"] = { "<C-u>zz", silent = false, desc = "Move text up" },
    ["n"] = { "nzzzv", silent = false, desc = "Next search result" },
    ["N"] = { "Nzzzv", silent = false, desc = "Previous search result" },

    ["<Tab>"] = { "<cmd>bn<CR>", desc = "Next buffer" },
    ["<S-Tab>"] = { "<cmd>bp<CR>", desc = "Previous buffer" },
    ["<Esc>"] = { "<cmd>nohlsearch<CR>", desc = "Clear search highlight" },

    ["<C-;>"] = { "<cmd>vertical resize +5<CR>", desc = "Increase window width" },
    ["<C-'>"] = { "<cmd>vertical resize -5<CR>", desc = "Decrease window width" },

    -- spectre
    ["<leader>S"] = { "<cmd>lua require('spectre').toggle()<CR>", desc = "Open Spectre" },
    ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "Search current word" },
    ["<leader>sf"] = { "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", desc = "Search on file" },
  },
  i = {
    ["jj"] = { "<Esc>", silent = false, desc = "Insert mode - Escape" },
  },
  v = {
    -- text
    ["J"] = { ":m '>+1<CR>gv=gv", silent = false, desc = "Move text down" },
    ["K"] = { ":m '<-2<CR>gv=gv", silent = false, desc = "Move text up" },

    -- spectre
    ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual()<CR>", desc = "Search current word" },
  },
}

for mode, mode_mappings in pairs(mappings) do
  for key, mapping in pairs(mode_mappings) do
    local command = mapping[1]
    local silent = mapping.silent or false
    local noremap = mapping.noremap or true
    local desc = mapping.desc or ""
    keymap(mode, key, command, { noremap = noremap, silent = silent, desc = desc })
  end
end
