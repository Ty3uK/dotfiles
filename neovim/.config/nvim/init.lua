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
    { src = 'https://github.com/saghen/blink.lib' },
    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/dmtrKovalenko/fff.nvim' }
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

require('blink.cmp').setup({
    keymap = {
        preset = "default",
        ["<C-x><C-o>"] = { function(cmp) cmp.show() end },
    },
})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if kind ~= 'install' or kind ~= 'update' then
            return
        end
        if name == 'fff.nvim' then
            if not ev.data.active then
                vim.cmd.packadd('fff.nvim')
            end
            require('fff.download').download_or_build_binary()
        else
            if name == 'blink.cmp' or name == 'blink.nvim' then
                require('blink.cmp').build():pwait()
            end
        end
    end,
})

vim.g.fff = {
    lazy_sync = true,
    debug = { enabled = true, show_scores = true },
}

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
vim.keymap.set("n", "<leader>ff", function() require('fff').find_files() end, { noremap = true })
vim.keymap.set("n", "<leader>fg", function() require('fff').live_grep() end,
    { noremap = true })

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
