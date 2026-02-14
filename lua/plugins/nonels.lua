return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("NullLsFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.protolint,
					null_ls.builtins.diagnostics.pylint.with({
						diagnostics_postprocess = function(diagnostic)
							diagnostic.code = diagnostic.message_id
						end,
					}),
					null_ls.builtins.diagnostics.golangci_lint.with({
						args = { "--allow-parallel-runners" },
					}),
					null_ls.builtins.diagnostics.yamllint,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.buf,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.prettier.with({
						filetypes = { "apex" },
						extra_args = { "--plugin=prettier-plugin-apex", "--write" },
					}),
					null_ls.builtins.formatting.prettierd.with({
						filetypes = { "css", "html", "json", "javascript", "typescript", "yaml" },
					}),
					null_ls.builtins.formatting.stylua,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 3000 })
							end,
						})
					end
				end,
			})
		end,
	},
}
