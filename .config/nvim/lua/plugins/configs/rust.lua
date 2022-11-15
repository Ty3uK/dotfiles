local present1, _ = pcall(require, 'lspconfig')
local present2, rust = pcall(require, 'rust-tools')

print(present1, present2)

if not (present1 and present2) then
    return
end

rust.setup({
    server = {
        on_attach = function()
        end,
    },
})
