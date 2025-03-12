return {
	{
		"saghen/blink.cmp",
		event = { "LspAttach", "InsertCharPre" },
		version = "v0.*",
		dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
		opts = {
			cmdline = {
				completion = {
					menu = { auto_show = true },
				},
			},
			completion = {
				accept = { auto_brackets = { enabled = true } },
			},
			keymap = { preset = "super-tab" },
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
