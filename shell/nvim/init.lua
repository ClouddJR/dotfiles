--[[
=================================================
==================== OPTIONS ====================
=================================================
--]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.guicursor = ""

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.inccommand = "split"
vim.opt.wildmode = "longest:full,full"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 8

vim.opt.showmode = false
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.undofile = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

--[[
=================================================
==================== KEYMAPS ====================
=================================================
--]]

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>Q", ":bd!<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

--[[
=================================================
==================== PLUGINS ====================
=================================================
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tpope/vim-sleuth",
    "tpope/vim-unimpaired",
    { "windwp/nvim-autopairs", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },

    { import = "plugins" },
})
