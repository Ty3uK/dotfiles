local present, bufferline = pcall(require, 'bufferline')

if not present then
    return
end

local bg = 'NONE'

bufferline.setup({
    options = {
        show_close_icon = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        },
    },
    highlights = {
        fill = {
            bg = bg,
        },
        background = {
            bg = bg,
        },
        buffer_visible = {
            bg = bg,
        },
        buffer_selected = {
            bg = bg,
        },
        close_button = {
            bg = bg,
        },
        close_button_visible = {
            bg = bg,
        },
        close_button_selected = {
            bg = bg,
        },
        modified = {
            bg = bg,
        },
        modified_visible = {
            bg = bg,
        },
        modified_selected = {
            bg = bg,
        },
        separator = {
            bg = bg,
        },
        separator_selected = {
            bg = bg,
        },
        separator_visible = {
            bg = bg,
        },
    },
})
