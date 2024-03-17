return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(mode, keys, func, desc)
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("n", "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                map("n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                map("n", "gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                map("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                map("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
                map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("i", "<C-s>", vim.lsp.buf.signature_help, "Signature help for current context")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = {
            pyright = {},
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                "${3rd}/luv/library",
                                unpack(vim.api.nvim_get_runtime_file("", true)),
                            },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
            emmet_ls = {
                filetypes = {
                    "blade",
                    "css",
                    "html",
                },
            },
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "pyright",
            "ruff",
            "black",
            "isort",
            "stylua",
            "emmet-ls",
            "phpactor",
            "pint",
            "rustywind",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })

        vim.diagnostic.config({
            virtual_text = false,
        })
    end,
}
