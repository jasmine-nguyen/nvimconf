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
			file = {
				follow = true,
				hidden = true,
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
	},
}
