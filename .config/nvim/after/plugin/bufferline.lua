require("bufferline").setup({
    options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        indicator = {
            style = "none",
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
            }
        },
    },
})
