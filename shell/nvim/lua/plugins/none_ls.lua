return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local none_ls = require("null-ls")

        none_ls.setup({
            sources = {
                require("none-ls.diagnostics.ruff"),
            },
        })
    end,
}
