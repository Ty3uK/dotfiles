return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "b0o/schemastore.nvim",
        },
        config = function()
            vim.lsp.config("sqls", {
                cmd = { "sqls", "-config", vim.loop.cwd() .. "/sqls.config.yaml" },
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            })
            vim.lsp.config("jsonls", {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })
            vim.lsp.config("yamlls", {
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = "",
                        },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            })

            require("mason").setup()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "gbprod/none-ls-luacheck.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- JS/TS
                    null_ls.builtins.formatting.prettierd,

                    -- Lua
                    require("none-ls-luacheck.diagnostics.luacheck"),
                    null_ls.builtins.formatting.stylua,

                    -- Rust
                    require("none-ls.formatting.rustfmt"),

                    -- Golang
                    null_ls.builtins.formatting.goimports,
                    null_ls.builtins.formatting.gofmt,

                    -- SQL
                    require("nls.sleek"),
                },
            })
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
