local vkm = vim.keymap

-- General
vkm.set('n', '<Left>', '<nop>', { silent = true, noremap = true })
vkm.set('n', '<Right>', '<nop>', { silent = true, noremap = true })
vkm.set('n', '<Up>', '<nop>', { silent = true, noremap = true })
vkm.set('n', '<Down>', '<nop>', { silent = true, noremap = true })
vkm.set('n', '<esc>', '<cmd>:noh<cr>', { silent = true, noremap = true })
vkm.set('i', '<C-h>', '<C-o>h', { silent = true, noremap = true })
vkm.set('i', '<C-j>', '<C-o>j', { silent = true, noremap = true })
vkm.set('i', '<C-k>', '<C-o>k', { silent = true, noremap = true })
vkm.set('i', '<C-l>', '<C-o>l', { silent = true, noremap = true })

-- Buffers
vkm.set('n', '<Tab>', '<cmd>:BufferLineCycleNext<cr>', { silent = true })
vkm.set('n', '<S-Tab>', '<cmd>:BufferLineCyclePrev<cr>', { silent = true })
vkm.set('n', '<leader>x', '<cmd>:bdelete<cr>', { silent = true })

-- LSP
vkm.set(
    'n',
    'gD',
    '<cmd>Lspsaga peek_definition<cr>',
    { silent = true }
)

vkm.set(
    'n',
    'gd',
    '<cmd>Lspsaga lsp_finder<cr>',
    { silent = true }
)

vkm.set(
    'n',
    '<S-h>',
    '<cmd>Lspsaga hover_doc<cr>',
    { silent = true }
)

vkm.set(
    'n',
    'gl',
    '<cmd>Lspsaga show_line_diagnostics<cr>',
    { silent = true }
)

vkm.set(
    'n',
    'gl',
    '<cmd>Lspsaga show_line_diagnostics<cr>',
    { silent = true }
)

vkm.set(
    'n',
    '<leader>ls',
    function()
        vim.lsp.buf.signature_help()
    end,
    { silent = true }
)


vkm.set(
    'n',
    '<leader>D',
    function()
        vim.lsp.buf.type_definition()
    end,
    { silent = true }
)

vkm.set(
    'n',
    '<leader>ca',
    '<cmd>Lspsaga code_action<cr>',
    { silent = true }
)

vkm.set(
    'n',
    '<leader>ra',
    '<cmd>Lspsaga rename<cr>',
    { silent = true }
)

vkm.set(
    'n',
    '<leader>f',
    function()
        vim.diagnostic.open_float()
    end,
    { silent = true }
)

vkm.set(
    'n',
    '<leader>fm',
    function()
        vim.lsp.buf.format({ async = true })
    end,
    { silent = true }
)

vkm.set(
    'n',
    '<leader>/',
    function()
        require('Comment.api').toggle.linewise.current()
    end,
    { silent = true }
)

vkm.set(
    'v',
    '<leader>/',
    '<ESC><cmd>lua require(\'Comment.api\').toggle.linewise(vim.fn.visualmode())<CR>',
    { silent = true }
)

-- Telescope
vkm.set('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', { silent = true })
vkm.set('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', { silent = true })

-- Git
vkm.set('n', '<leader>gt', '<cmd>LazyGit<cr>', { silent = true })
vkm.set('n', '<leader>gb', '<cmd>Gitsigns blame_line<cr>', { silent = true })

-- NvimTree
vkm.set('n', '<C-n>', '<cmd>NvimTreeFindFileToggle<cr>', { silent = true })
