local present, lualine = pcall(require, 'lualine')

if not present then
    return
end

lualine.setup({
    options = {
        theme = 'tokyonight',
        section_separators = '',
        component_separators = '',
    },
})

vim.api.nvim_set_hl(0, 'lualine_c_normal', { bg = 'NONE' })
