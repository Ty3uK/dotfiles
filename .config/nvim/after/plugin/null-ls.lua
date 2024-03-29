local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local u = require("null-ls.utils")

local eslint_d_config = {
    cwd = h.cache.by_bufnr(function(params)
        return u.root_pattern("package.json")(params.bufname)
    end),
    condition = function(utils, _)
        return utils.root_has_file(
            "eslint.config.js",
            ".eslintrc",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc.json"
        )
    end,
}

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.eslint_d.with(eslint_d_config),
        null_ls.builtins.diagnostics.eslint_d.with(eslint_d_config),
        null_ls.builtins.code_actions.eslint_d.with(eslint_d_config),

        null_ls.builtins.formatting.prettierd,

        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.formatting.stylua,

        null_ls.builtins.formatting.rustfmt,
    },
})
