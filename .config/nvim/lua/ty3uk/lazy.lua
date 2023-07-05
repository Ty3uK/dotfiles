require("lazy").setup({
    { "nvim-lua/plenary.nvim" },

    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
    },

    -- UI
    { "xiyaowong/nvim-transparent" },
    { "nvim-tree/nvim-web-devicons" },
    { "akinsho/bufferline.nvim" },
    { "nvim-lualine/lualine.nvim" },

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
    { "simrat39/rust-tools.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "b0o/schemastore.nvim" },
    { "danymat/neogen", dependencies = "nvim-treesitter/nvim-treesitter", config = true },

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

    -- TreeSitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Telescope
    { "nvim-telescope/telescope.nvim", tag = "0.1.1" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "tsakirist/telescope-lazy.nvim" },
    { dir = "~/projects/lua/telescope-lsp-finder" },

    -- Various
    { "vuki656/package-info.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
    { "ThePrimeagen/harpoon" },
    { "narutoxy/silicon.lua", dependencies = { "nvim-lua/plenary.nvim" } },
})
