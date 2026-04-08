local M = {}

function M.create_file()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local existing_files = vim.fn.systemlist("find . -type f -not -path '*/.git/*'")
	for i, f in ipairs(existing_files) do
		existing_files[i] = f:gsub("^%./", "")
	end

	-- Build a unique set of all existing directories
	local dirs = {}
	local seen = {}
	for _, f in ipairs(existing_files) do
		local d = vim.fn.fnamemodify(f, ":h")
		if not seen[d] then
			seen[d] = true
			table.insert(dirs, d)
		end
	end

	pickers
		.new({}, {
			prompt_title = "New File",
			finder = finders.new_table({ results = existing_files }),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local input = action_state.get_current_line()
					actions.close(prompt_bufnr)

					if not input or input == "" then
						return
					end

					local parts = vim.split(input, "/")
					local filename = parts[#parts]
					local typed_dir = #parts > 1 and table.concat(parts, "/", 1, #parts - 1) or nil

					local resolved_dir = nil

					if typed_dir then
						-- Find the deepest existing dir that ends with the typed prefix
						local best_match = nil
						local best_depth = -1

						for _, d in ipairs(dirs) do
							-- Check if the real dir ends with what the user typed
							if d == typed_dir or d:sub(-#typed_dir) == typed_dir then
								local depth = select(2, d:gsub("/", "/"))
								if depth > best_depth then
									best_depth = depth
									best_match = d
								end
							end
						end

						resolved_dir = best_match and (vim.fn.getcwd() .. "/" .. best_match)
							or (vim.fn.getcwd() .. "/" .. typed_dir)
					else
						resolved_dir = vim.fn.getcwd()
					end

					if vim.fn.isdirectory(resolved_dir) == 0 then
						vim.fn.mkdir(resolved_dir, "p")
					end

					local filepath = resolved_dir .. "/" .. filename

					if vim.fn.filereadable(filepath) == 0 then
						io.open(filepath, "w"):close()
					end

					vim.cmd("edit " .. vim.fn.fnameescape(filepath))
				end)

				return true
			end,
		})
		:find()
end

return M
