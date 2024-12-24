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
			keymap = { preset = "super-tab" },
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
