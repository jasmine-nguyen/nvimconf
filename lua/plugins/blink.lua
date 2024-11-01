return {
	"saghen/blink.cmp",
	event = { "LspAttach", "InsertCharPre" },
	version = "v0.*",
	opts = {
		accept = { auto_brackets = { enabled = true } },
		highlight = {
			use_nvim_cmp_as_default = true,
		},
		keymap = "super-tab",
		nerd_font_variant = "mono",
		windows = {
			autocomplete = {
				border = "single",
			},
			documentation = {
				auto_show = true,
				border = "single",
			},
		},
		-- trigger = { signature_help = { enabled = true } },
	},
}
