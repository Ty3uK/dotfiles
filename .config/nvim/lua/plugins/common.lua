return {
    {
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" },
            keys = {
                {
                    "<leader>he",
                    function()
                        local harpoon = require("harpoon")
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                },
                {
                    "<leader>ha",
                    function()
                        require("harpoon"):list():add()
                    end,
                },
                {
                    "<C-S-N>",
                    function()
                        require("harpoon"):list():next()
                    end,
                },
                {
                    "<C-S-P>",
                    function()
                        require("harpoon"):list():prev()
                    end,
                },
                {
                    "<C-S-1>",
                    function()
                        require("harpoon"):list():select(1)
                    end,
                },
                {
                    "<C-S-2>",
                    function()
                        require("harpoon"):list():select(2)
                    end,
                },
                {
                    "<C-S-3>",
                    function()
                        require("harpoon"):list():select(3)
                    end,
                },
            },
            config = function()
                require("harpoon"):setup()
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
