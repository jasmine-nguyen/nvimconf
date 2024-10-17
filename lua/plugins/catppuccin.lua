return {
	"catppuccin/nvim",
	lazy = true,
	disable = true,
	priority = 1000,
	name = "catppuccin",
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
	opts = {
		transparent_background = true,
		compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
		compile = true,
		flavour = "macchiato",
		integrations = {
			cmp = true,
			mason = true,
			mini = {
				enabled = true,
				indentscope_color = "teal",
			},
			native_lsp = {
				enabled = true,
				inlay_hints = {
					background = true,
				},
			},
			neotree = true,
			telescope = {
				enabled = true,
			}
		},
	},
}
