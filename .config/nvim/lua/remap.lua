local options = { silent = true }

-- General
vim.keymap.set("n", "<Left>", "<nop>", options)
vim.keymap.set("n", "<Right>", "<nop>", options)
vim.keymap.set("n", "<Up>", "<nop>", options)
vim.keymap.set("n", "<Down>", "<nop>", options)
vim.keymap.set("n", "<esc>", "<cmd>:noh<cr>", options)
vim.keymap.set("i", "<C-h>", "<C-o>h", options)
vim.keymap.set("i", "<C-j>", "<C-o>j", options)
vim.keymap.set("i", "<C-k>", "<C-o>k", options)
vim.keymap.set("i", "<C-l>", "<C-o>l", options)
