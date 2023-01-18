local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup()
require("lspsaga").setup({
    ui = {
        theme = "round",
        border = "rounded",
        title = false,
        colors = {
          normal_bg = "NONE",
          title_bg = "NONE",
          red = "NONE",
          magenta = "NONE",
          orange = "NONE",
          yellow = "NONE",
          green = "NONE",
          cyan = "NONE",
          blue = "NONE",
          purple = "NONE",
          white = "NONE",
          black = "NONE",
        },
    },
    scroll_in_preview = {
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
    },
    symbol_in_winbar = {
        enable = false,
    },
})

-- export on_attach & capabilities for custom lspconfigs
local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

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

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
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
}

local servers = { "gopls", "tsserver", "cssls", "graphql", "svelte" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

require("rust-tools").setup({
    server = {
        standalone = false,
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
                inlayHints = { locationLinks = false },
            },
        },
    },
})
