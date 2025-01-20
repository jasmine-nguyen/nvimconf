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
				plugins = {
					blink = true,
					dap = true,
					flash = true,
					fzf = true,
					lazy = true,
					mini_files = true,
					mini_indentscope = true,
					mini_surround = true,
					mini_trailspace = true,
					["neotree"] = true,
					snacks = true,
					["which-key"] = true,
				},
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
