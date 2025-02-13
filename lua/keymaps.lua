local map = vim.keymap.set

-- Select all file visually
map("n", "<leader>a", "ggVG", { remap = false, desc = "select entire buffer" })

-- Copy file path to clipboard
map(
	"n",
	"<leader>yn",
	[[:let @+ = expand('%:t')<cr>:echo   "Yanked filename: " . expand('%:t')<cr>]],
	{ remap = false, silent = true, desc = "yank filename" }
)
map(
	"n",
	"<leader>yp",
	[[:let @+ = expand('%:p:h')<cr>:echo "Yanked filepath: " . expand('%:p:h')<cr>]],
	{ remap = false, silent = true, desc = "yank filepath" }
)

-- General
map("n", "<leader>Q", "<cmd>:q!<cr>", { desc = "quit without saving", noremap = true, silent = true })
map("n", "<leader>q", "<cmd>:q<cr>", { desc = "quit", noremap = true })
map("n", "<leader>w", "<cmd>:w<cr>", { desc = "save", noremap = true })
map("i", "jj", "<esc>", { desc = "escape", noremap = true })
map("n", "cc", "ciw", { desc = "change current word", noremap = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "turn off highlight search", noremap = true })

-- Modify macro recording keymap to avoid hitting by accident
map("n", "q", "<nop>", { noremap = true })
map("n", "Q", "q", { noremap = true, desc = "record macro" })
map("n", "<C-q>", "Q", { noremap = true, desc = "replay last register" })

-- Go to the beginning of the line in normal mode
map({ "n", "v" }, "gh", "^", { desc = "go to the beginning line" })
-- Go to the end of the line in normal mode
map({ "n", "v" }, "gl", "$", { desc = "go to the end of the line" })
-- Move lines up and down in visual mode
map("n", "J", ":m .+1<CR>==") -- move line up(n)
map("n", "K", ":m .-2<CR>==") -- move line down(n)

-- Replaces the current word with the same word in uppercase, globally
map(
	"n",
	"<leader>rU",
	[[:%s/\<<C-r><C-w>\>/<C-r>=toupper(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
	{ desc = "replace word under cursor with UPPERCASE" }
)

-- Replaces the current word with the same word in lowercase, globally
map(
	"n",
	"<leader>rL",
	[[:%s/\<<C-r><C-w>\>/<C-r>=tolower(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
	{ desc = "replace word under cursor with lowercase" }
)
-- Scrolling centralized
map("n", "<C-u>", "<C-u>zz", { remap = false })
map("n", "<C-d>", "<C-d>zz", { remap = false })

-- Window management
map("n", "<C-h>", ":wincmd h<cr>", { desc = "window - focus left" })
map("n", "<C-l>", ":wincmd l<cr>", { desc = "window - focus right" })
map("n", "<C-j>", ":wincmd j<cr>", { desc = "window - focus down" })
map("n", "<C-k>", ":wincmd k<cr>", { desc = "window - focus up" })
map("n", "<leader>sv", "<C-w>v", { desc = "window - split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "window - split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "window - make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "window - close current split" })

-- Tab management
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "tab - open new" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "tab - close" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "tab - next" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "tab - previous" })
