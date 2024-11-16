return {
	"christoomey/vim-tmux-navigator",
	enabled = false,
	event = "VeryLazy",
	vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>", { desc = "go to left pane in tmux", noremap = true }),
	vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>", { desc = "go to bottom pane in tmux", noremap = true }),
	vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>"),
	{ desc = "go to upper pane in tmux", noremap = true },
	vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>", { desc = "go to right pane in tmux", noremap = true }),
}
