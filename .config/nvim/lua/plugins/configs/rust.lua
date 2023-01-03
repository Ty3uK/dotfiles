local present1, _ = pcall(require, 'lspconfig')
local present2, rust = pcall(require, 'rust-tools')

if not (present1 and present2) then
    return
end

rust.setup({
    server = {
        standalone = false,
        on_attach = function()
        end,
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
