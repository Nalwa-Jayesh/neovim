-- lua/servers/gopls.lua
return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),

	settings = {
		gopls = {
			-- Analyses
			analyses = {
				unusedparams = true,
				shadow = true,
				unusedwrite = true,
				useany = true,
				fieldalignment = false,
				nilness = true,
				ST1003 = true,
				undeclaredname = true,
				fillreturns = true,
				nonewvars = true,
				unusedvariable = true,
			},

			-- Static analysis
			staticcheck = true,

			-- Code lens
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},

			-- Completion settings
			usePlaceholders = true,
			completeUnimported = true,
			completionBudget = "500ms",
			matcher = "Fuzzy",
			symbolMatcher = "FastFuzzy",
			deepCompletion = true,

			-- Formatting
			gofumpt = true,

			-- Inlay hints
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},

			-- Semantic tokens
			semanticTokens = true,

			-- Directory filters
			directoryFilters = {
				"-**/node_modules",
				"-**/.git",
				"-**/vendor",
				"-**/testdata",
			},
		},
	},

	-- Flags for gopls itself
	flags = {
		debounce_text_changes = 150,
	},
}
