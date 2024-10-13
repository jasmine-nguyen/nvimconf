return {
	"echasnovski/mini.nvim",
	config = function()
		-- MiniAi setup
		require("mini.ai").setup({ n_lines = 500 })

		-- MiniComment setup
		require("mini.comment").setup()

		-- MiniFiles setup
		require("mini.files").setup({
			use_as_default_explorer = true,
			windows = {
				max_number = math.huge,
				preview = false,
				width_focus = 30,
				width_nofocus = 20,
				width_preview = 25,
			},
		})
		local minifiles_toggle = function(...)
			if not MiniFiles.close() then
				MiniFiles.open(...)
			end
		end
		vim.keymap.set("n", "\\", minifiles_toggle, { desc = "File explorer" })

		-- MiniIndentscope setup
		require("mini.indentscope").setup({
			symbol = "┋",
		})

		-- MiniMove setup
		require("mini.move").setup({
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
