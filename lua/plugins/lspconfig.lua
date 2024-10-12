return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "apex_ls", "lua_ls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			-- Apex server setup
			lspconfig.apex_ls.setup({})
			-- Lua server setup
			lspconfig.lua_ls.setup({
				filetypes = { "lua" },
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
						format = {
							defaultConfig = {},
						},
						hint = {
							enable = true,
						},
					},
				},
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

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					-- A util function that lets us more easily define mappings specific for LSP related items
					local map = function(mode, keys, action, desc)
						desc = desc or ""
						local opts = { noremap = true, silent = true, desc = desc }
						vim.keymap.set(mode, keys, action, opts)
					end

					-- Jump to the definition of the word under your cursor.
					--  To jump back, press <C-t>.
					map("n", "gd", vim.lsp.buf.definition, "Goto lsp definition")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("n", "gD", vim.lsp.buf.declaration, "Goto lsp declaration")

					-- Find references for the word under your cursor.
					map("n", "gr", vim.lsp.buf.references, "Goto lsp reference")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("n", "gi", vim.lsp.buf.implementation, "Goto lsp implementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("n", "gt", vim.lsp.buf.type_definition, "Goto lsp definition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("n", "<leader>ds", vim.lsp.buf.document_symbol, "Goto lsp document symbol")

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("n", "<leader>rn", vim.lsp.buf.rename, "Lsp rename")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("n", "<leader>ca", vim.lsp.buf.code_action, "Lsp code action")
				end,
			})
		end,
	},
}
