-- plugins/telescope.lua
return {
	spec = {
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
		{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.2.0" },
		{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	setup = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "ivy",
				},
			},
			extensions = {
				fzf = {},
			},
		})
		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>en", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find in config" })

		require("config.telescope.multigrep").setup()
	end,
}
