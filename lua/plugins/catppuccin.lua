return {
	"catppuccin/nvim",
	lazy = true,
	priority = 1000,
	name = "catppuccin",
	init = function()
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
	opts = {
		integrations = {
			alpha = true,
			mason = true,
			mini = {
				enabled = true,
				indentscope_color = "teal",
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			neotree = true,
			telescope = {
				enabled = true,
			},
		},
	},
}
