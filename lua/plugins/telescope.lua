return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = false,
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
		event = "VeryLazy",
		cmd = { "Telescope" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "search buffers", noremap = true })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "search help", noremap = true })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "search keymaps", noremap = true })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "search files", noremap = true })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "search current word", noremap = true })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "search by grep", noremap = true })
			vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "search old files", noremap = true })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		enabled = false,
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
