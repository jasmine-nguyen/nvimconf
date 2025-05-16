return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile", "VeryLazy" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
	},
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local masonnullls = require("mason-null-ls")
			masonnullls.setup({
				ensure_installed = {
					"gofumpt",
					"prettier",
					"prettierd",
					"protolint",
					"stylua",
					"yamlfmt",
					"yamllint",
				},
			})
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.protolint,
					null_ls.builtins.diagnostics.golangci_lint.with({
						args = { "--allow-parallel-runners" },
					}),
					null_ls.builtins.diagnostics.yamllint,
					null_ls.builtins.formatting.buf,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.prettierd.with({
						filetypes = { "apex", "css", "html", "json", "javascript", "typescript", "yaml" },
					}),
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.xmllint,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format()
							end,
						})
					end
				end,
			})
		end,
	},
}
