return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enable = true },
		bufdelete = { enable = false },
		debug = { enable = false },
		git = { enable = false },
		gitbrowse = { enable = false },
		lazygit = { enable = true },
		notify = { enable = false },
		notifier = { enable = false },
		quickfile = { enable = true },
		rename = { enable = false },
		statuscolumn = {
			enable = true,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = false, -- show open fold icons
				git_hl = false, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
		},
		refresh = 50, -- refresh at most every 50ms },
		terminal = { enable = false },
		toggle = { enable = false },
		win = { enable = false },
		words = { enable = false },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},
	keys = {
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "dismiss all notifications",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "open lazygit",
		},
	},
}
