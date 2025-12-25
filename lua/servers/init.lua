require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"docker_language_server",
		"basedpyright",
		"ruff",
		"stylua",
	},
	automatic_installation = true,
})

-- Get capabilities from blink.cmp
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Load shared LSP utilities
local lsp_utils = require("utils.lsp")

-- Auto-discover server configs
local servers_path = vim.fn.stdpath("config") .. "/lua/servers"
local server_files = vim.fn.readdir(servers_path, [[v:val =~ '\.lua$' && v:val != 'init.lua']])

for _, file in ipairs(server_files) do
	local server_name = file:match("(.+)%.lua$")
	local ok, server_config = pcall(require, "servers." .. server_name)

	if ok then
		-- Merge with capabilities, on_attach, and handlers
		local config = vim.tbl_deep_extend("force", {
			capabilities = capabilities,
			on_attach = lsp_utils.on_attach,
			handlers = lsp_utils.handlers,
		}, server_config)

		vim.lsp.config(server_name, config)
		vim.lsp.enable(server_name)
	else
		vim.notify("Failed to load server config: " .. server_name, vim.log.levels.ERROR)
	end
end
