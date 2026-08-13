-- lua/plugins/colorscheme.lua
return {
	"AvengeMedia/base46",
	lazy = false, -- Colorschemes should load early

	-- Define options here instead of in config()
	opts = {
		-- Background settings
		set_background = true, -- automatically sets vim.o.background
		transparency = true, -- set to true for transparent background

		-- Terminal colors
		term_colors = true, -- sets terminal's 16 colors
	},

	-- Config function receives the opts table
	config = function(_, opts)
		require("base46").setup(opts)
		vim.cmd.colorscheme("base46-kanagawa")
	end,
}
--[[ 
return {
	--[[{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme moonfly")
		end,
	},]]
--[[
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        italics = true,
        transparent_background_level = 2,
      })
      vim.cmd("colorscheme everforest")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- try "storm" too, slightly lighter
        transparent = true, -- lets kitty bg_opacity show through
        terminal_colors = true,
      })
      vim.cmd("colorscheme tokyonight-night")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true,
        undercurl = true,
        transparent = true,
        theme = "dragon",
      })
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  {
    "typicode/bg.nvim",
    lazy = false,
  },
  ]]
--[[
  {
		"AvengeMedia/base46",
		lazy = true,
		opts = {},
		config = function(_, opts)
			require("base46").setup(opts)
			vim.cmd.colorscheme("base46-kanagawa-dragon")
		end,
	},]]
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
