return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            require("mini.surround").setup()
            require("mini.statusline").setup()
            require("mini.diff").setup({
                view = {
                    style = "sign",
                },
            })
            require("mini.trailspace").setup()
        end,
    },
}
