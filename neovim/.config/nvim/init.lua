vim.pack.add({
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = 'https://github.com/nvim-mini/mini.nvim' },
    { src = 'https://github.com/mikavilpas/yazi.nvim' },
    { src = 'https://github.com/kdheepak/lazygit.nvim' },
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.winborder = "rounded"
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.o.pumborder = "rounded"

require("gruvbox").setup({
    terminal_colors = true,
    transparent_mode = true,
})
vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

require("mason").setup()
require("mason-lspconfig").setup()
require("lazydev").setup()

require("mini.pick").setup({
    mappings = {
        choose_2 = { char = '<C-y>', func = function() vim.api.nvim_input('<CR>') end },
    },
})
require("mini.statusline").setup()
require("mini.pairs").setup()
require("mini.icons").setup()
MiniIcons.tweak_lsp_kind()
require("mini.completion").setup({
    window = {
        info = { border = "rounded" },
        signature = { border = "rounded" },
    },
    mappings = {
        force_twostep = "<C-x><C-o>"
    }
})
require("mini.cmdline").setup({
    autocomplete = {
        delay = 250,
    },
})

require('yazi').setup({})
require('tree-sitter-manager').setup({ auto_install = true })
require("gitsigns").setup({
    numhl = true,
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
        local parser = vim.treesitter.get_parser(ev.buf)
        if parser then
            vim.treesitter.start(ev.buf)
            -- vim.bo[ev.buf].syntax = 'ON'
        end
    end
})

vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', { noremap = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })

vim.keymap.set("n", "grd", function() vim.lsp.buf.definition({ loclist = true }) end, { noremap = true })
vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, { noremap = true })
vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, { noremap = true })
vim.keymap.set("n", "<leader>dd", function() vim.diagnostic.setloclist() end, { noremap = true })

vim.keymap.set("n", "<leader>gt", function() require("lazygit").lazygit() end, { noremap = true })
vim.keymap.set("n", "<leader>fb", function() require("yazi").yazi() end, { noremap = true })
vim.keymap.set("n", "<leader>ff", function() MiniPick.registry.files() end, { noremap = true })
vim.keymap.set("n", "<leader>fg", function() MiniPick.builtin.grep_live() end, { noremap = true })

function Pack_clean()
    local active_plugins = {}
    local unused_plugins = {}

    for _, plugin in ipairs(vim.pack.get()) do
        active_plugins[plugin.spec.name] = plugin.active
    end

    for _, plugin in ipairs(vim.pack.get()) do
        if not active_plugins[plugin.spec.name] then
            table.insert(unused_plugins, plugin.spec.name)
        end
    end

    if #unused_plugins == 0 then
        print("No unused plugins.")
        return
    end

    local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
    if choice == 1 then
        vim.pack.del(unused_plugins)
    end
end
