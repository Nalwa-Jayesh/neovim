return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	config = function()
		require("crates").setup({
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
			completion = {
				crates = {
					enabled = true,
					min_chars = 3,
					max_results = 8,
				},
				blink = {
					use_custom_kind = true,
					kind_text = {
						version = "Version",
						feature = "Feature",
					},
					kind_highlight = {
						version = "BlinkCmpKindVersion",
						feature = "BlinkCmpKindFeature",
					},
					kind_icon = {
						version = " ",
						feature = " ",
					},
				},
			},
		})

		local crates = require("crates")
		local opts = { silent = true, buffer = true }

		vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
		vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
		vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

		vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
		vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
		vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
		vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
		vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
		vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

		vim.keymap.set("n", "<leader>cD", crates.open_documentation, opts)
		vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opts)
	end,
}
