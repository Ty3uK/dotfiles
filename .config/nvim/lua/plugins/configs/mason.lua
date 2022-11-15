local present1, mason = pcall(require, 'mason')
local present2, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not (present1 and present2) then
    return
end

local options = {
    ensure_installed = { 'lua-language-server' }, -- not an option from mason.nvim

    PATH = 'skip',

    ui = {
        icons = {
            package_pending = ' ',
            package_installed = ' ',
            package_uninstalled = ' ﮊ',
        },

        keymaps = {
            toggle_server_expand = '<CR>',
            install_server = 'i',
            update_server = 'u',
            check_server_version = 'c',
            update_all_servers = 'U',
            check_outdated_servers = 'C',
            uninstall_server = 'X',
            cancel_installation = '<C-c>',
        },
    },

    max_concurrent_installers = 10,
}

vim.api.nvim_create_augroup('_mason', { clear = true })

vim.api.nvim_create_user_command('MasonInstallAll', function()
    vim.cmd('MasonInstall ' .. table.concat(options.ensure_installed, ' '))
end, {})

mason.setup(options)
mason_lspconfig.setup()
