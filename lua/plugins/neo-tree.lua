return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-material-icon",
		"MunifTanjim/nui.nvim",
		"BurntSushi/ripgrep",
	},
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
