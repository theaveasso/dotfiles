vim.g.mapleader = " "
local keymap = vim.keymap.set

local mappings = {
	n = {
		["<C-s>"] = {"<cmd>w<CR>", silent=true, desc="Save file"},
		["<C-q>"] = {"<cmd>qa<CR>", silent=true, desc="Quit all"},
		["<leader>so"] = {"<cmd>source %<CR>", silent=false, desc="Source current file"},
	},
  i = {
    ["jj"] = {"<Esc>", silent=false, desc="Insert mode - Escape"}
  }
}

for mode, mode_mappings in pairs(mappings) do
  for key, mapping in pairs(mode_mappings) do
    local command = mapping[1]
    local silent = mapping.silent or false
    local desc = mapping.desc or ""
    keymap(mode, key, command, {silent=silent, desc=desc})
  end
end

