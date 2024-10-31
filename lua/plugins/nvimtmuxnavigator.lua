return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>", { desc = "go left in tmux", noremap = true }),
	vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>", { desc = "go down in tmux", noremap = true }),
	vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>"),
	{ desc = "go up in tmux", noremap = true },
	vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>", { desc = "go right in tmux", noremap = true }),
}
