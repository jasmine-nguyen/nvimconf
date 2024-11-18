return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				styles = {
					floats = "transparent",
				},
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
