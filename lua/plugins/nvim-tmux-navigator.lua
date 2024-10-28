return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>", { desc = "go [left] in tmux", noremap = true }),
	vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>", { desc = "go [u]p in tmux", noremap = true }),
	vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>"),
	{ desc = "go [u]p in tmux", noremap = true },
	vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>", { desc = "go [r]ight in tmux", noremap = true }),
}
