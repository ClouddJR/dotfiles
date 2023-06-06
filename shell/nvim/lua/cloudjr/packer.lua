return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "folke/tokyonight.nvim"

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },

            --Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },

            --Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    }

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        }
    }

    use "ThePrimeagen/harpoon"

    use "mbbill/undotree"

    use "tpope/vim-fugitive"
    use "tpope/vim-surround"

    use "nvim-tree/nvim-tree.lua"
    use 'nvim-tree/nvim-web-devicons'
end)
