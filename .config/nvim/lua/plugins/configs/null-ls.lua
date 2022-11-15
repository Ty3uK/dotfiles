local present, null_ls = pcall(require, 'null-ls')

if not present then
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
    },
})
