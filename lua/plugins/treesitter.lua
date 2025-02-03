return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"apex",
			"javascript",
			"json",
			"lua",
			"go",
			"gomod",
			"gosum",
			"proto",
			"regex",
			"terraform",
			"typescript",
			"sql",
			"yaml",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true, disable = { "ruby" } },
	},
}
