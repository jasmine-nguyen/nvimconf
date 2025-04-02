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
				trigger = { show_in_snippet = false },
			},
			fuzzy = {
				implementation = "prefer_rust",
			},
			keymap = { preset = "super-tab" },
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
