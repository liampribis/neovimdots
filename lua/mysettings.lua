vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.expandtab = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.opt.number = true
vim.opt.relativenumber = true


vim.keymap.set("n", "<Leader>h", "<cmd>nohlsearch<cr>")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[syntax on]])


vim.keymap.set("n", "<Leader>1", "<cmd>Neotree toggle<cr>")

local telescope = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", telescope.find_files, {desc = "find files"})
