local present, lspconfig = pcall(require, 'lspconfig')

if not present then
    return
end

local M = {}

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { 'markdown', 'plaintext' },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        },
    },
}

lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,

    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

local servers = { 'gopls', 'tsserver', 'graphql', 'svelte' }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = M.on_attach,
        capabilities = M.capabilities,
    })
end

return M
