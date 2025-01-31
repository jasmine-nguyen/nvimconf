return {
	{
		"saghen/blink.cmp",
		event = { "LspAttach", "InsertCharPre" },
		version = "v0.*",
		opts = {
			completion = {
				accept = { auto_brackets = { enabled = true } },
				signature = { enabled = true },
			},
			keymap = { preset = "super-tab" },
		},
	},
}
