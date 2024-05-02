return {
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        keys = {
            { "<leader>gt", "<cmd>LazyGit<cr>" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        keys = {
            { "<leader>gb", function() require("gitsigns").blame_line() end },
            { "<leader>gh", function() require("gitsigns").preview_hunk() end },
        },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { hl = "DiffAdd", text = " ", numhl = "GitSignsAddNr" },
                    change = { hl = "DiffChange", text = " ", numhl = "GitSignsChangeNr" },
                    delete = { hl = "DiffDelete", text = " ", numhl = "GitSignsDeleteNr" },
                    topdelete = { hl = "DiffDelete", text = " ", numhl = "GitSignsDeleteNr" },
                    changedelete = { hl = "DiffChangeDelete", text = " ", numhl = "GitSignsChangeNr" },
                },
            })
        end,
    },
}
