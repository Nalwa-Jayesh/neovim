return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	keys = {
		{
			"<leader>gg",
			function()
				require("neogit").open()
			end,
			desc = "Neogit",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",

		-- Best diff viewer
		"sindrets/diffview.nvim",

		-- Pick one picker (Telescope shown here)
		"nvim-telescope/telescope.nvim",

		-- Optional but useful for colored git logs
		"m00qek/baleia.nvim",
	},
	opts = {
		disable_hint = false,
		disable_context_highlighting = false,
		disable_commit_confirmation = true,
		auto_refresh = true,

		graph_style = "unicode",

		kind = "tab", -- opens Neogit in its own tab

		commit_editor = {
			kind = "tab",
			show_staged_diff = true,
			staged_diff_split_kind = "vsplit",
		},

		commit_select_view = {
			kind = "tab",
		},

		commit_view = {
			kind = "vsplit",
			verify_commit = os.execute("which gpg") == 0,
		},

		log_view = {
			kind = "tab",
		},

		rebase_editor = {
			kind = "tab",
		},

		reflog_view = {
			kind = "tab",
		},

		merge_editor = {
			kind = "tab",
		},

		description_editor = {
			kind = "auto",
		},

		preview_buffer = {
			kind = "split",
		},

		integrations = {
			diffview = true,
			telescope = true,
		},

		sections = {
			untracked = {
				folded = false,
			},
			unstaged = {
				folded = false,
			},
			staged = {
				folded = false,
			},
			stashes = {
				folded = true,
			},
			unpulled_upstream = {
				folded = true,
			},
			unmerged_upstream = {
				folded = false,
			},
			recent = {
				folded = true,
			},
		},

		mappings = {
			status = {
				["q"] = "Close",
				["<tab>"] = "Toggle",
				["<cr>"] = "GoToFile",
				["s"] = "Stage",
				["u"] = "Unstage",
				["x"] = "Discard",
			},
		},
	},
}
