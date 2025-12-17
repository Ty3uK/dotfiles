vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/nvimtools/none-ls.nvim",
    "https://github.com/nvimtools/none-ls-extras.nvim",
    "https://github.com/nvim-mini/mini.diff",
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/nvim-mini/mini.trailspace",
    "https://github.com/mikavilpas/yazi.nvim",
    "https://github.com/folke/snacks.nvim",
})

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.winborder = "rounded"
vim.o.background = "dark"

require("gruvbox").setup({
    overrides = {
        NormalFloat = { bg = "none" },
        Pmenu = { bg = "none" },
    },
})
vim.cmd.colorscheme("gruvbox")

vim.opt.signcolumn = "yes"
vim.g.mapleader = " "

require("mason").setup()
require("mason-lspconfig").setup()
require("blink.cmp").setup({
    completion = {
        menu = {
            border = "rounded",
            winblend = 0,
            scrollbar = true,
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 250,
            window = {
                border = "rounded",
                winblend = 0,
                scrollbar = true,
            },
        },
    },
})

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    auto_install = true,
})

require("mini.diff").setup({
    view = {
        style = "sign"
    }
})
require("mini.pairs").setup({
    mappings = {
        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
    },
})
require("mini.trailspace").setup()
require("yazi").setup({ open_for_directories = true })

require("snacks").setup({
    indent = {
        enabled = true,
        animate = {
            enabled = false,
        },
    },
    statuscolumn = {
        enabled = true,
        folds = {
            open = true,
        },
    },
    picker = {
        ui_select = true,
        win = {
            input = {
                keys = {
                    ["<c-y>"] = { "confirm", mode = { "n", "i" } },
                }
            }
        }
    },
    input = {
        enabled = true,
    },
})

-- Keymaps
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files({ hidden = true }) end,
    { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lg", function() Snacks.picker.grep() end,
    { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", function() require("yazi").yazi() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.lsp_definitions() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gr", function() Snacks.picker.lsp_references() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ra", function() vim.lsp.buf.rename() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gt", function() Snacks.lazygit() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", function() vim.diagnostic.open_float() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", function() Snacks.git.blame_line() end, { noremap = true, silent = true })
vim.keymap.set("n", '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })
vim.keymap.set("n", '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set("n", '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- LSP
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.sql_formatter.with({ command = { "sleek" } }),
        null_ls.builtins.diagnostics.selene,
    },
})

vim.lsp.config("sqls", {
    cmd = { 'sqls', '-config', 'sqls.config.yaml' },
    root_markers = { 'sqls.config.yaml' },
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.env["XDG_DATA_HOME"] .. "/nvim/site/pack/core/opt/",
                },
            },
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})
