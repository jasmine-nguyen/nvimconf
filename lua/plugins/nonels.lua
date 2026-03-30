return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("NullLsFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.protolint,
					require("none-ls.diagnostics.ruff"),
					null_ls.builtins.diagnostics.golangci_lint.with({
						args = { "--allow-parallel-runners" },
					}),
					null_ls.builtins.diagnostics.markdownlint.with({
						extra_args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint.jsonc" },
					}),
					null_ls.builtins.diagnostics.yamllint,
					require("none-ls.formatting.ruff"),
				require("none-ls.formatting.ruff_format"),
					null_ls.builtins.formatting.buf,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.prettier.with({
						filetypes = { "apex" },
						extra_args = { "--plugin=prettier-plugin-apex", "--write" },
					}),
					null_ls.builtins.formatting.prettierd.with({
						filetypes = { "css", "html", "json", "javascript", "markdown", "typescript", "yaml" },
					}),
					null_ls.builtins.formatting.stylua,
				},
				on_attach = function(client, bufnr)
					if client:supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 3000 })
							end,
						})

						-- Format only git-changed lines
						vim.keymap.set("n", "<leader>fd", function()
							local filepath = vim.api.nvim_buf_get_name(bufnr)
							if filepath == "" then
								return
							end

							local hunks = {}
							local result =
								vim.fn.systemlist("git diff --unified=0 HEAD -- " .. vim.fn.shellescape(filepath))
							for _, line in ipairs(result) do
								local start_line, count = line:match("^@@ %-%d+,?%d* %+(%d+),?(%d*) @@")
								if start_line then
									start_line = tonumber(start_line)
									count = tonumber(count) or 1
									if count > 0 then
										table.insert(hunks, { start_line, start_line + count - 1 })
									end
								end
							end

							if #hunks == 0 then
								vim.notify("No git changes to format", vim.log.levels.INFO)
								return
							end

							for _, hunk in ipairs(hunks) do
								vim.lsp.buf.format({
									bufnr = bufnr,
									id = client.id,
									timeout_ms = 3000,
									range = {
										["start"] = { hunk[1], 0 },
										["end"] = { hunk[2], 0 },
									},
								})
							end
							vim.notify("Formatted " .. #hunks .. " changed hunk(s)", vim.log.levels.INFO)
						end, { buffer = bufnr, desc = "Format git diff only" })
					end
				end,
			})
		end,
	},
}
