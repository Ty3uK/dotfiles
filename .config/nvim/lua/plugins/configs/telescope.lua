local present, telescope = pcall(require, 'telescope')

if not present then
    return
end

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '-L',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
        },
        file_ignore_patterns = { 'node_modules', '.git' },
    },
})
