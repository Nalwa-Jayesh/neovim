local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

local treegroup = vim.api.nvim_create_augroup("treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = treegroup,
	callback = function()
		pcall(vim.treesitter.start)
	end,
	desc = "Enable treesitter highlighting",
})

vim.api.nvim_create_autocmd("FileType", {
	group = treegroup,
	callback = function()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
	desc = "Enable treesitter indentation",
})

vim.api.nvim_create_autocmd("FileType", {
	group = treegroup,
	callback = function()
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
	end,
	desc = "Enable treesitter folds",
})
