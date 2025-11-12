return {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{
			"s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash - jump",
		},
		{
			"S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash - treesitter",
		},
	},
}
