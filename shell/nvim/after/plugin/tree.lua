require("nvim-tree").setup({
    hijack_netrw = false,
    git = {
        ignore = false,
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                folder_arrow = false,
            },
        },
        indent_markers = {
            enable = true,
        },
    },
})

vim.keymap.set("n", "<leader>n", ":NvimTreeFindFileToggle<CR>")
