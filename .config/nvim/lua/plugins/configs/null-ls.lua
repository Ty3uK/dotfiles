local present, null_ls = pcall(require, 'null-ls')

if not present then
    return
end

local h = require("null-ls.helpers")
local u = require("null-ls.utils")

local eslint_d_config = {
    cwd = h.cache.by_bufnr(function(params)
        return u.root_pattern(
            "eslint.config.js",
            ".eslintrc",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc.json",
            "package.json"
        )(params.bufname)
    end),
    condition = function(utils)
        return utils.root_has_file({
            "eslint.config.js",
            ".eslintrc",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc.json",
        })
    end,
}

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.eslint_d.with(eslint_d_config),
        null_ls.builtins.diagnostics.eslint_d.with(eslint_d_config),
        null_ls.builtins.code_actions.eslint_d.with(eslint_d_config),
    },
})
