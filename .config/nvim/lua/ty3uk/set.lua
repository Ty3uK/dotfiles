-- Leader
vim.g.mapleader = " "

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

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

-- disable nvim intro
vim.opt.shortmess:append("sI")

vim.g.markdown_fenced_languages = {
    "ts=typescript",
}
