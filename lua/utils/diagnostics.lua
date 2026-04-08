-- utils/diagnostics.lua
local M = {}

function M.setup()
	vim.diagnostic.config({
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = true,
			header = "",
			prefix = "",
		},
	})
end

return M
