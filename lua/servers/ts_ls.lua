-- servers/ts_ls.lua
return {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
	root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
				languages = { "vue" },
			},
		},
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
}
