return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local lga_shortcuts = require("telescope-live-grep-args.shortcuts")

        telescope.setup({
            defaults = {
                path_display = { "truncate" },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                        },
                    },
                },
            },
        })

        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")
        pcall(telescope.load_extension, "live_grep_args")

        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
        vim.keymap.set("n", "<leader>sw", lga_shortcuts.grep_word_under_cursor, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("v", "<leader>sv", lga_shortcuts.grep_visual_selection, { desc = "[S]earch current [V]isual selection" })
        vim.keymap.set("n", "<leader>sg", telescope.extensions.live_grep_args.live_grep_args, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily search in current buffer" })

        vim.keymap.set("n", "<leader>sa", function()
            builtin.find_files({ hidden = true, no_ignore = true })
        end, { desc = "[S]earch [A]ll files" })

        vim.keymap.set("n", "<leader>s.", function()
            builtin.oldfiles({ only_cwd = true })
        end, { desc = '[S]earch Recent Files ("." for repeat)' })

        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earch [N]eovim files" })
    end,
}
