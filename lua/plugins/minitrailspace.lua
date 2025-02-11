return {
	"echasnovski/mini.trailspace",
	event = "VeryLazy",
	config = function()
		require("mini.trailspace").setup()
		vim.keymap.set(
			"n",
			"<leader>tl",
			"<cmd>lua MiniTrailspace.trim_last_lines()<CR>",
			{ desc = "trim empty lines", noremap = true }
		)
		vim.keymap.set(
			"n",
			"<leader>tw",
			"<cmd>lua MiniTrailspace.trim()<CR>",
			{ desc = "trim whitespace", noremap = true }
		)
	end,
}
