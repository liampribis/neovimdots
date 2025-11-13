-- required to be set up before lazy plugin load
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy_plugin_manager_setup")

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

vim.opt.clipboard = "unnamedplus"

vim.g.load_doxygen_syntax = true

vim.keymap.set("n", "<Leader>h", "<cmd>nohlsearch<cr><cmd>lclose<cr><cmd>cclose<cr>")
vim.keymap.set("n", "<Bslash>", "<C-^>", {silent = true})
vim.keymap.set("n", "<Leader>1", "<cmd>Neotree toggle<cr>")
vim.keymap.set("n", "<Leader>t", "<cmd>Neotree reveal<cr>")
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<Leader>ch",  "<cmd>ClangdSwitchSourceHeader<cr>")

-- finders
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telescope.find_files, {desc = "find files"})

vim.keymap.set("n", "<C-k>",
function()
    telescope.find_files{
        prompt_title = "Find Files Without Gitignore",
        hidden = true,
        no_ignore = true,
        file_ignore_patterns = {
            ".git"
        },
    }
end,
{desc = "find files"}
)

vim.keymap.set("n", "<Leader>g", telescope.live_grep)

local telescope_config = require("telescope.config")
local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }
-- search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--no-ignore")
-- don't search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
-- don't search tags
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/tags")

vim.keymap.set("n", "<Leader>G",
function()
    telescope.live_grep{prompt_title = "Live Grep Without Gitignore", vimgrep_arguments = vimgrep_arguments}
end
)

vim.keymap.set("n", "<Leader>l", telescope.loclist)

-- location list
vim.opt.grepprg = "rg --vimgrep" -- by default this uses -uu flag which ignores gitignore
vim.keymap.set("n", "<Leader>s", "\"jyiw:lgrep! <C-r><C-w><cr><cmd>lope<cr>", {silent = true})
vim.keymap.set("n", ")", "<cmd>lnext<cr>", {noremap = true})
vim.keymap.set("n", "(", "<cmd>lprev<cr>", {noremap = true})

vim.keymap.set( "n", "<Leader>e", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, {silent = true, noremap = true})

-- theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[syntax on]])


-- lsp
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
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {
    capabilities = cmp_caps,
    settings = {
        [ "rust-analyzer" ] = {
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
        },
    },
}


-- powershell, :h shell-powershell
vim.api.nvim_exec(
[[
if has("win64") || has("win32")
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
		let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
		set shellquote= shellxquote=
endif
]]
, true)

require("sharc")
