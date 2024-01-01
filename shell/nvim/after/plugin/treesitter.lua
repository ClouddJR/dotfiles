require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
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
