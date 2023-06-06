local signs = require("gitsigns")

signs.setup({
    on_attach = function(bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "<leader>hp", signs.preview_hunk, opts)
        vim.keymap.set("n", "<leader>hr", signs.reset_hunk, opts)
    end
})
