local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    -- System
    { "nvim-lua/plenary.nvim" },
    -- UI
    require("plugins.ui"),
    -- Git
    require("plugins.git"),
    -- LSP
    require("plugins.lsp"),
    -- Cmp
    require("plugins.cmp"),
    -- Telescope
    require("plugins.telescope"),
    -- TreeSitter
    require("plugins.treesitter"),
    -- Mini.nvim
    require("plugins.mini"),
    -- Common
    require("plugins.common"),
})
