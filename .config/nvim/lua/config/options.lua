-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.hlsearch = true

opt.undofile = true
opt.swapfile = false
opt.backup = false

opt.ignorecase = true
opt.smartcase = true

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.cursorline = true
opt.laststatus = 3

opt.termguicolors = true

opt.completeopt = "menuone,noselect"
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.splitright = true
opt.splitbelow = true
