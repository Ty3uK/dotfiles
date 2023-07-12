require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
    additional_vim_regex_highlighting = { "markdown" },
})

require("treesitter-context").setup({
    enable = true,
    max_lines = 4,
})
