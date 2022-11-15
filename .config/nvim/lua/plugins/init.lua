-- Load all plugins
local present, packer = pcall(require, 'packer')

if present then
    vim.cmd('packadd packer.nvim')

    packer.startup(function(use)
        use {
            'wbthomason/packer.nvim',
            cmd = require('core.lazy_load').packer_cmds,
            config = function()
                require('plugins')
            end,
        }

        use { 'nvim-lua/plenary.nvim' }

        use { 'lewis6991/impatient.nvim' }

        use { 'ii14/neorepl.nvim' }

        use {
            'xiyaowong/nvim-transparent',
            config = function()
                require('plugins.configs.transparent')
            end,
        }

        use {
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup({
                    default = true,
                })
            end,
        }

        use {
            'lukas-reineke/indent-blankline.nvim',
            opt = true,
            setup = function()
                require('core.lazy_load').on_file_open('indent-blankline.nvim')
            end,
            config = function()
                require('plugins.configs.blankline')
            end,
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            module = 'nvim-treesitter',
            setup = function()
                require('core.lazy_load').on_file_open 'nvim-treesitter'
            end,
            cmd = require('core.lazy_load').treesitter_cmds,
            run = ':TSUpdate',
            config = function()
                require 'plugins.configs.treesitter'
            end,
        }

        -- git stuff
        use {
            'lewis6991/gitsigns.nvim',
            ft = 'gitcommit',
            setup = function()
                require('core.lazy_load').gitsigns()
            end,
            config = function()
                require('plugins.configs.gitsigns')
            end,
        }

        use { 'kdheepak/lazygit.nvim' }

        -- ui
        use {
            'folke/tokyonight.nvim',
            config = function()
                require('plugins.configs.tokyonight')
            end,
        }

        use {
            'akinsho/bufferline.nvim',
            tag = 'v3.*',
            requires = 'nvim-tree/nvim-web-devicons',
            config = function()
                require('plugins.configs.bufferline')
            end,
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            after = 'tokyonight.nvim',
            config = function()
                require('plugins.configs.lualine')
            end,
        }

        -- lsp stuff
        use { 'williamboman/mason-lspconfig.nvim' }

        use {
            'williamboman/mason.nvim',
            cmd = require('core.lazy_load').mason_cmds,
            config = function()
                require('plugins.configs.mason')
            end,
        }

        use {
            'neovim/nvim-lspconfig',
            opt = true,
            setup = function()
                require('core.lazy_load').on_file_open('nvim-lspconfig')
            end,
            config = function()
                require('plugins.configs.lspconfig')
            end,
        }

        use {
            'glepnir/lspsaga.nvim',
            branch = 'main',
            config = function()
                require('plugins.configs.lspsaga')
            end,
        }

        use {
            'jose-elias-alvarez/null-ls.nvim',
            config = function()
                require('plugins.configs.null-ls')
            end,
        }

        use {
            'simrat39/rust-tools.nvim',
            after = 'nvim-lspconfig',
            config = function()
                require('plugins.configs.rust')
            end,
        }

        -- load luasnips + cmp related in insert mode only
        use {
            'rafamadriz/friendly-snippets',
            module = { 'cmp', 'cmp_nvim_lsp' },
            event = 'InsertEnter',
        }

        use {
            'hrsh7th/nvim-cmp',
            after = 'friendly-snippets',
            config = function()
                require('plugins.configs.cmp')
            end,
        }

        use {
            'L3MON4D3/LuaSnip',
            wants = 'friendly-snippets',
            after = 'nvim-cmp',
            config = function()
                require('plugins.configs.luasnip')
            end,
        }

        use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' }
        use { 'hrsh7th/cmp-nvim-lua', after = 'cmp_luasnip' }
        use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
        use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }

        use {
            'windwp/nvim-autopairs',
            after = 'nvim-cmp',
            config = function()
                require('plugins.configs.autopairs')
            end,
        }

        use {
            'numToStr/Comment.nvim',
            module = 'Comment',
            keys = { 'gc', 'gb' },
            config = function()
                require('plugins.configs.comment')
            end,
        }

        -- telescope
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            requires = {{ 'nvim-lua/plenary.nvim' }},
            config = function()
                require('plugins.configs.telescope')
            end,
        }

        use {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        }
    end)
end
