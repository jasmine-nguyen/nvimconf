return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"giuxtaposition/blink-cmp-copilot",
			},
		},
		event = { "LspAttach", "InsertCharPre" },
		version = "v0.*",
		opts = {
			accept = { auto_brackets = { enabled = true } },
			highlight = {
				use_nvim_cmp_as_default = true,
			},
			keymap = { preset = "super-tab" },
			nerd_font_variant = "mono",
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
				},
			},
			windows = {
				autocomplete = {
					border = "single",
				},
				documentation = {
					auto_show = true,
					border = "single",
				},
			},
			trigger = {
				completion = {
					show_in_snippet = false,
				},
				signature_help = { enabled = true },
			},
		},
	},
	{
		"giuxtaposition/blink-cmp-copilot",
		dependencies = {
			"copilot.lua",
		},
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
}
