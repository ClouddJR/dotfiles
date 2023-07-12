local telescope = require("telescope")
local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        path_display = { "truncate" },
        mappings = {
            i = {
                ["<C-s>"] = actions.complete_tag
            }
        }
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-i>"] = lga_actions.quote_prompt(),
                },
            },
        }
    }
})
telescope.load_extension("live_grep_args")
telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>pt", vim.cmd.Telescope)
vim.keymap.set("n", "<leader>pf", builtin.find_files)
vim.keymap.set("n", "<leader>pa", function()
    builtin.find_files({ hidden = true, no_ignore = true, prompt_title = "All Files" })
end)
vim.keymap.set("n", "<leader>pg", builtin.git_files)
vim.keymap.set("n", "<leader>pb", builtin.buffers)
vim.keymap.set("n", "<leader>po", function()
    builtin.oldfiles({ only_cwd = true })
end)
vim.keymap.set("n", "<leader>ps", function()
    telescope.extensions.live_grep_args.live_grep_args()
end)
vim.keymap.set("n", "<leader>ph", builtin.help_tags)
vim.keymap.set("n", "<leader>py", builtin.lsp_document_symbols)
