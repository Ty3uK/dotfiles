local extra_groups = {
    "BufferLineFill",
    "Pmenu",
}

-- lualine
local modes = { "normal", "visual", "replace", "insert", "command" }
for _, mode in ipairs(modes) do
    table.insert(extra_groups, "lualine_c_" .. mode)
end

-- gitsigns
local diff_mode = { "Add", "Change", "Delete", "ChangeDelete" }
for _, mode in ipairs(diff_mode) do
    table.insert(extra_groups, "Diff" .. mode)
end

require("transparent").setup({
    extra_groups = extra_groups,
})

vim.cmd(":TransparentEnable")
