return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fd",
				function()
					local bufnr = vim.api.nvim_get_current_buf()
					local filepath = vim.api.nvim_buf_get_name(bufnr)
					if filepath == "" then
						return
					end

					local hunks = {}
					local result = vim.fn.systemlist("git diff --unified=0 HEAD -- " .. vim.fn.shellescape(filepath))
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
						require("conform").format({
							bufnr = bufnr,
							timeout_ms = 3000,
							range = {
								["start"] = { hunk[1], 0 },
								["end"] = { hunk[2], 0 },
							},
						})
					end
					vim.notify("Formatted " .. #hunks .. " changed hunk(s)", vim.log.levels.INFO)
				end,
				desc = "Format git diff only",
			},
		},
		opts = {
			formatters_by_ft = {
				apex = { "prettier" },
				css = { "prettierd" },
				go = { "gofumpt" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				json = { "prettierd" },
				lua = { "stylua" },
				markdown = { "prettierd" },
				proto = { "buf" },
				python = { "ruff_fix", "ruff_format" },
				terraform = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
				typescript = { "prettierd" },
				yaml = { "prettierd" },
			},
			-- Match the old none-ls behavior: only the formatters above run on
			-- save; LSP servers never format.
			format_on_save = { timeout_ms = 3000, lsp_format = "never" },
			formatters = {
				-- prettier is only used for apex (everything else uses prettierd)
				prettier = { prepend_args = { "--plugin=prettier-plugin-apex" } },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- python (ruff) diagnostics come from the ruff LSP; go (golangci)
			-- from golangci_lint_ls -- see lsp.lua
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				proto = { "protolint" },
				yaml = { "yamllint" },
			}

			lint.linters.markdownlint.args = {
				"--config",
				vim.fn.stdpath("config") .. "/.markdownlint.jsonc",
				"--stdin",
			}

			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = function()
					require("lint").try_lint(nil, { ignore_errors = true })
				end,
			})
		end,
	},
}
