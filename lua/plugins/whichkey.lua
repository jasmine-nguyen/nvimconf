return {
	{
		"echasnovski/mini.icons",
		enabled = false,
		opts = {},
	},
	{
		"folke/which-key.nvim",
		dependencies = {
			"echasnovski/mini.icons",
		},
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "buffer local keymaps (which-key)",
			},
		},
	},
}
