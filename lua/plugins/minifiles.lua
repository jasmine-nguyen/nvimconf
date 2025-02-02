return {
	{
		"echasnovski/mini.icons",
		enabled = false,
		opts = {},
	},
	{
		"echasnovski/mini.files",
		enabled = false,
		opts = function(_, opts)
			-- Override some default mappings
			opts.mappings = vim.tbl_deep_extend("force", opts.mappings or {}, {
				close = "<esc>",
				go_in_plus = "l",
				go_in = "<CR>",
				go_out = "H",
				go_out_plus = "h",
			})

			opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
				use_as_default_explorer = true,
				permanent_delete = true,
			})

			return opts
		end,
		keys = {
			{
				"\\",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files (Directory of Current File)",
			},
			{
				"F",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
		},

		config = function(_, opts)
			require("mini.files").setup(opts)
			local map_split = function(buf_id, lhs, direction, close_on_file)
				local rhs = function()
					local new_target_window
					local cur_target_window = require("mini.files").get_explorer_state().target_window
					if cur_target_window ~= nil then
						vim.api.nvim_win_call(cur_target_window, function()
							vim.cmd("belowright " .. direction .. " split")
							new_target_window = vim.api.nvim_get_current_win()
						end)

						require("mini.files").set_target_window(new_target_window)
						require("mini.files").go_in({ close_on_file = close_on_file })
					end
				end

				local desc = "Open in " .. direction .. " split"
				if close_on_file then
					desc = desc .. " and close"
				end
				vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "minifiles",
				callback = function()
					-- Import 'mini.files' module
					local mini_files = require("mini.files")

					-- Copy the current file or directory to the lamw25wmal system clipboard
					-- NOTE: This works only on macOS
					vim.keymap.set("n", "yc", function()
						-- Get the current entry (file or directory)
						local curr_entry = mini_files.get_fs_entry()
						if curr_entry then
							local path = curr_entry.path
							-- Escape the path for shell command
							local escaped_path = vim.fn.fnameescape(path)
							-- Build the osascript command to copy the file or directory to the clipboard
							local cmd =
								string.format([[osascript -e 'set the clipboard to POSIX file "%s"' ]], escaped_path)
							local result = vim.fn.system(cmd)
							if vim.v.shell_error ~= 0 then
								vim.notify("Copy failed: " .. result, vim.log.levels.ERROR)
							else
								vim.notify(path, vim.log.levels.INFO)
								vim.notify("Copied to system clipboard", vim.log.levels.INFO)
							end
						else
							vim.notify("No file or directory selected", vim.log.levels.WARN)
						end
					end, { buffer = true, noremap = true, silent = true, desc = "Copy file/directory to clipboard" })

					vim.keymap.set("n", "yz", function()
						local curr_entry = require("mini.files").get_fs_entry()
						if curr_entry then
							local path = curr_entry.path
							local name = vim.fn.fnamemodify(path, ":t") -- Extract the file or directory name
							local parent_dir = vim.fn.fnamemodify(path, ":h") -- Get the parent directory
							local timestamp = os.date("%y%m%d%H%M%S") -- Append timestamp to avoid duplicates
							local zip_path = string.format("/tmp/%s_%s.zip", name, timestamp) -- Path in macOS's tmp directory
							-- Create the zip file
							local zip_cmd = string.format(
								"cd %s && zip -r %s %s",
								vim.fn.shellescape(parent_dir),
								vim.fn.shellescape(zip_path),
								vim.fn.shellescape(name)
							)
							local result = vim.fn.system(zip_cmd)
							if vim.v.shell_error ~= 0 then
								vim.notify("Failed to create zip file: " .. result, vim.log.levels.ERROR)
								return
							end
							-- Copy the zip file to the system clipboard
							local copy_cmd = string.format(
								[[osascript -e 'set the clipboard to POSIX file "%s"' ]],
								vim.fn.fnameescape(zip_path)
							)
							local copy_result = vim.fn.system(copy_cmd)
							if vim.v.shell_error ~= 0 then
								vim.notify(
									"Failed to copy zip file to clipboard: " .. copy_result,
									vim.log.levels.ERROR
								)
								return
							end
							vim.notify(zip_path, vim.log.levels.INFO)
							vim.notify("Zipped and copied to clipboard: ", vim.log.levels.INFO)
						else
							vim.notify("No file or directory selected", vim.log.levels.WARN)
						end
					end, { buffer = true, noremap = true, silent = true, desc = "Zip and copy to clipboard" })

					-- Paste the current file or directory from the system clipboard into the current directory in mini.files
					-- NOTE: This works only on macOS
					vim.keymap.set("n", "P", function()
						vim.notify("Starting the paste operation...", vim.log.levels.INFO)
						if not mini_files then
							vim.notify("mini.files module not loaded.", vim.log.levels.ERROR)
							return
						end
						local curr_entry = mini_files.get_fs_entry() -- Get the current file system entry
						if not curr_entry then
							vim.notify("Failed to retrieve current entry in mini.files.", vim.log.levels.ERROR)
							return
						end
						local curr_dir = curr_entry.fs_type == "directory" and curr_entry.path
							or vim.fn.fnamemodify(curr_entry.path, ":h") -- Use parent directory if entry is a file
						vim.notify("Current directory: " .. curr_dir, vim.log.levels.INFO)
						local script = [[
            tell application "System Events"
              try
                set theFile to the clipboard as alias
                set posixPath to POSIX path of theFile
                return posixPath
              on error
                return "error"
              end try
            end tell
          ]]
						local output = vim.fn.system("osascript -e " .. vim.fn.shellescape(script)) -- Execute AppleScript command
						if vim.v.shell_error ~= 0 or output:find("error") then
							vim.notify("Clipboard does not contain a valid file or directory.", vim.log.levels.WARN)
							return
						end
						local source_path = output:gsub("%s+$", "") -- Trim whitespace from clipboard output
						if source_path == "" then
							vim.notify("Clipboard is empty or invalid.", vim.log.levels.WARN)
							return
						end
						local dest_path = curr_dir .. "/" .. vim.fn.fnamemodify(source_path, ":t") -- Destination path in current directory
						local copy_cmd = vim.fn.isdirectory(source_path) == 1 and { "cp", "-R", source_path, dest_path }
							or { "cp", source_path, dest_path } -- Construct copy command
						local result = vim.fn.system(copy_cmd) -- Execute the copy command
						if vim.v.shell_error ~= 0 then
							vim.notify("Paste operation failed: " .. result, vim.log.levels.ERROR)
							return
						end
						vim.notify("Pasted " .. source_path .. " to " .. dest_path, vim.log.levels.INFO)
						mini_files.synchronize() -- Refresh mini.files to show updated directory content
						vim.notify("Paste operation completed successfully.", vim.log.levels.INFO)
					end, { buffer = true, noremap = true, silent = true, desc = "Paste from clipboard" })

					-- Define <M-c> to copy the current file or directory path (relative to home) to clipboard
					vim.keymap.set("n", "<M-c>", function()
						-- Get the current entry (file or directory)
						local curr_entry = mini_files.get_fs_entry()
						if curr_entry then
							-- Convert path to be relative to home directory
							local home_dir = vim.fn.expand("~")
							local relative_path = curr_entry.path:gsub("^" .. home_dir, "~")
							vim.fn.setreg("+", relative_path) -- Copy the relative path to the clipboard register
							vim.notify(relative_path, vim.log.levels.INFO)
							vim.notify("Path copied to clipboard: ", vim.log.levels.INFO)
						else
							vim.notify("No file or directory selected", vim.log.levels.WARN)
						end
					end, { buffer = true, noremap = true, silent = true, desc = "Copy relative path to clipboard" })
				end,
			})

			-- Open file in split
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id

					-- map_split(buf_id, "<leader>h", "horizontal", false)
					-- map_split(buf_id, "<leader>v", "vertical", false)
					map_split(buf_id, "S", "vertical", true)
					map_split(buf_id, "D", "horizontal", true)
				end,
			})
		end,
	},
}
