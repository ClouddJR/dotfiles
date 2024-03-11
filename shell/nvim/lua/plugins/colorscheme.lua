return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("tokyonight-moon")
    end,
    opts = {
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
        },
    },
}
