local h = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")

local DIAGNOSTICS_ON_SAVE = methods.internal.DIAGNOSTICS_ON_SAVE

return h.make_builtin({
    name = "biome",
    meta = {
        url = "https://biomejs.dev",
        description = "Formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, CSS and GraphQL.",
        notes = {
            "Currently support only JavaScript, TypeScript, JSON, CSS and GraphQL. See status [here](https://biomejs.dev/internals/language-support/)",
        },
    },
    method = DIAGNOSTICS_ON_SAVE,
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc", "css", "graphql" },
    generator_opts = {
        command = "biome",
        args = {
            "check",
            "--reporter=github",
            "$FILENAME",
        },
        ignore_stderr = true,
        format = "line",
        check_exit_code = function(code)
            return code ~= 1
        end,
        on_output = function(line, params)
            if string.sub(line, 1, 2) ~= "::" then
                return nil
            end
            return h.diagnostics.from_pattern(
                [[^::(%w+) title=(.*),file=(.*),line=(%d+),endLine=(%d+),col=(%d+),endColumn=(%d+)::(.*):]],
                { "severity", "code", "filename", "row", "end_row", "col", "end_col", "message" },
                {
                    severities = {
                        ["error"] = h.diagnostics.severities.error,
                        ["warning"] = h.diagnostics.severities.warning,
                    },
                }
            )(line, params)
        end,
        dynamic_command = cmd_resolver.from_node_modules(),
        cwd = h.cache.by_bufnr(function(params)
            return u.root_pattern("rome.json", "biome.json", "biome.jsonc")(params.bufname)
        end),
    },
    factory = h.generator_factory,
})
