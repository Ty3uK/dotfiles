return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup()
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
}
