return {
	"crispgm/nvim-go",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("go").setup({})
	end,
}
