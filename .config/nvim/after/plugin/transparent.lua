local extra_groups = {
    "lualine_c_normal",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "DiagnosticVirtualTextError",
    "DiagnosticVirtualTextWarn",
    "DiagnosticVirtualTextInfo",
    "DiagnosticVirtualTextHint",
    "DiffAdd",
    "DiffChange",
    "DiffDelete",
    "DiffChangeDelete",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "TelescopeBorder",
    "Pmenu",
    "TroubleNormal",
}

local lualine_lsp_groups = { "error", "warn", "hint", "info" }
local lualine_modes = { "normal", "insert", "command", "visual" }
for _, group in pairs(lualine_lsp_groups) do
   for _, mode in pairs(lualine_modes) do
        table.insert(extra_groups, "lualine_y_diagnostics_" .. group .. "_" .. mode)
   end
end

require("transparent").setup({
    extra_groups = extra_groups,
})

vim.cmd(":TransparentEnable")
