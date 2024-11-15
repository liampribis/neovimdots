return {
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            close_if_last_window = true,
            enable_git_status = true,
            default_component_configs = {
                icon = {
                    folder_closed = "+",
                    folder_open = "-",
                    folder_empty = ".",
                },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "c_sharp",
                "cmake",
                "cpp",
                "csv",
                "dart",
                "devicetree",
                "diff",
                "gitcommit",
                "jq",
                "json",
                "json5",
                "jsonc",
                "kconfig",
                "linkerscript",
                "lua",
                "make",
                "markdown",
                "pascal",
                "python",
                "rust",
                "tcl",
                "toml",
                "verilog",
                "vhdl",
                "xml",
                "yaml"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        }
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
}
