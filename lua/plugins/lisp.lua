return {
    {
        "gpanders/nvim-parinfer",
        ft = { "clojure", "scheme", "lisp", "racket", "hy", "fennel" },
        keys = {
            { "<leader>pi", "<cmd>ParinferToggle<cr>", desc = "Toggle Parinfer" },
        },
    },
    {
        "vlime/vlime",
        init = function()
            vim.g.vlime_compiler_policy = { DEBUG = 3 }
            vim.g.vlime_leader = ","
        end,
        config = function()
        end,
        ft = { "lisp", "commonlisp" },
    },
}
