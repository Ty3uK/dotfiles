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
        hl.LspSagaFinderSelection = { fg = c.red }
        hl.NvimTreeNormal = { bg = 'NONE' }
        hl.NvimTreeNormalNC = { bg = 'NONE' }
        hl.LineNr = { fg = c.fg_dark }
    end,
})

vim.cmd[[colorscheme tokyonight]]
