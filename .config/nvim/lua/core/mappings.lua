-- Buffers
vim.keymap.set('n', '<Tab>', '<cmd>:BufferLineCycleNext<cr>', { silent = true })
vim.keymap.set('n', '<S-Tab>', '<cmd>:BufferLineCyclePrev<cr>', { silent = true })
vim.keymap.set('n', '<leader>x', '<cmd>:bdelete<cr>', { silent = true })

-- LSP
vim.keymap.set(
    'n',
    'gD',
    '<cmd>Lspsaga peek_definition<cr>',
    { silent = true }
)

vim.keymap.set(
    'n',
    'gd',
    '<cmd>Lspsaga lsp_finder<cr>',
    { silent = true }
)

vim.keymap.set(
    'n',
    '<S-h>',
    '<cmd>Lspsaga hover_doc<cr>',
    { silent = true }
)

vim.keymap.set(
    'n',
    'gl',
    '<cmd>Lspsaga show_line_diagnostics<cr>',
    { silent = true }
)

vim.keymap.set(
    'n',
    'gl',
    '<cmd>Lspsaga show_line_diagnostics<cr>',
    { silent = true }
)

vim.keymap.set(
    'n',
    '<leader>ls',
    function()
        vim.lsp.buf.signature_help()
    end,
    { silent = true }
)


vim.keymap.set(
    'n',
    '<leader>D',
    function()
        vim.lsp.buf.type_definition()
    end,
    { silent = true }
)

vim.keymap.set(
    'n',
    '<leader>ca',
    '<cmd>Lspsaga code_action<cr>',
    { silent = true }
)

vim.keymap.set(
    'n',
    '<leader>f',
    function()
        vim.diagnostic.open_float()
    end,
    { silent = true }
)

vim.keymap.set(
    'n',
    '<leader>fm',
    function()
        vim.lsp.buf.format({ async = true })
    end,
    { silent = true }
)

vim.keymap.set(
    'n',
    '<leader>/',
    function()
        require('Comment.api').toggle.linewise.current()
    end,
    { silent = true }
)

vim.keymap.set(
    'v',
    '<leader>/',
    '<ESC><cmd>lua require(\'Comment.api\').toggle.linewise(vim.fn.visualmode())<CR>',
    { silent = true }
)

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', { silent = true })
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', { silent = true })

-- Git
vim.keymap.set('n', '<leader>gt', '<cmd>LazyGit<cr>', { silent = true })
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<cr>', { silent = true })
