return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.add({
			{
				"<leader>a",
				"ggVG",
				desc = "select entire buffer",
			},
			{
				"<leader>yn",
				[[:let @+ = expand('%:t')<cr>:echo   "Yanked filename: " . expand('%:t')<cr>]],
				desc = "yank filename",
			},
			{
				"<leader>yp",
				[[:let @+ = expand('%:p:h')<cr>:echo "Yanked filepath: " . expand('%:p:h')<cr>]],
				desc = "yank filepath",
			},

			-- General
			{
				"<leader>Q",
				"<cmd>:q!<cr>",
				desc = "quit without saving",
			},
			{
				"<leader>rU",
				[[:%s/\<<C-r><C-w>\>/<C-r>=toupper(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
				desc = "replace word under cursor with UPPERCASE",
			},
			{
				"<leader>rL",
				[[:%s/\<<C-r><C-w>\>/<C-r>=tolower(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
				desc = "replace word under cursor with lowercase",
			},
			{ "<leader>sv", "<C-w>v",            desc = "window - split vertically" },
			{ "<leader>sh", "<C-w>s",            desc = "window - split horizontally" },
			{ "<leader>se", "<C-w>=",            desc = "window - make splits equal size" },
			{ "<leader>sx", "<cmd>close<CR>",    desc = "window - close current split" },
			{ "<leader>to", "<cmd>tabnew<CR>",   desc = "tab - open new" },
			{ "<leader>tx", "<cmd>tabclose<CR>", desc = "tab - close" },
			{ "<leader>tn", "<cmd>tabn<CR>",     desc = "tab - next" },
			{ "<leader>tp", "<cmd>tabp<CR>",     desc = "tab - previous" },
		})
	end,
}
