return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			-- Show flash labels on every / and ? match (including ones that
			-- scroll into view) so search doubles as a labeled jump.
			search = { enabled = true },
			-- Add labels/repeat to f, t, F, T and make ; , continue them.
			char = { enabled = true },
		},
	},
	keys = {
		{
			"s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash - jump",
		},
		{
			"S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash - treesitter",
		},
	},
}
