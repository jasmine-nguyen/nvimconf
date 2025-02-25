return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.add({
			-- General
			{
				"<leader>a",
				"ggVG",
				desc = "select entire buffer",
				icon = "",
			},
			{
				"<leader>dm",
				"<cmd>delmarks!<CR>",
				desc = "delete all marks in current buffer",
				icon = "",
			},
			{
				"<leader>yn",
				[[:let @+ = expand('%:t')<cr>:echo   "Yanked filename: " . expand('%:t')<cr>]],
				desc = "yank filename",
				icon = "",
			},
			{
				"<leader>yp",
				[[:let @+ = expand('%')<cr>:echo "Yanked filepath: " . expand('%')<cr>]],
				desc = "yank filepath",
				icon = "",
			},
			{ "<leader>q", "<cmd>:q<cr>", desc = "quit", icon = "󰈆" },
			{ "<leader>w", "<cmd>:w<cr>", desc = "save", icon = "" },
			{
				"<leader>Q",
				"<cmd>:q!<cr>",
				desc = "quit without saving",
				icon = "󰈆",
			},
			{
				"<leader>rU",
				[[:%s/\<<C-r><C-w>\>/<C-r>=toupper(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
				desc = "replace word under cursor with UPPERCASE",
				icon = " ",
			},
			{
				"<leader>rL",
				[[:%s/\<<C-r><C-w>\>/<C-r>=tolower(expand('<cword>'))<CR>/gI<Left><Left><Left>]],
				desc = "replace word under cursor with lowercase",
				icon = " ",
			},
			-- LSP
			{ "gd", vim.lsp.buf.definition, desc = "lsp - definition", icon = "" },
			{ "gD", vim.lsp.buf.declaration, desc = "lsp - declaration", icon = "" },
			{ "<leader>f", vim.lsp.buf.format, desc = "lsp - format", icon = "" },
			{ "<leader>rn", vim.lsp.buf.rename, desc = "lsp - rename variable", icon = "" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "lsp - code action", icon = "" },
			{ "<leader>of", vim.diagnostic.open_float, desc = "lsp - diagnostics", icon = "" },
			-- Snacks
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "open lazygit",
				icon = "",
			},
			{
				"<leader>sf",
				function()
					Snacks.picker.files()
				end,
				desc = "search files",
				icon = "",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "search text",
				icon = "",
			},
			{
				"<leader>sG",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "search text under cursor",
				icon = "",
			},
			{
				"<leader>sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "search open buffers",
				icon = "",
			},
			{
				"<leader>e",
				function()
					Snacks.picker.explorer()
				end,
				desc = "toggle explorer",
				icon = "󰙅",
			},
			{
				"<leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "search marks",
				icon = "",
			},
			{
				"<leader>si",
				function()
					Snacks.picker.icons()
				end,
				desc = "search icons",
				icon = "",
			},
			{
				"<leader>st",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "search todo",
				icon = "",
			},
			{
				"<leader>sF",
				function()
					Snacks.picker.todo_comments({ keywords = { "FIX", "FIXME" } })
				end,
				desc = "search fixme",
				icon = "",
			},
			{
				"<leader>tt",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "toggle terminal",
				icon = "",
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "toggle zen mode",
				icon = "󰶟",
			},
			-- Window management
			{ "<leader>sv", "<C-w>v", desc = "window - split vertically", icon = "" },
			{ "<leader>sh", "<C-w>s", desc = "window - split horizontally", icon = "" },
			{ "<leader>se", "<C-w>=", desc = "window - make splits equal size", icon = "" },
			{ "<leader>sx", "<cmd>close<CR>", desc = "window - close current split", icon = "" },
			-- Tab management
			{ "<leader>to", "<cmd>tabnew<CR>", desc = "tab - open new", icon = " " },
			{ "<leader>tx", "<cmd>tabclose<CR>", desc = "tab - close", icon = " " },
			{ "<leader>tn", "<cmd>tabn<CR>", desc = "tab - next", icon = " " },
			{ "<leader>tp", "<cmd>tabp<CR>", desc = "tab - previous", icon = " " },
		})
	end,
}
