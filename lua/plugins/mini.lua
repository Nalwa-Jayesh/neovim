return {
	--[[{
		"nvim-mini/mini.statusline",
		version = "*",
		opts = {
			use_icons = true,

			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({})
					local git = MiniStatusline.section_git({})
					local diagnostics = MiniStatusline.section_diagnostics({})
					local filename = MiniStatusline.section_filename({})
					local location = MiniStatusline.section_location({})

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=",
						{ hl = mode_hl, strings = { location } },
					})
				end,
			},
		},
	},]]
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "auto",
				globalstatus = true,
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
			},

			sections = {
				lualine_a = {
					{
						"mode",
						separator = "",
					},
				},

				lualine_b = {
					{
						"branch",
						icon = "",
						separator = "",
					},
					{
						"diagnostics",
						separator = "",
					},
				},

				lualine_c = {
					{
						"filename",
						path = 0,
						separator = "",
					},
				},

				lualine_x = {},

				lualine_y = {},

				lualine_z = {
					{
						"location",
						separator = "",
					},
				},
			},
		},
	},
	{
		"nvim-mini/mini.pairs",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{ "nvim-mini/mini.surround", version = "*", opts = {} },
	{ "nvim-mini/mini.move", version = "*", opts = {} },
	{ "nvim-mini/mini.notify", version = "*", opts = {} },
}
