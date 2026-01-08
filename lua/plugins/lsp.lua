return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		cmd = "Mason",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"jsonls",
					"lua_ls",
					"lwc_ls",
					"golangci_lint_ls",
					"gopls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Apex server setup
			vim.lsp.config("apex_ls", {
				apex_jar_path = "/Users/maverick/.local/share/nvim/mason/share/apex-language-server/apex-jorje-lsp.jar",
				apex_enable_semantic_errors = false, -- Whether to allow Apex Language Server to surface semantic errors
				apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
			})
			vim.lsp.enable("apex_ls")

			-- -- JSON server setup
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("jsonls")

			-- Lua server setup
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("lua_ls")

			-- LWC server setup
			vim.lsp.config("lwc_ls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("lwc_ls")

			-- Go server setup
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
			})
			vim.lsp.enable("gopls")

			-- Golangci lint server setup
			vim.lsp.config("golangci_lint_ls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("golangci_lint_ls")

			-- Proto server setup
			vim.lsp.config("protols", {
				capabilities = capabilities,
			})
			vim.lsp.enable("protols")

			-- Typescript server setup
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				init_options = {
					hostInfo = "neovim",
				},
				single_file_support = true,
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
			})
			vim.lsp.enable("ts_ls")

			-- Yaml server setup
			vim.lsp.config("yamls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("yamls")

			-- A util function that lets us more easily define mappings specific for LSP related items
			local map = function(mode, keys, action, desc)
				desc = desc or ""
				local opts = { noremap = true, silent = true, desc = desc }
				vim.keymap.set(mode, keys, action, opts)
			end

			-- Jump to the definition of the word under your cursor.
			-- To jump back, press <C-t>.
			map("n", "gd", vim.lsp.buf.definition, "lsp - definition")

			-- WARN: This is not Goto Definition, this is Goto Declaration.
			-- For example, in C this would take you to the header.
			map("n", "gD", vim.lsp.buf.declaration, "lsp - declaration")

			-- Rename the variable under your cursor.
			--  Most Language Servers support renaming across files, etc.
			map("n", "<leader>rn", vim.lsp.buf.rename, "lsp - rename variable")

			-- Execute a code action, usually your cursor needs to be on top of an error
			-- or a suggestion from your LSP for this to activate.
			map("n", "<leader>la", vim.lsp.buf.code_action, "lsp - code action")
		end,
	},
}
