return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local signs = require("gitsigns")
            local opts = { buffer = bufnr }

            vim.keymap.set("n", "]g", signs.next_hunk, opts)
            vim.keymap.set("n", "[g", signs.prev_hunk, opts)
            vim.keymap.set("n", "<leader>ge", signs.preview_hunk, opts)
            vim.keymap.set("n", "<leader>gb", signs.blame_line, opts)
            vim.keymap.set("n", "<leader>gr", signs.reset_hunk, opts)
            vim.keymap.set("n", "<leader>gR", signs.reset_buffer, opts)
        end,
    },
}
