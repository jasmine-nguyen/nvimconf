return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"eslint_d",
				"protolint",
				"golangci-lint",
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "apex_ls", "jsonls", "lua_ls", "lwc_ls", "golangci_lint_ls", "gopls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- Apex server setup
			lspconfig.apex_ls.setup({
				apex_jar_path = "$Home/lsp/apex-jorje-lsp.jar",
				apex_enable_semantic_errors = true, -- Whether to allow Apex Language Server to surface semantic errors
				apex_enable_completion_statistics = true, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
			})

			-- JSON server setup
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			-- Lua server setup
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- LWC server setup
			lspconfig.lwc_ls.setup({
				capabilities = capabilities,
			})

			-- Go server setup
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
			})

			-- Golangci lint server setup
			lspconfig.golangci_lint_ls.setup({
				capabilities = capabilities,
			})

			-- Proto server setup
			lspconfig.protols.setup({
				capabilities = capabilities,
			})

			-- Typescript server setup
			lspconfig.ts_ls.setup({
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

			-- A util function that lets us more easily define mappings specific for LSP related items
			local map = function(mode, keys, action, desc)
				desc = desc or ""
				local opts = { noremap = true, silent = true, desc = desc }
				vim.keymap.set(mode, keys, action, opts)
			end

			-- Jump to the definition of the word under your cursor.
			-- To jump back, press <C-t>.
			map("n", "gd", vim.lsp.buf.definition, "go to definition")

			-- WARN: This is not Goto Definition, this is Goto Declaration.
			-- For example, in C this would take you to the header.
			map("n", "gD", vim.lsp.buf.declaration, "go to declaration")

			-- Find references for the word under your cursor.
			map("n", "gr", vim.lsp.buf.references, "find references")

			-- Jump to the implementation of the word under your cursor.
			-- Useful when your language has ways of declaring types without an actual implementation.
			map("n", "gi", vim.lsp.buf.implementation, "jump to implementation")

			-- Jump to the type of the word under your cursor.
			-- Useful when you're not sure what type a variable is and you want to see
			-- the definition of its *type*, not where it was *defined*.
			map("n", "gt", vim.lsp.buf.type_definition, "jump to type definition")

			-- Fuzzy find all the symbols in your current document.
			-- Symbols are things like variables, functions, types, etc.
			map("n", "<leader>ds", vim.lsp.buf.document_symbol, "find document symbol")

			-- Rename the variable under your cursor.
			--  Most Language Servers support renaming across files, etc.
			map("n", "<leader>rn", vim.lsp.buf.rename, "rename variable under cursor")

			-- Execute a code action, usually your cursor needs to be on top of an error
			-- or a suggestion from your LSP for this to activate.
			map("n", "<leader>ca", vim.lsp.buf.code_action, "execute code action")

			-- Show line diagnostic in a floating window, useful when error is too long
			map("n", "<leader>of", vim.diagnostic.open_float, "show line diagnostics in a floating window")
		end,
	},
}
