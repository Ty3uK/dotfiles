local present, lspsaga = pcall(require, 'lspsaga')

if not present then
    return
end

lspsaga.init_lsp_saga()

local signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
