return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.diagnostics.protolint,
				null_ls.builtins.diagnostics.golangci_lint.with({
					args = {"--allow-parallel-runners"}
				}),
				null_ls.builtins.formatting.buf,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
			},
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "format current buffer", noremap = true })
	end,
}
