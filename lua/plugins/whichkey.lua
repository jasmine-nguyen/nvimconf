return {
	"folke/which-key.nvim",
	event = "VeryLazy",
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
				"<leader>yn",
				[[:let @+ = expand('%:t')<cr>:echo   "Yanked filename: " . expand('%:t')<cr>]],
				desc = "yank filename",
				icon = "",
			},
			{
				"<leader>yp",
				[[:let @+ = expand('%:p:h')<cr>:echo "Yanked filepath: " . expand('%:p:h')<cr>]],
				desc = "yank filepath",
				icon = "",
			},

			-- General
			{ "<leader>q", "<cmd>:q<cr>", desc = "quit", icon = "󰈆" },
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
				"E",
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
