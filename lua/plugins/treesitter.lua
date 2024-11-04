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
			"terraform",
			"typescript",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true, disable = { "ruby" } },
	},
}
