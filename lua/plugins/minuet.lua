return {
	{
		"milanglacier/minuet-ai.nvim",
		config = function()
			require("minuet").setup({
				provider = "claude",
				provider_options = {
					claude = {
						max_tokens = 512,
						model = "claude-3-5-haiku-20241022",
						system = require("minuet.config").default_system,
						few_shots = require("minuet.config").default_few_shots,
						chat_input = require("minuet.config").default_chat_input,
						stream = true,
						api_key = "ANTHROPIC_API_KEY",
					},
				},
			})
		end,
	},
	{ "nvim-lua/plenary.nvim" },
	{ "Saghen/blink.cmp" },
}
