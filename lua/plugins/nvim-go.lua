return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		-- Format on save with goimports
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})

		-- Setup go.nvim
		require("go").setup({
			-- Disable go.nvim's default LSP keymaps since we use our own from utils/lsp
			lsp_keymaps = false,

			-- Use go.nvim's gopls setup
			lsp_cfg = true,

			-- Use our modular on_attach function
			lsp_on_attach = require("utils.lsp").on_attach,

			-- Disable go.nvim's document formatting since we handle it with the autocmd above
			lsp_document_formatting = false,

			-- Enable other go.nvim features
			lsp_inlay_hints = {
				enable = true,
			},
			dap_debug = true,
			dap_debug_keymap = true,
			dap_debug_gui = true,

			-- Other useful settings
			trouble = true, -- set to true if you use trouble.nvim
			luasnip = true, -- enable go.nvim's luasnip snippets
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
