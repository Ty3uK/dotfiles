local present, tokyonight = pcall(require, 'tokyonight')

if not present then
    return
end

tokyonight.setup({
    style = 'night',
    transparent = true,
    styles = {
        floats = 'transparent',
    },
    on_highlights = function(hl, c)
        hl.DiagnosticVirtualTextError = { bg = 'NONE', fg = c.red1 }
        hl.DiagnosticVirtualTextWarn = { bg = 'NONE', fg = c.yellow }
        hl.DiagnosticVirtualTextInfo = { bg = 'NONE', fg = c.blue2 }
        hl.DiagnosticVirtualTextHint = { bg = 'NONE', fg = c.teal }
    end,
})

vim.cmd[[colorscheme tokyonight]]
