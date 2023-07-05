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
        require("rust-tools").setup({
            tools = {
                inlay_hints = { auto = false },
            },
            server = {
                standalone = false,
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
                on_attach = on_attach,
            },
        })
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
    ["denols"] = function()
        lspconfig.denols.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        })
    end,
})

require("typescript-tools").setup({})

local win_config = { border = "rounded" }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, win_config)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, win_config)
vim.diagnostic.config({ float = win_config })
require("lspconfig.ui.windows").default_options = win_config
