return {
  {
    {
      "folke/snacks.nvim",
      opts = {
        indent = {
          enabled = true,
          animate = {
            enabled = false,
          },
        },
        scope = {
          enabled = true,
        },
        win = {
          border = "rounded",
          backdrop = false,
        },
      },
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
