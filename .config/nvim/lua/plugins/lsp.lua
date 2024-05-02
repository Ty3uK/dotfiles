return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            require("mason").setup({ ui = { border = "rounded" } })
            require("mason-lspconfig").setup()

            local function on_attach(client, bufnr)
                -- vim.lsp.buf.inlay_hint(bufnr, true)
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem = {
                documentationFormat = { "markdown", "plaintext" },
                snippetSupport = true,
                preselectSupport = true,
                insertReplaceSupport = true,
                labelDetailsSupport = true,
                deprecatedSupport = true,
                commitCharactersSupport = true,
                tagSupport = { valueSet = { 1 } },
                resolveSupport = {
                    properties = {
                        "documentation",
                        "detail",
                        "additionalTextEdits",
                    },
                },
            }

            local schemastore = require("schemastore")
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    if server_name == "tsserver" then
                        return
                    end

                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["rust_analyzer"] = function()
                    vim.g.rustaceanvim = {
                        -- tools = {
                        --     inlay_hints = { auto = false },
                        -- },
                        server = {
                            standalone = false,
                            settings = {
                                ["rust-analyzer"] = {
                                    cargo = {
                                        features = "all",
                                        buildScripts = {
                                            enable = true,
                                        },
                                    },
                                    checkOnSave = {
                                        command = "clippy",
                                    },
                                },
                            },
                            on_attach = on_attach,
                        },
                    }
                end,
                ["jsonls"] = function()
                    lspconfig.jsonls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            json = {
                                schemas = schemastore.json.schemas(),
                                validate = { enable = true },
                            },
                        },
                    })
                end,
                ["yamlls"] = function()
                    lspconfig.jsonls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            json = {
                                schemas = schemastore.yaml.schemas(),
                                validate = { enable = true },
                            },
                        },
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,
            })

            require("typescript-tools").setup({
                on_attach = on_attach,
            })

            -- UI (Window border)
            local win_config = { border = "rounded" }
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, win_config)
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, win_config)
            vim.diagnostic.config({ float = win_config })
            require("lspconfig.ui.windows").default_options = win_config

            -- Keymaps
            vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", options)
            vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", options)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, options)
            vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, options)
            vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, options)
            vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, options)
            vim.keymap.set("n", "H", vim.lsp.buf.hover, options)
        end,
    },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "gbprod/none-ls-luacheck.nvim",
            "gbprod/none-ls-shellcheck.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local h = require("null-ls.helpers")
            local u = require("null-ls.utils")

            local eslint_d_config = {
                command = "eslint_d",
                cwd = h.cache.by_bufnr(function(params)
                    return u.root_pattern("package.json")(params.bufname)
                end),
                condition = function(utils, _)
                    return utils.root_has_file(
                        "eslint.config.js",
                        ".eslintrc",
                        ".eslintrc.js",
                        ".eslintrc.cjs",
                        ".eslintrc.yaml",
                        ".eslintrc.yml",
                        ".eslintrc.json"
                    )
                end,
            }

            null_ls.setup({
                sources = {
                    -- JS/TS
                    require("none-ls.formatting.eslint_d").with(eslint_d_config),
                    require("none-ls.diagnostics.eslint_d").with(eslint_d_config),
                    require("none-ls.code_actions.eslint_d").with(eslint_d_config),
                    null_ls.builtins.formatting.prettierd,

                    -- Lua
                    require("none-ls-luacheck.diagnostics.luacheck"),
                    null_ls.builtins.formatting.stylua,

                    -- Rust
                    require("none-ls.formatting.rustfmt"),

                    -- Golang
                    null_ls.builtins.formatting.goimports,
                    null_ls.builtins.formatting.gofmt,

                    -- Bash
                    require("none-ls-shellcheck.diagnostics"),
                    require("none-ls-shellcheck.code_actions"),
                },
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function(opts)
            require("lsp_signature").setup({
                floating_window = false,
            })
        end,
    },
    { "b0o/schemastore.nvim" },
    { "danymat/neogen", dependencies = "nvim-treesitter/nvim-treesitter", config = true },
    { "pmizio/typescript-tools.nvim" },
}
