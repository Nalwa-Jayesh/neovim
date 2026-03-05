return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
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
				javascript = { "prettier", "prettierd", stop_after_first = false },
				typescript = { "prettier", "prettierd", stop_after_first = false },
				json = { "prettier", "prettierd", stop_after_first = false },
				yaml = { "prettier", "prettierd", stop_after_first = false },
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
