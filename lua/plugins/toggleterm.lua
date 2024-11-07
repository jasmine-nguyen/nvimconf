return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	opts = {
		autochdir = true,
		highlights = {
			FloatBorder = {
				guifg = "#27a1b9",
			},
		},
		size = 20,
		open_mapping = [[<c-/>]],
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = true,
		direction = "float",
		close_on_exit = true, -- close the terminal window when the process exits
		shell = nil, -- change the default shell
		float_opts = {
			border = "rounded",
			height = 50,
			width = 200,
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
		winbar = {
			enabled = true,
			name_formatter = function(term) --  term: Terminal
				return term.name
			end,
		},
	},
	vim.keymap.set({ "t" }, "<esc>", "<cmd>close<CR>", { noremap = true, silent = true }),
}
