return {
  spec = {
    {src = "https://github.com/nvim-tree/nvim-web-devicons"},
    {src = "https://github.com/stevearc/oil.nvim"},
  },
  setup = function()
    require("oil").setup()
  end,
}
