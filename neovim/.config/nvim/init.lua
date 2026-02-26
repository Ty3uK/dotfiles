vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/nvimtools/none-ls.nvim",
    "https://github.com/nvimtools/none-ls-extras.nvim",
    "https://github.com/nvim-mini/mini.diff",
    "https://github.com/nvim-mini/mini.trailspace",
    "https://github.com/nvim-mini/mini.align",
    "https://github.com/mikavilpas/yazi.nvim",
    "https://github.com/folke/snacks.nvim",
    "https://github.com/grafana/vim-alloy",
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
    { src = "https://github.com/klen/nvim-config-local" },
    { src = "https://github.com/jmbuhr/otter.nvim" },
})
vim.cmd("packadd nvim.undotree")

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.winborder = "rounded"
vim.o.background = "dark"

vim.cmd("filetype indent off")
vim.o.autoindent = true
vim.o.smartindent = false
vim.o.cindent = false

require("gruvbox").setup({
    overrides = {
        NormalFloat = { bg = "none" },
        Pmenu = { bg = "none" },
    },
})
vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "SnippetTabstopActive", { ng = nil })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

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

require("tree-sitter-manager").setup({
    border = "rounded",
    highlight = true,
})

require("mini.diff").setup({
    view = {
        style = "sign",
    },
})
require("mini.trailspace").setup()
require("mini.align").setup()
require("yazi").setup({
    open_for_directories = true,
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
})

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
                },
            },
        },
    },
    input = {
        enabled = true,
    },
    styles = {
        input = {
            relative = "cursor",
        },
    },
})

-- Keymaps
vim.keymap.set("n", "<leader>ff", function()
    Snacks.picker.files({ hidden = true })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lg", function()
    Snacks.picker.grep()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", function()
    require("yazi").yazi()
end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>ca", function()
--     vim.lsp.buf.code_action()
-- end, { noremap = true, silent = true })
vim.keymap.set("n", "grd", function()
    Snacks.picker.lsp_definitions()
end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>gr", function()
--     Snacks.picker.lsp_references()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>ra", function()
--     vim.lsp.buf.rename()
-- end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gt", function()
    Snacks.lazygit()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", function()
    vim.diagnostic.open_float()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fm", function()
    vim.lsp.buf.format()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", function()
    Snacks.git.blame_line()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- LSP
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.formatting.sql_formatter.with({ command = { "sleek" } }),
    },
})

vim.lsp.config("sqls", {
    cmd = { "sqls", "-config", "sqls.config.yaml" },
    root_markers = { "sqls.config.yaml" },
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.env["XDG_DATA_HOME"] .. "/nvim/site/pack/core/opt/",
                },
            },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

require('config-local').setup()

require("otter").setup({
    lsp = {
        hover = { enabled = true },
        completion = { enabled = true },
        diagnostics = { enabled = true },
    },
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    callback = function()
        require("otter").activate({ "sql" })
    end,
})
