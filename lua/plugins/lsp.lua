return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		cmd = "Mason",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()

			local ensure_installed = {
				-- lsp servers
				"docker-compose-language-service",
				"dockerfile-language-server",
				"gopls",
				"golangci-lint-langserver",
				"json-lsp",
				"lua-language-server",
				"lwc-language-server",
				"marksman",
				"pyright",
				"typescript-language-server",
				"yaml-language-server",
				-- linters & formatters
				"buf",
				"markdownlint",
				"prettier",
				"prettierd",
				"protolint",
				"ruff",
			}
			local registry = require("mason-registry")
			registry.refresh(function()
				for _, name in ipairs(ensure_installed) do
					local pkg = registry.get_package(name)
					if not pkg:is_installed() then
						pkg:install()
					end
				end
			end)
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
				apex_jar_path = vim.fn.stdpath("data") .. "/mason/share/apex-language-server/apex-jorje-lsp.jar",
				apex_enable_semantic_errors = false, -- Whether to allow Apex Language Server to surface semantic errors
				apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
			})
			vim.lsp.enable("apex_ls")

			-- Docker Compose server setup
			vim.lsp.config("docker_compose_language_service", {
				capabilities = capabilities,
			})
			vim.lsp.enable("docker_compose_language_service")

			-- Dockerfile server setup
			vim.lsp.config("dockerls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("dockerls")

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

			-- Python server setup
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				before_init = function(_, config)
					local venv = vim.fs.find("venv", { path = config.root_dir, type = "directory" })[1]
					if venv then
						config.settings.python.pythonPath = venv .. "/bin/python"
					end
				end,
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
						},
					},
				},
			})
			vim.lsp.enable("pyright")

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

			-- Markdown server setup (wiki-link diagnostics disabled for Obsidian/Quartz)
			vim.lsp.config("marksman", {
				capabilities = capabilities,
				settings = {
					marksman = {
						wiki = { style = "obsidian" },
					},
				},
			})
			vim.lsp.enable("marksman")

			-- Yaml server setup
			vim.lsp.config("yamlls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("yamlls")

			-- LSP keymaps are defined in whichkey.lua
		end,
	},
}
