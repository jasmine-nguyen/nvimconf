-- [[ basic keymaps ]]
vim.keymap.set("n", "<leader>q", "<cmd>:q<cr>", { desc = "quit", noremap = true })
vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", { desc = "save", noremap = true })
vim.keymap.set("i", "jj", "<esc>", { desc = "escape", noremap = true })
vim.keymap.set(
	"n",
	"<leader>a",
	":keepjumps normal! ggVG<cr>",
	{ desc = "select all text in current buffer", noremap = true }
)

-- modify x and x to delete text without changing the internal registers
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "x", '"_d')
vim.keymap.set({ "n", "x" }, "d", '"_x')
vim.keymap.set({ "n", "x" }, "d", '"_d')

--  see `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<c-h>", ":wincmd h<cr>", { desc = "move focus to the left window" })
vim.keymap.set("n", "<c-l>", ":wincmd l<cr>", { desc = "move focus to the right window" })
vim.keymap.set("n", "<c-j>", ":wincmd j<cr>", { desc = "move focus to the lower window" })
vim.keymap.set("n", "<c-k>", ":wincmd k<cr>", { desc = "move focus to the upper window" })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "format current buffer", noremap = true })
