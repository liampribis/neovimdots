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
vim.keymap.set("n", "<Bslash>", "<C-^>")
vim.keymap.set("n", "<Leader>1", "<cmd>Neotree toggle<cr>")

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope.find_files, {desc = "find files"})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[syntax on]])


local cmp_caps = require ("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
lspconfig.clangd.setup {
    capabilities = cmp_caps,
    root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
        "Makefile",
        "configure.ac",
        "configure.in",
        "config.h.in",
        "meson.build",
        "meson_options.txt",
        "build.ninja"
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(

        fname
        ) or require("lspconfig.util").find_git_ancestor(fname)
    end,
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
    },
}
