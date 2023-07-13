require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-Space>",
            node_incremental = "<C-Space>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['ia'] = '@parameter.inner',
                ['aa'] = '@parameter.outer',
                ["if"] = "@function.inner",
                ["af"] = "@function.outer",
                ["ic"] = "@class.inner",
                ["ac"] = "@class.outer",
            },
        },
    },
})
