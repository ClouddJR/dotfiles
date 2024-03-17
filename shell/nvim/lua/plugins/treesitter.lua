return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "php_only", "php" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["ia"] = "@parameter.inner",
                        ["aa"] = "@parameter.outer",
                        ["if"] = "@function.inner",
                        ["af"] = "@function.outer",
                        ["ic"] = "@class.inner",
                        ["ac"] = "@class.outer",
                    },
                },
            },
        })

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }

        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        })
    end,
}
