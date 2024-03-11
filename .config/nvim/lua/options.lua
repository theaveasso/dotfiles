local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")

opt.backspace = "indent,eol,start"

opt.swapfile = false

opt.relativenumber = true
opt.number = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50

opt.showtabline = 0

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
