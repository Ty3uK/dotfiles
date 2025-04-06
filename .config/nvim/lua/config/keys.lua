vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")

vim.keymap.set("i", "<C-h>", "<C-o>h")
vim.keymap.set("i", "<C-j>", "<C-o>j")
vim.keymap.set("i", "<C-k>", "<C-o>k")
vim.keymap.set("i", "<C-l>", "<C-o>l")

vim.keymap.set("n", "<esc>", "<cmd>:noh<cr>")

vim.keymap.set("n", "<leader>gd", function() Snacks.picker.lsp_definitions() end)
vim.keymap.set("n", "<leader>gr", function() Snacks.picker.lsp_references() end)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>f", function() vim.diagnostic.open_float({ border = "rounded" }) end)
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename)
vim.keymap.set("n", "H", function() vim.lsp.buf.hover({ border = "rounded" }) end)
