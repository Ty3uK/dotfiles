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

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options)
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", options)
vim.keymap.set("n", "<leader>p", "<cmd>Telescope file_browser path=%:p:h<cr>", options)
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", options)

-- Tabs
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", options)
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", options)
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", options)

-- LSP
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", options)
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga lsp_finder<cr>", options)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", options)
vim.keymap.set("n", "<leader>f", "<cmd>Lspsaga show_line_diagnostics<cr>", options)
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, options)
vim.keymap.set("n", "<leader>ra", "<cmd>Lspsaga rename<cr>", options)
vim.keymap.set("n", "H", "<cmd>Lspsaga hover_doc<cr>", options)

-- Git
vim.keymap.set("n", "<leader>gt", "<cmd>LazyGit<cr>", options)
vim.keymap.set("n", "<leader>gb", require("gitsigns").blame_line, options)

-- Generic
vim.keymap.set("n", "<leader>/", require("Comment.api").toggle.linewise.current, options)
vim.keymap.set("v", "<leader>/", "<Esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", options)
