return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local none_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			none_ls.setup({
				sources = {
					none_ls.builtins.diagnostics.protolint,
					none_ls.builtins.diagnostics.golangci_lint.with({
						args = { "--allow-parallel-runners" },
					}),
					none_ls.builtins.diagnostics.yamllint,
					none_ls.builtins.formatting.buf,
					none_ls.builtins.formatting.gofumpt,
					none_ls.builtins.formatting.prettier.with({
						filetypes = { "apex" },
						extra_args = { "--plugin=prettier-plugin-apex", "--write" },
					}),
					none_ls.builtins.formatting.prettierd.with({
						filetypes = { "css", "html", "json", "javascript", "typescript", "yaml" },
					}),
					none_ls.builtins.formatting.stylua,
					none_ls.builtins.formatting.xmllint,
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
