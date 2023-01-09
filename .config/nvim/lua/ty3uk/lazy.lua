require("lazy").setup({
    { "nvim-lua/plenary.nvim" },

	{
		"folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
	},

    -- UI
    { "xiyaowong/nvim-transparent" },
    { "nvim-tree/nvim-web-devicons" },
    { "akinsho/bufferline.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "nvim-tree/nvim-tree.lua" },

    -- Generic
    { "lukas-reineke/indent-blankline.nvim" },
    { "numToStr/Comment.nvim" },

    -- Git
    { "kdheepak/lazygit.nvim" },
    { "lewis6991/gitsigns.nvim" },

    -- LSP
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "glepnir/lspsaga.nvim" },
    { "simrat39/rust-tools.nvim" },

    -- Cmp
    { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "windwp/nvim-autopairs" },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
    },
})
