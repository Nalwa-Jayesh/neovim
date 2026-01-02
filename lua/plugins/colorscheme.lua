return {
	{
		"typicode/bg.nvim",
		lazy = false,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true,
				undercurl = true,
				transparent = false,
				theme = "dragon",
			})
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	--[[{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},]]
	--[[ {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  }
  ]]
}
