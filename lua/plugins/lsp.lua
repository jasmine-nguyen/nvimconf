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
					"dockerls",
					"jsonls",
					"lua_ls",
					"lwc_ls",
					"golangci_lint_ls",
					"gopls",
					"ts_ls",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = true,
						lineFoldingOnly = true,
					},
				},
			}
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			-- Apex server setup
			lspconfig.apex_ls.setup({
				filetypes = { "apex" },
				apex_enable_semantic_errors = false,   -- Whether to allow Apex Language Server to surface semantic errors
				apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
				capabilities = capabilities,
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

				-- Yaml server setup
				lspconfig.yamlls.setup({
					capabilities = capabilities,
				}),
			})

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

			-- Format current buffer
			map("n", "<leader>f", vim.lsp.buf.format, "lsp - format")

			-- Rename the variable under your cursor.
			--  Most Language Servers support renaming across files, etc.
			map("n", "<leader>rn", vim.lsp.buf.rename, "lsp - rename variable")

			-- Execute a code action, usually your cursor needs to be on top of an error
			-- or a suggestion from your LSP for this to activate.
			map("n", "<leader>ca", vim.lsp.buf.code_action, "lsp - code action")
		end,
	},
}
