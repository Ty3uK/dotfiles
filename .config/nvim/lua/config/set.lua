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
vim.opt.numberwidth = 4
vim.opt.ruler = false

vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.mouse = ""

vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set noswapfile")

-- Lazy
vim.g.snacks_animate = false
