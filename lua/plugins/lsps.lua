return {
    { "neovim/nvim-lspconfig", tag = "v1.0.0" },
    {
        "hrsh7th/nvim-cmp",
        -- tag = "?" -- no release tags
        config = function()
            local cmp = require("cmp")
            cmp.setup({

                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                }, {
                    { name = 'buffer' },
                })
            })

        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        -- tag = "?" -- no release tags
    },
}
