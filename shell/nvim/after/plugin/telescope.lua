local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local builtin = require("telescope.builtin")

telescope.setup {
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-u>"] = lga_actions.quote_prompt(),
                },
            },
        }
    }
}
telescope.load_extension("live_grep_args")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pa", function()
    builtin.find_files({ hidden = true })
end)
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    telescope.extensions.live_grep_args.live_grep_args()
end)
