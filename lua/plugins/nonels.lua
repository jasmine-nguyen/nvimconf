return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.diagnostics.protolint,
				null_ls.builtins.diagnostics.golangci_lint.with({
					args = { "--allow-parallel-runners" },
				}),
				null_ls.builtins.formatting.buf,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
