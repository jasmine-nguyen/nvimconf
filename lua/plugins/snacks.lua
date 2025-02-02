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
		indent = { enabled = true },
		lazygit = { enabled = true },
		picker = {
			enabled = true,
			git_files = { untracked = true, submodule = true },
			sources = {
				explorer = {
					auto_close = true,
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
