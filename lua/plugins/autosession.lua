return {
	"rmagatti/auto-session",
	lazy = true,
	cnfig = function()
		require("auto-session").setup({
			opts = {
				bypass_save_filetypes = { "alpha", "dashboard" },
				suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
				session_lens = {
					buftypes_to_ignore = {},
					load_on_setup = true,
					previewer = false,
				},
				vim.keymap.set(
					"n",
					"<leader>ls",
					"<cmd>SessionSearch<CR>",
					{ desc = "[l]ist sessions", noremap = true }
				),
				vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "[s]ave session", noremap = true }),
				vim.keymap.set(
					"n",
					"<leader>rs",
					"<cmd>SessionDelete<CR>",
					{ desc = "[r]emove session", noremap = true }
				),
			},
		})
	end,
}
