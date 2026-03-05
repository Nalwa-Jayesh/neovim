return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets", -- optional but recommended snippet collection
			},
			config = function()
				local luasnip = require("luasnip")

				require("luasnip.loaders.from_vscode").lazy_load()

				-- Optional: extend filetypes (e.g. use jsx snippets in tsx)
				luasnip.filetype_extend("typescript", { "javascript" })
				luasnip.filetype_extend("typescriptreact", { "javascript", "javascriptreact" })
			end,
		},
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },
		snippets = {
			preset = "luasnip",
			-- Ensure blink expands and jumps via luasnip
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true },
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},
					components = {
						label_description = {
							width = { max = 30 },
							text = function(ctx)
								return ctx.label_detail or ""
							end,
							highlight = "Comment",
						},
					},
				},
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
