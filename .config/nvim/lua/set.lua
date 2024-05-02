-- Leader
vim.g.mapleader = " "

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.json", "*.yml", "*.yaml", "*.toml", "*.html" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
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

vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.netrw_localrmdir = "rm -rf"
