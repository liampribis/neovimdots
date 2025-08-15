local sharc_group = vim.api.nvim_create_augroup("SharcProject", { clear = true })

SHARC_DIRS = {
    "Q8_SHARC_1",
    "Q8_SHARC_2",
    "Q8_SHARC_4",
    "Q7_SHARC_COMMON",
    "SHARC1",
    "SHARC2",
    "SHARC3",
    "SHARC4",
    "SHARC5",
    "RACK_SHARC_COMMON",
    "RACK_SHARC_MADI",
}

local function is_sharc_file(filepath)
    for _, dir in ipairs(SHARC_DIRS) do
        if filepath:match(dir) and filepath:match("%.[hH]$") then
            return true
        end
    end
    return false
end

-- set ft=sharc and detach clangd if file is .H and in a sharc folder
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    group = sharc_group,
    callback = function()
        local filepath = vim.api.nvim_buf_get_name(0)

        if is_sharc_file(filepath) then
            vim.bo.filetype = "sharc"
            vim.bo.tabstop = 8
            vim.bo.shiftwidth = 8
            vim.bo.expandtab = false

            -- No clangd please
            local clients = vim.lsp.get_clients({ bufnr = 0, name = "clangd" })
            for _, client in ipairs(clients) do
                vim.lsp.buf_detach_client(0, client.id)
            end
        end
    end,
})

-- detach clangd if attached to .H and in a sharc folder
vim.api.nvim_create_autocmd("LspAttach", {
    group = sharc_group,
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufname = vim.api.nvim_buf_get_name(args.buf)

        if client and client.name == "clangd" and is_sharc_file(bufname) then
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(args.buf) then
                    vim.lsp.buf_detach_client(args.buf, client.id)
                end
            end)
        end
    end,
})
