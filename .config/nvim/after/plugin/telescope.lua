local telescope = require("telescope");

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
        file_ignore_patterns = { "node_modules/", ".git/" },
    },
    extensions = {
        undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.65,
            },
        },
    },
})

local extensions = { "file_browser", "undo" }
for _, ext in pairs(extensions) do
    telescope.load_extension(ext)
end
