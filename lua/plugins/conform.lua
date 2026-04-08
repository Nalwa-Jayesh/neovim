-- lua/plugins/conform.lua
return {
    spec = {
        src = "https://github.com/stevearc/conform.nvim",
    },
    setup = function()
        require("conform").setup({
            formatters = {
                ruff = {
                    command = "ruff",
                    args = {
                        "format",
                        "--stdin-filename",
                        "$FILENAME",
                        "-",
                    },
                    stdin = true,
                },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff" },
                c = { "clang_format" },
                javascript = { "prettier", "prettierd", stop_after_first = true },
                vue = { "prettier", "prettierd", stop_after_first = true },
                toml = { "prettier", "prettierd", stop_after_first = true },
                typescript = { "prettier", "prettierd", stop_after_first = true },
                astro = { "prettier", "prettierd", stop_after_first = true },
                json = { "prettier", "prettierd", stop_after_first = true },
                yaml = { "prettier", "prettierd", stop_after_first = true },
                markdown = { "prettier", "prettierd", stop_after_first = false },
                golang = { "gofumpt" },
            },
            format_on_save = {
                timeout_ms = 5000,
                lsp_fallback = true,
            },
        })
    end,
}
