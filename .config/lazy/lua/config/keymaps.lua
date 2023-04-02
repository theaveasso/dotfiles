-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

set("i", "jj", "<Esc>")

set("n", "<leader>w", vim.cmd.w)
set("n", "<leader>so", vim.cmd.so)
set("n", "<leader>h", vim.cmd.noh)

set("x", "p", [["_dP]])
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- scroll down or up to middle page
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- copy/ clipboard
set("v", "<Leader>y", '"+y', { silent = true })
set("v", "<Leader>Y", '"+Y', { silent = true })
set("v", "<Leader>P", '"+P', { silent = true })
set("v", "<Leader>p", '"+p', { silent = true })
