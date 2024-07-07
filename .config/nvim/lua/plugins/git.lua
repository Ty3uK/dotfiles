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
                    add = { text = " " },
                    change = { text = " " },
                    delete = { text = " " },
                    topdelete = { text = " " },
                    changedelete = { text = " " },
                },
            })
            vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
            vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
            vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
            vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
            vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'DiffChangeDelete' })
            vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
            vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
            vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
            vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'DiffDelete' })                                                                                                                                                                                vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })
        end,
    },
}
