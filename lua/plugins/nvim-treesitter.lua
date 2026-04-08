-- lua/plugins/treesitter.lua
return {
  spec = {
    src="nvim-treesitter/nvim-treesitter",
  },
  setup = function()
    require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})
		require("nvim-treesitter").install({
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"python",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"rust",
			"regex",
			"go",
			"gomod",
			"gosum",
			"gotmpl",
		})
  end,
}
