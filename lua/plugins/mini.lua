return {
	"echasnovski/mini.nvim",
	config = function()
		-- MiniAi setup
		require("mini.ai").setup({ n_lines = 500 })

		-- MiniComment setup
		require("mini.comment").setup()

		-- MiniIndentscope setup
		require("mini.indentscope").setup({
			symbol = "┋",
		})

		-- MiniMove setup
		require("mini.move").setup({
			mappings = {
				left = "<S-h>",
				right = "<S-l>",
				down = "<S-j>",
				up = "<S-k>",
				line_left = "<S-h>",
				line_right = "<S-l>",
				line_down = "<S-j>",
				line_up = "<S-k>",
			},
		})

		-- MiniPairs setup
		require("mini.pairs").setup({
			mappings = {
				["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		})

		-- MiniSurround setup
		require("mini.surround").setup()

		-- MiniTrailspace setup
		require("mini.trailspace").setup()
		vim.keymap.set(
			"n",
			"<leader>tll",
			"<cmd>lua MiniTrailspace.trim_last_lines()<CR>",
			{ desc = "Trim all trailing empty lines" }
		)
		vim.keymap.set(
			"n",
			"<leader>ts",
			"<cmd>lua MiniTrailspace.trim()<CR>",
			{ desc = "Trim all trailing whitespace" }
		)
	end,
}
