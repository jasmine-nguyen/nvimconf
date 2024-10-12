return {
	"echasnovski/mini.nvim",
	config = function()
		-- MiniAi setup
		require("mini.ai").setup({ n_lines = 500 })

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

		-- MiniSurround setup
		require("mini.surround").setup()

		-- MiniPairs setup
		require("mini.pairs").setup({
			mappings = {
				["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		})

		-- MiniIndentscope setup
		require("mini.indentscope").setup({
			symbol = "┋",
		})
	end,
}
