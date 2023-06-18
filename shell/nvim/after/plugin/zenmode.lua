require("zen-mode").setup({
    window = {
        backdrop = 1
    },
    plugins = {
        gitsigns = { enabled = true },
    },
})

vim.keymap.set("n", "<leader>zz", vim.cmd.ZenMode)
