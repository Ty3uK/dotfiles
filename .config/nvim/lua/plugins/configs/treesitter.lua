local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
    return
end

local options = {
    auto_install = true,

    ensure_installed = {
        'lua',
        'rust',
        'javascript',
        'typescript',
        'go',
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = {
        enable = true,
    },
}

treesitter.setup(options)
