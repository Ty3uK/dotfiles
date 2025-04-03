return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        enabled = true,
      },
    },
    keys = {
      { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end },
      { "<leader>lg", function() Snacks.picker.grep({ finder = "grep", regex = false, hidden = true }) end },
      { "<leader>tb", function() Snacks.picker.buffers() end },
    },
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    opts = {
      open_for_directories = true,
    },
    keys = {
      { "<leader>fb", "<cmd>Yazi<cr>" },
    },
  },
}
