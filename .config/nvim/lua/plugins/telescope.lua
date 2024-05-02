return {
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>" },
            { "<leader>lg", "<cmd>Telescope live_grep<cr>" },
            { "<leader>tu", "<cmd>Telescope undo<cr>" },
            { "<leader>tb", "<cmd>Telescope buffers<cr>" },
            { "<leader>tr", "<cmd>Telescope registers<cr>" },
            { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>" },
        },
        config = function()
            local telescope = require("telescope")

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
                pickers = {
                    find_files = {
                        find_command = {
                            "rg",
                            "--files",
                            "--hidden",
                            "--glob",
                            "!**/.git/",
                        },
                    },
                },
                extensions = {
                    file_browser = {
                        initial_mode = "normal",
                        file_ignore_patterns = {},
                        hidden = true,
                        respect_gitignore = false,
                        hijack_netrw = true,
                    },
                    undo = {
                        side_by_side = true,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.65,
                        },
                    },
                },
            })

            local extensions = { "lsp_handlers", "file_browser" }
            for _, ext in pairs(extensions) do
                telescope.load_extension(ext)
            end
        end,
    },
    { "gbrlsnchs/telescope-lsp-handlers.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
}
