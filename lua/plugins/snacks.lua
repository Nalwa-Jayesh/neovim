-- lua/plugins/snacks.lua
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		picker = {
			enabled = true,
			layout = {
				preset = "telescope",
				width = 0.8,
				height = 0.8,
			},
			sources = {
				files = {
					hidden = true, -- Show hidden files like fff
					ignored = true,
					exclude = {
						".git",
						"node_modules",
						"__pycache__",
						"*.pyc",
						"*.o",
						"*.so",
						"*.dylib",
					},
				},
				grep = {
					hidden = true,
					ignored = true,
					exclude = {
						".git",
						"node_modules",
						"__pycache__",
					},
					trim = true,
				},
				git_status = {
					flags = {
						"--modified",
						"--others",
						"--exclude-standard",
					},
				},
			},
		},
	},
	keys = {
		-- Primary search commands
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent Files",
		},

		-- Git-related
		{
			"<leader>gm",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},

		-- Config search
		{
			"<leader>en",
			function()
				Snacks.picker.files({
					cwd = vim.fn.stdpath("config"),
					prompt = "Config: ",
				})
			end,
			desc = "Find Config Files",
		},

		-- Word/selection search
		{
			"<leader>fw",
			function()
				local word = vim.fn.expand("<cword>")
				if word ~= "" then
					Snacks.picker.grep({ find = { pattern = word } })
				end
			end,
			mode = { "n" },
			desc = "Grep Word Under Cursor",
		},
		{
			"<leader>fw",
			function()
				local _, start_pos, end_pos = unpack(vim.fn.getpos("'<"))
				local lines = vim.api.nvim_buf_get_lines(0, start_pos - 1, end_pos, false)
				if #lines > 0 then
					local selection = table.concat(lines, "\n")
					Snacks.picker.grep({ find = { pattern = selection } })
				end
			end,
			mode = { "x" },
			desc = "Grep Visual Selection",
		},

		-- Quickfix
		{
			"<C-q>",
			function()
				Snacks.picker.actions.quickfix()
			end,
			desc = "Send to Quickfix",
			mode = { "n", "i" },
		},

		-- Resume last search
		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume Search",
		},
	},
}
