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
    { "pmizio/typescript-tools.nvim" },

    -- Cmp
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "windwp/nvim-autopairs" },
    { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
    { "saadparwaiz1/cmp_luasnip" },

    -- TreeSitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-context" },

    -- Telescope
    { "nvim-telescope/telescope.nvim", tag = "0.1.3" },
    { "debugloop/telescope-undo.nvim" },
    { "tsakirist/telescope-lazy.nvim" },
    { dir = "~/projects/lua/telescope-lsp-finder" },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },

    -- Various
    { "ThePrimeagen/harpoon" },
    { "narutoxy/silicon.lua", dependencies = { "nvim-lua/plenary.nvim" } },
    { "ellisonleao/glow.nvim" },
}, {
    ui = {
        border = "rounded",
    },
})
