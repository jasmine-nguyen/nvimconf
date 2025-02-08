local api = vim.api
local fn = vim.fn

---Notify user
---@param msg string
---@param level number
local function notify_with_title(msg, level)
	vim.notify(string.format("%s", msg), level)
end

---Copy text to clipboard with notification
---@param text string
---@param description string
local function copy_to_clipboard(text, description)
	fn.setreg("+", text)
	notify_with_title(string.format("Copied %s to clipboard", description), vim.log.levels.INFO)
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			autokeys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
			preset = {
				header = [[
Never trust an atom.
They make up everything.
]],
			},
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = true },
		indent = {
			enabled = true,
			chunk = {
				enabled = true,
				hl = "SnacksIndentChunk",
				char = {
					corner_top = "╭",
					corner_bottom = "╰",
					horizontal = "─",
					vertical = "│",
					arrow = "─",
				},
			},
		},
		lazygit = { enabled = true },
		picker = {
			actions = {
				copy_dir = function(picker)
					local dir = picker:dir()
					if not dir then
						return
					end
					copy_to_clipboard(dir, string.format("value of '%s'", dir))
				end,
				copy_name = function(picker)
					local item = picker:current()
					if not item then
						return
					end
					copy_to_clipboard(item.name, string.format("variable '%s' name", item.name))
					picker:close()
				end,
			},
			enabled = true,
			jump = {
				tagstack = true,
				reuse_win = true,
			},
			git_files = { untracked = true, submodule = true },
			matcher = {
				frecency = true,
			},
			sources = {
				explorer = {
					auto_close = true,
				},
			},
			win = {
				list = {
					keys = {
						["<leader>cd"] = { "copy_dir", mode = { "n" }, desc = "copy current directory" },
						["<leader>cn"] = { "copy_name", mode = { "n" }, desc = "copy current file name" },
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "open lazygit",
		},
		{
			"<leader>sf",
			function()
				Snacks.picker.files()
			end,
			desc = "find files",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "grep",
		},
		{
			"<leader>sG",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "grep word",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "grep open buffers",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "lsp symbols",
		},
		{
			"\\",
			function()
				Snacks.picker.explorer()
			end,
			desc = "toggle snacks explorer",
		},
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "search Todo",
		},
		{
			"<leader>sT",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "search Todo/Fix/Fixme",
		},
	},
}
