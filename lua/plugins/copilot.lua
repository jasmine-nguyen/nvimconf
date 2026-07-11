return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			-- Suggestions are surfaced through the blink.cmp menu (blink-copilot)
			-- instead of inline ghost text; re-enable this for the ghost-text UX.
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
}
