return {
	{
		"saghen/blink.cmp",
		version = "v0.*",
		dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
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
				menu = { auto_show = true },
				trigger = { prefetch_on_insert = false, show_in_snippet = false },
			},
			fuzzy = {
				implementation = "prefer_rust",
			},
			keymap = { preset = "super-tab" },
			signature = {
				enabled = true,
			},
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "minuet" },
				providers = {
					minuet = {
						name = "minuet",
						module = "minuet.blink",
						score_offset = 8, -- Gives minuet higher priority among suggestions
					},
				},
			},
		},
	},
}
