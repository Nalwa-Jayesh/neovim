-- utils/diagnostics.lua
local M = {}

function M.setup()
	-- Diagnostic configuration
	vim.diagnostic.config({
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = true,
			header = "",
			prefix = "",
		},
	})

	-- Hover handler
	vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
		config = config or {}
		config.border = "rounded"
		return vim.lsp.handlers.hover(err, result, ctx, config)
	end

	-- Signature help handler
	vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
		config = config or {}
		config.border = "rounded"
		return vim.lsp.handlers.signature_help(err, result, ctx, config)
	end
end

return M
