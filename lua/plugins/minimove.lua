return {
	"echasnovski/mini.move",
	event = "VeryLazy",
	config = function()
		require("mini.move").setup({
			mappings = {
				left = "<S-left>",
				down = "<S-down>",
				up = "<S-up>",
				right = "<S-right>",
				line_left = "<S-left>",
				line_down = "<S-down>",
				line_up = "<S-up>",
				line_right = "<S-right>",
			},
		})
	end,
}
