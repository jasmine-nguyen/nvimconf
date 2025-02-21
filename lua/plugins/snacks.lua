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
	notify_with_title(string.format("Yanked %s", description), vim.log.levels.INFO)
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Dashboard
		dashboard = {
			enabled = true,
			autokeys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
			preset = {
				header = [[
Never trust an atom.
They make up everything.
]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		-- Explorer
		explorer = { enabled = true },
		-- Indent
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
		-- Lazygit
		lazygit = {
			enabled = true,
			configure = true,
			config = {
				os = { editPreset = "nvim-remote" },
				gui = {
					-- set to an empty string "" to disable icons
					nerdFontsVersion = "3",
				},
			},
			win = {
				style = "lazygit",
				height = 0.9,
			},
		},
		-- Picker
		picker = {
			actions = {
				copy_dir = function(picker)
					local dir = picker:dir()
					if not dir then
						return
					end
					copy_to_clipboard(dir, string.format("directory '%s'", dir))
				end,
				copy_name = function(picker)
					local item = picker:current()
					if not item then
						return
					end
					copy_to_clipboard(item.file, string.format("filepath: '%s'", item.file))
					picker:close()
				end,
			},
			files = {
				follow = true,
				hidden = true,
			},
			enabled = true,
			jump = {
				tagstack = true,
				reuse_win = true,
			},
			git_files = { untracked = true, submodules = true },
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
						["<leader>yp"] = { "copy_dir", mode = { "n" }, desc = "copy current directory" },
						["<leader>yn"] = { "copy_name", mode = { "n" }, desc = "copy current file name" },
					},
				},
			},
		},
		-- Terminal
		terminal = {
			enabled = true,
			win = {
				style = "float",
				backdrop = 60,
				border = "rounded",
				width = 0.6,
				height = 0.6,
				zindex = 100,
			},
		},
		-- Zen
		zen = { enabled = true, toggles = { dim = false } },
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
			desc = "search files",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "search text",
		},
		{
			"<leader>sG",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "search text under cursor",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "search open buffers",
		},
		{
			"E",
			function()
				Snacks.picker.explorer()
			end,
			desc = "toggle explorer",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "search marks",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "search icons",
		},
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "search todo",
		},
		{
			"<leader>sF",
			function()
				Snacks.picker.todo_comments({ keywords = { "FIX", "FIXME" } })
			end,
			desc = "search fixme",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "toggle terminal",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "toggle zen mode",
		},
	},
}
