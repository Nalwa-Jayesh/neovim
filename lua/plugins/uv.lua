return {
	spec = {
src = "benomahony/uv.nvim"},
	setup = function()
		require("uv").setup({
			ft = { "python" },
			picker_integration = true,
		})
	end,
}
