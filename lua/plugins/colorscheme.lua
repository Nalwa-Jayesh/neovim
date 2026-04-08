return {
	spec = {
		{ src = "https://github.com/typicode/bg.nvim" },
		{ src = "https://github.com/rebelot/kanagawa.nvim" },
		-- "https://github.com/catppuccin/nvim",
		-- { src = "https://github.com/rose-pine/neovim" },
	},
	setup = function()
		--require("kanagawa").setup({
		--	compile = true,
		--	undercurl = true,
		--	transparent = false,
		--	theme = "dragon",
		--})
		vim.cmd("colorscheme kanagawa-dragon")
		-- Default options:

		-- vim.cmd.colorscheme("catppuccin-mocha")
		-- vim.cmd("colorscheme rose-pine-moon")
	end,
}
