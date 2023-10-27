require("ibl").setup({
    exclude = {
        filetypes = {
            "help",
            "terminal",
            "packer",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "",
        },
        buftypes = { "terminal" },
    },
    scope = {
        enabled = true,
        show_start = true,
    },
})
