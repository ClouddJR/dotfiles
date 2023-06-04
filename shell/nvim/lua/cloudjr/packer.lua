return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "folke/tokyonight.nvim"

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    use "ThePrimeagen/harpoon"

    use "mbbill/undotree"

    use "tpope/vim-fugitive"

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },

            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        }
    }
end)
