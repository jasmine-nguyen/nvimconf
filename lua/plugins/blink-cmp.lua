return {
	"saghen/blink.cmp",
	event = { "LspAttach", "InsertCharPre" },
	version = "v0.*",
	opts = {
		highlight = {
			use_nvim_cmp_as_default = true,
		},
		nerd_font_variant = "mono",
		accept = { auto_brackets = { enabled = true } },
		keymap = {
			show = "<C-space>",
			hide = { "<C-d>" },
			-- accept = "<CR>",
			select_prev = { "<Up>", "<C-p>" },
			select_next = { "<Down>", "<C-n>" },

			show_documentation = {},
			hide_documentation = {},
			scroll_documentation_up = "<C-y>",
			scroll_documentation_down = "<C-e>",
		},
		windows = {
			autocomplete = {
				border = "single",
			},
			documentation = {
				border = "single",
			},
		},
	},
}
