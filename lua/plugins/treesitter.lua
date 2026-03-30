return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	config = function(_, opts)
		-- Prioritise nvim-treesitter parsers over Neovim's bundled ones
		vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/lazy/nvim-treesitter")
		require("nvim-treesitter.configs").setup(opts)
	end,
	opts = {
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		ensure_installed = {
			"apex",
			"dockerfile",
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
			"markdown",
			"markdown_inline",
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
