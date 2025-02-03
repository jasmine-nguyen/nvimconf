-- [[ basic keymaps ]]
vim.keymap.set("n", "<leader>Q", "<cmd>:q!<cr>", { desc = "quit buffer without saving", noremap = true })
vim.keymap.set("n", "<leader>q", "<cmd>:q<cr>", { desc = "quit buffer", noremap = true })
vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", { desc = "save buffer", noremap = true })
vim.keymap.set("i", "jj", "<esc>", { desc = "escape", noremap = true })
vim.keymap.set(
	"n",
	"<leader>a",
	":keepjumps normal! ggVG<cr>",
	{ desc = "select all text in current buffer", noremap = true }
)
vim.keymap.set("n", "zz", "30j", { desc = "jump 30 lines", noremap = true })
vim.keymap.set("n", "yc", "yygccp", { desc = "duplicate a line, comment out first line", noremap = true })
vim.keymap.set("n", "cc", "ciw", { desc = "change current word", noremap = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "turn off highlight search", noremap = true })

-- modify macro recording keymap to avoid hitting by accident
vim.keymap.set("n", "q", "<nop>", { noremap = true })
vim.keymap.set("n", "Q", "q", { noremap = true, desc = "record macro" })
vim.keymap.set("n", "<C-q>", "Q", { noremap = true, desc = "replay last register" })

-- modify x and x to delete text without changing the internal registers
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "x", '"_d')
-- use gh to move to the beginning of the line in normal mode
-- use gl to move to the end of the line in normal mode
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "go to the beginning line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "go to the end of the line" })
-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line down in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line up in visual mode" })

-- replaces the current word with the same word in uppercase, globally
vim.keymap.set(
	"n",
	"<leader>rU",
	[[:%s/\<<C-r><C-w>\>/<C-r>=toupper(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
	{ desc = "[P]GLOBALLY replace word I'm on with UPPERCASE" }
)

-- replaces the current word with the same word in lowercase, globally
vim.keymap.set(
	"n",
	"<leader>rL",
	[[:%s/\<<C-r><C-w>\>/<C-r>=tolower(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
	{ desc = "[P]GLOBALLY replace word I'm on with lowercase" }
)
-- vim.keymap.set({ "n", "x" }, "d", '"_x')
-- vim.keymap.set({ "n", "x" }, "d", '"_d')

--  see `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", ":wincmd h<cr>", { desc = "move focus to the left window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<cr>", { desc = "move focus to the right window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<cr>", { desc = "move focus to the lower window" })
vim.keymap.set("n", "<C-k>", ":wincmd k<cr>", { desc = "move focus to the upper window" })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" }) -- close current split window
-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current buffer in new tab" }) --  move current buffer to new tab
