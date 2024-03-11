return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            hijack_netrw = false,
            git = {
                ignore = false,
            },
            view = {
                width = {},
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
    end,
}
