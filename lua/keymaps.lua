local map = vim.keymap.set

-- Keymaps that are NOT in which-key (no label needed or special modes)
map("i", "jj", "<esc>", { desc = "escape", noremap = true })
map("n", "cc", '"_ciw', { desc = "change current word", noremap = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "turn off highlight search", noremap = true })
map("n", "J", "j30<CR>", { desc = "jump to 30 lines", noremap = true })

-- Modify macro recording keymap to avoid hitting by accident
map("n", "q", "<nop>", { noremap = true })
map("n", "Q", "q", { noremap = true, desc = "record macro" })
map("n", "<C-q>", "Q", { noremap = true, desc = "replay last register" })

-- Go to the beginning/end of the line
map({ "n", "v" }, "gh", "^", { desc = "go to the beginning line" })
map({ "n", "v" }, "gl", "$", { desc = "go to the end of the line" })
map({ "n", "v" }, "gm", "50%", { desc = "go to the middle of the file" })

-- Indent/dedent visual selection with Tab, keeping the selection active
map("x", "<Tab>", ">gv", { desc = "indent selection" })
map("x", "<S-Tab>", "<gv", { desc = "dedent selection" })

-- Move lines up and down
map("n", "-", ":m .+1<CR>==") -- move line up(n)
map("n", "_", ":m .-2<CR>==") -- move line down(n)
map("v", "-", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "_", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Scrolling centralized
map("n", "<C-u>", "<C-u>zz", { remap = false })
map("n", "<C-d>", "<C-d>zz", { remap = false })

-- Window focus navigation
map("n", "<C-h>", ":wincmd h<cr>", { desc = "window - focus left" })
map("n", "<C-l>", ":wincmd l<cr>", { desc = "window - focus right" })
map("n", "<C-j>", ":wincmd j<cr>", { desc = "window - focus down" })
map("n", "<C-k>", ":wincmd k<cr>", { desc = "window - focus up" })
