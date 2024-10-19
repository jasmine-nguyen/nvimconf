return {
	"folke/tokyonight.nvim",
	lazy = false,
	disable = true,
	priority = 1000,
	opts = {
		terminal_colors = true,
		priority = 1000,
		transparent = true,
		integrations = {
			alpha = true,
			lualine = true,
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
			}
		},
	},
}
