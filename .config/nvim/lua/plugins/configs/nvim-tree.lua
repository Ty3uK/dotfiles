
local present, tree = pcall(require, 'nvim-tree')

if not present then
    return
end

tree.setup({
    view = {
        side = 'left',
        width = 45,
    },
})
