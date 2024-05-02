return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup()

            vim.o.background = "dark"
            vim.cmd("colorscheme gruvbox")
            vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

            -- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
            -- for type, icon in pairs(signs) do
            --     local hl = "DiagnosticSign" .. type
            --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            -- end
        end,
    },
    { "nvim-tree/nvim-web-devicons" },
}
