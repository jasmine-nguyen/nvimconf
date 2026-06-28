return {
	{
		"saghen/blink.cmp",
		version = "v0.*",
		event = "InsertEnter",
		opts = {
			cmdline = {
				completion = {
					menu = { auto_show = true },
				},
				keymap = {
					preset = "inherit",
					-- Enter must execute the command/search, not just accept the
					-- completion (plain "accept" leaves you stuck in cmdline, so
					-- following keys like n/p get typed into the search string).
					["<CR>"] = { "accept_and_enter", "fallback" },
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
				trigger = { prefetch_on_insert = true, show_in_snippet = true },
			},
			fuzzy = {
				implementation = "prefer_rust",
			},
			keymap = { preset = "enter" },
			signature = {
				enabled = true,
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					lsp = {
						fallbacks = {},
						min_keyword_length = 2, -- Number of characters to trigger provider
						score_offset = 0, -- Boost/penalize the score of the items
					},
					path = {
						min_keyword_length = 0,
					},
					snippets = {
						min_keyword_length = 1,
					},
					buffer = {
						min_keyword_length = 1,
						max_items = 5,
						score_offset = -20,
					},
				},
			},
		},
	},
}
