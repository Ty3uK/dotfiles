-- Leader
vim.g.mapleader = " "

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.filetype.add({
    pattern = {
        ["hypr.*"] = "hyprlang",
    },
})

-- Numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false

vim.opt.scrolloff = 8
vim.opt.mouse = ""

vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.updatetime = 250

vim.g.markdown_fenced_languages = {
    "ts=typescript",
}
