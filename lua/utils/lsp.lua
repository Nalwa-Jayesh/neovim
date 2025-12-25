-- utils/lsp.lua
local M = {}

-- LSP handlers
M.handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	}),
}

-- LSP on_attach function
M.on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, silent = true }
	local builtin = require("telescope.builtin")

	-- LSP Navigation with Telescope
	vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
	vim.keymap.set("n", "go", builtin.lsp_type_definitions, opts)
	vim.keymap.set("n", "gr", builtin.lsp_references, opts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

	-- Hover and documentation
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	-- Code actions and refactoring
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	-- Diagnostics
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	-- Format on save with conform
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				require("conform").format({ bufnr = bufnr })
			end,
		})
	end

	-- Document highlighting
	if client.supports_method("textDocument/documentHighlight") then
		local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			group = group,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = bufnr,
			group = group,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

return M
