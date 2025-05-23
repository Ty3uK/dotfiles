return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "pmizio/typescript-tools.nvim",
        },
        config = function()
            vim.lsp.config("sqls", {
                cmd = { "sqls", "-config", "config.yml" },
                on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            })

            require("mason").setup()
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        vim.lsp.enable(server_name)
                    end,
                },
            })
            require("typescript-tools").setup({
                settings = {
                    expose_as_code_actions = "all",
                },
            })
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
                    require("nls.biome"),
                    null_ls.builtins.formatting.biome,
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
}
