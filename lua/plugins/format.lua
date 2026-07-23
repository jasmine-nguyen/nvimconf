return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
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
