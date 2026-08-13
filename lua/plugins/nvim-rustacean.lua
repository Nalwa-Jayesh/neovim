return {
	"mrcjkb/rustaceanvim",
	version = "^9",
	lazy = false,
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.g.rustaceanvim = {
			tools = {
				hover_actions = {
					auto_focus = true,
				},
				code_actions = {
					ui_select_fallback = true,
				},
			},

			server = {
				capabilities = capabilities,

				on_attach = function(client, bufnr)
					-- reuse your shared on_attach (keymaps, formatting, etc.)
					require("utils.lsp").on_attach(client, bufnr)

					-- inlay hints
					if client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end

					-- diagnostics float on cursor hold
					vim.api.nvim_create_autocmd("CursorHold", {
						buffer = bufnr,
						callback = function()
							vim.diagnostic.open_float(nil, {
								focusable = false,
								close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
								border = "rounded",
								source = "always",
								prefix = " ",
								scope = "cursor",
							})
						end,
					})
				end,

				default_settings = {
					["rust-analyzer"] = {
						inlayHints = {
							chainingHints = { enable = true },
							parameterHints = { enable = true },
							typeHints = { enable = true },
							closureReturnTypeHints = { enable = "with_block" },
							lifetimeElisionHints = { enable = "skip_trivial", useParameterNames = true },
							reborrowHints = { enable = "mutable" }, -- "never"|"always"|"mutable"
							renderColons = true, -- plain boolean
							closingBraceHints = { enable = true, minLines = 25 },
							maxLength = 25, -- plain number (null to disable)
						},

						diagnostics = {
							enable = true,
							experimental = { enable = true },
							styleLints = { enable = true },
						},

						checkOnSave = true,
						check = {
							command = "clippy",
							extraArgs = { "--no-deps" },
							features = "all",
						},

						cargo = {
							allFeatures = true,
							allTargets = true,
							loadOutDirsFromCheck = true,
							buildScripts = { enable = true },
						},

						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["tokio"] = { "main", "test" },
							},
						},

						completion = {
							callable = { snippets = "fill_arguments" },
						},

						lens = {
							enable = true,
							run = { enable = true },
							debug = { enable = true },
							implementations = { enable = true },
						},
					},
				},
			},

			dap = {
				autoload_configurations = true,
			},
		}
	end,
}
