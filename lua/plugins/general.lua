-- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/370
local function copy_path(state)
	local node = state.tree:get_node()
	local filepath = node:get_id()
	local filename = node.name
	local modify = vim.fn.fnamemodify

	local results = {
		filepath,
		modify(filepath, ":."),
		modify(filepath, ":~"),
		filename,
		modify(filename, ":r"),
		modify(filename, ":e"),
	}


	vim.ui.select({
		"1. Absolute path: " .. results[1],
		"2. Path relative to CWD: " .. results[2],
		"3. Path relative to HOME: " .. results[3],
		"4. Filename: " .. results[4],
		"5. Filename without extension: " .. results[5],
		"6. Extension of the filename: " .. results[6],
	}, { prompt = "Choose to copy to clipboard:" }, function(choice)
		if choice then
			local i = tonumber(choice:sub(1, 1))
			if i then
				local result = results[i]
				vim.fn.setreg('"', result)
				vim.notify("Copied: " .. result)
			else
				vim.notify("Invalid selection")
			end
		else

			vim.notify("Selection cancelled")
		end
	end)
end

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
            window = {
                mappings = {
                    ["Y"] = copy_path,
                },
            },
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
