return {
	{
		"saghen/blink.cmp",
		version = "v0.*",
		opts = {
			cmdline = {
				completion = {
					menu = { auto_show = true },
				},
				keymap = {
					preset = "inherit",
				},
			},
			completion = {
				accept = { auto_brackets = { enabled = true } },
				documentation = { auto_show = true },
				ghost_text = { enabled = true },
				menu = {
					auto_show = true,
					draw = {
						columns = {
							{ "source_name" },
							{ "kind_icon" },
							{ "label",      "label_description", gap = 1 },
						},
					},
				},
				trigger = { prefetch_on_insert = false, show_in_snippet = false },
			},
			fuzzy = {
				implementation = "prefer_rust",
			},
			keymap = { preset = "super-tab" },
			signature = {
				enabled = true,
			},
			sources = {
				default = { "lsp", "snippets", "buffer", "path" },
			},
		},
	},
}
