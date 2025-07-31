return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        picker = {
            enabled = true,
            matcher = {
                history_bonus = true,
            },
        },
        indent = {
            enabled = true,
        },
        lazygit = {
            configure = true,
        },
        image = {
            enabled = true,
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                Snacks.picker.files({ hidden = true })
            end,
        },
        {
            "<leader>lg",
            function()
                Snacks.picker.grep({ finder = "grep", regex = false, hidden = true })
            end,
        },
        {
            "<leader>tb",
            function()
                Snacks.picker.buffers()
            end,
        },
        {
            "<leader>gt",
            function()
                Snacks.lazygit()
            end,
        },
        {
            "<leader>gb",
            function()
                Snacks.git.blame_line()
            end,
        },
    },
}
