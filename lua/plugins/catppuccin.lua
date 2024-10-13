return {
	"catppuccin/nvim",
	lazy = true,
	priority = 1000,
	name = "catppuccin",
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
	opts = {
		transparent_background = true,
		compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
		compile = true,
		flavour = "frappe",
		integrations = {
			cmp = true,
			mason = true,
			mini = {
				enabled = true,
				indentscope_color = "lavender",
			},
			native_lsp = {
				enabled = true,
				inlay_hints = {
					background = true,
				},
			},
			telescope = {
				enabled = true,
			}
		},
	},
}
