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
				[[:let @+ = expand('%:t:r')<cr>:echo   "Yanked filename: " . expand('%:t:r')<cr>]],
				desc = "yank filename",
				icon = "",
			},
			{
				"<leader>yp",
				[[:let @+ = expand('%')<cr>:let @+ = substitute(@+, getcwd() . '/', '', '')<cr>:echo "Yanked filepath: " . @+<cr>]],
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
			-- LSP (<leader>l)
			{ "<leader>l", group = "lsp" },
			{ "gd", vim.lsp.buf.definition, desc = "lsp - definition", icon = "" },
			{ "gD", vim.lsp.buf.declaration, desc = "lsp - declaration", icon = "" },
			{ "<leader>lf", vim.lsp.buf.format, desc = "lsp - format", icon = "" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "lsp - rename variable", icon = "" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "lsp - code action", icon = "" },
			{ "<leader>ld", vim.diagnostic.open_float, desc = "lsp - diagnostics", icon = "" },
			-- -- SFDX
			-- { "<leader>ss", require("sf").set_target_org, desc = "set target org", icon = "" },
			-- { "<leader>sp", require("sf").save_and_push, desc = "push current file", icon = "" },
			-- { "<leader>sr", require("sf").retrieve, desc = "retrieve current file", icon = "" },
			-- { "<leader>sc", require("sf").copy_apex_name, desc = "copy apex name", icon = "" },
			-- Git (<leader>g)
			{ "<leader>g", group = "git" },
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "open lazygit",
				icon = "",
			},
			-- Find / Picker (<leader>f)
			{ "<leader>f", group = "find" },
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "find files",
				icon = "",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "find text",
				icon = "",
			},
			{
				"<leader>fw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "find text under cursor",
				icon = "",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "find open buffers",
				icon = "",
			},
			{
				"<leader>fe",
				function()
					Snacks.picker.explorer()
				end,
				desc = "toggle explorer",
				icon = "󰙅",
			},
			{
				"<leader>fl",
				function()
					Snacks.picker.lines()
				end,
				desc = "find line in buffer",
			},
			{
				"<leader>fs",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "find symbol in file",
			},
			{
				"<leader>fS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "find symbol in workspace",
			},
			{
				"<leader>fm",
				function()
					Snacks.picker.marks()
				end,
				desc = "find marks",
				icon = "",
			},
			{
				"<leader>fi",
				function()
					Snacks.picker.icons()
				end,
				desc = "find icons",
				icon = "",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "find todo comments",
				icon = "",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "find file history",
				icon = "",
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
			-- Tabs & terminal (<leader>t)
			{
				"<leader>tt",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "toggle terminal",
				icon = "",
			},
			{ "<leader>to", "<cmd>tabnew<CR>", desc = "tab - open new", icon = " " },
			{ "<leader>tx", "<cmd>tabclose<CR>", desc = "tab - close", icon = " " },
			{ "<leader>tn", "<cmd>tabn<CR>", desc = "tab - next", icon = " " },
			{ "<leader>tp", "<cmd>tabp<CR>", desc = "tab - previous", icon = " " },
		})
	end,
}
