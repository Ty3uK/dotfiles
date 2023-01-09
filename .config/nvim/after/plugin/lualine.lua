require("lualine").setup({
    options = {
        theme = "tokyonight",
        section_separators = "",
        component_separators = "",
    },
    sections = {
        lualine_b = { "branch" },
        lualine_x = {},
        lualine_y = { "diagnostics" },
        lualine_z = {},
    },
})
