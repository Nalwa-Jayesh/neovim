-- lua/plugins/blink.lua
return {
	spec = {
		{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
		{ src = "https://github.com/L3MON4D3/LuaSnip" },
		{ src = "https://github.com/rafamadriz/friendly-snippets" },
	},
	setup = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		local luasnip = require("luasnip")
		luasnip.filetype_extend("typescript", { "javascript" })
		luasnip.filetype_extend("typescriptreact", { "javascript", "javascriptreact" })

		require("blink.cmp").setup({
			keymap = { preset = "default" },
			snippets = {
				preset = "luasnip",
				expand = function(snippet)
					luasnip.lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return luasnip.jumpable(filter.direction)
					end
					return luasnip.in_snippet()
				end,
				jump = function(direction)
					luasnip.jump(direction)
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
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				prebuilt_binaries = {
					download = true,
				},
			},
		})
	end,
}
