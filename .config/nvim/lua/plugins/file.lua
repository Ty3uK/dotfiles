return {
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/snacks.nvim"
    },
    opts = {
      open_for_directories = true,
    },
    keys = {
      { "<leader>fb", "<cmd>Yazi<cr>" },
    },
  },
};
