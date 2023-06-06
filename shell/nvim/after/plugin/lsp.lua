local lsp = require("lsp-zero")
local cmp = require('cmp')

lsp.preset("recommended")
lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }

    lsp.default_keymaps(opts)

    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)

lsp.setup()

cmp.setup({
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }
})

vim.diagnostic.config({
    virtual_text = false
})
