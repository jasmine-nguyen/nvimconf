return {
	"numToStr/Comment.nvim",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("Comment").setup()
	end,
}
