require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
})

require("treesitter-context").setup({
    enable = true,
    max_lines = 4,
})
