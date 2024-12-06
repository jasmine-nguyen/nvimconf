return {
	"shortcuts/no-neck-pain.nvim",
	keys = {
		{ "<leader>np", "<cmd>NoNeckPain<CR>", desc = "toggle No Neck Pain" },
		{
			"<leader>nwi",
			"<cmd>NoNeckPainWidthUp<CR>",
			desc = "increase width by 5",
		},
		{
			"<leader>nwd",
			"<cmd>NoNeckPainWidthDown<CR>",
			desc = "decrease width by 5",
		},
	},
	opts = {
		debug = true,
		width = 120,
	},
}
