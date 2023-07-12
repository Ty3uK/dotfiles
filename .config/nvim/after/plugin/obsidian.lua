require("obsidian").setup({
    dir = "/Users/ty3uk/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main",
    completion = {
        nvim_cmp = true,
        min_chars = 2,
        new_notes_location = "current_dir",
    },
    finder = "telescope.nvim",
})
