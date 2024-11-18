return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
	},
	keys = {
		{
			"lz",
			function()
				Snacks.lazygit()
			end,
			desc = "open lazygit",
		},
	},
}
