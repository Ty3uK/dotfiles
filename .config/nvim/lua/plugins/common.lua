return {
    {
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
            config = function()
                local harpoon = require("harpoon")
                harpoon:setup()

                -- basic telescope configuration
                local conf = require("telescope.config").values
                local function toggle_telescope(harpoon_files)
                    local file_paths = {}
                    for _, item in ipairs(harpoon_files.items) do
                        table.insert(file_paths, item.value)
                    end

                    require("telescope.pickers")
                        .new({}, {
                            prompt_title = "Harpoon",
                            finder = require("telescope.finders").new_table({
                                results = file_paths,
                            }),
                            previewer = conf.file_previewer({}),
                            sorter = conf.generic_sorter({}),
                            initial_mode = "normal",
                        })
                        :find()
                end

                vim.keymap.set("n", "<C-h>", function()
                    harpoon:list():add()
                end, {noremap = true})
                vim.keymap.set("n", "<CS-P>", function()
                    harpoon:list():prev()
                end, {noremap = true})
                vim.keymap.set("n", "<CS-N>", function()
                    harpoon:list():next()
                end, {noremap = true})
                vim.keymap.set("n", "<C-e>", function()
                    toggle_telescope(harpoon:list())
                end, { desc = "Open harpoon window" })
            end,
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
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
            end,
        },
        {
            "mbbill/undotree",
            keys = {
                {
                    "<leader>u",
                    function()
                        vim.cmd("UndotreeToggle")
                    end,
                },
            },
        },
    },
}
