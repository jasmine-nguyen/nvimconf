return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		cmd = "Mason",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()

			-- Install tools on demand: only when a file of a type that uses
			-- them is opened, so machines that never see e.g. go or terraform
			-- never download those servers (and never error on them).
			local tools_by_ft = {
				apex = { "prettier" },
				css = { "prettierd" },
				dockerfile = { "dockerfile-language-server" },
				go = { "gopls", "golangci-lint-langserver" },
				gomod = { "gopls" },
				gosum = { "gopls" },
				html = { "prettierd", "lwc-language-server" },
				javascript = { "typescript-language-server", "prettierd", "lwc-language-server" },
				javascriptreact = { "typescript-language-server", "prettierd" },
				json = { "json-lsp", "prettierd" },
				lua = { "lua-language-server" },
				markdown = { "marksman", "markdownlint", "prettierd" },
				proto = { "buf", "protolint" },
				python = { "pyright", "ruff" },
				terraform = { "terraform-ls" },
				["terraform-vars"] = { "terraform-ls" },
				typescript = { "typescript-language-server", "prettierd" },
				typescriptreact = { "typescript-language-server", "prettierd" },
				yaml = { "yaml-language-server", "prettierd" },
				["yaml.docker-compose"] = { "docker-compose-language-service", "yaml-language-server" },
			}

			local registry = require("mason-registry")

			local function ensure_installed(names)
				-- Only hit the network (registry.refresh) when something is
				-- actually missing from the local registry cache.
				local missing = false
				for _, name in ipairs(names) do
					local ok, pkg = pcall(registry.get_package, name)
					if not ok or not pkg:is_installed() then
						missing = true
						break
					end
				end
				if not missing then
					return
				end
				registry.refresh(function()
					for _, name in ipairs(names) do
						local ok, pkg = pcall(registry.get_package, name)
						if ok and not pkg:is_installed() then
							pkg:install()
						end
					end
				end)
			end

			local function handle(ft)
				local tools = tools_by_ft[ft]
				if tools then
					tools_by_ft[ft] = nil -- once per session
					ensure_installed(tools)
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("mason-install-on-demand", { clear = true }),
				callback = function(args)
					handle(vim.bo[args.buf].filetype)
				end,
			})

			-- Mason loads at VeryLazy, after the first file's FileType event;
			-- cover buffers that are already open.
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) then
					handle(vim.bo[buf].filetype)
				end
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Applied to every server; per-server configs below only add extras
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			-- Apex server setup
			vim.lsp.config("apex_ls", {
				apex_jar_path = vim.fn.stdpath("data") .. "/mason/share/apex-language-server/apex-jorje-lsp.jar",
				apex_enable_semantic_errors = false, -- Whether to allow Apex Language Server to surface semantic errors
				apex_enable_completion_statistics = false, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
			})

			-- LWC server setup (only attach inside Salesforce projects;
			-- otherwise lwc-language-server crashes on `initialize` with
			-- "Cannot read properties of null (reading 'map')")
			vim.lsp.config("lwc_ls", {
				root_dir = function(bufnr, on_dir)
					local root = vim.fs.root(bufnr, { "sfdx-project.json" })
					if root then
						on_dir(root)
					end
				end,
			})

			-- Python server setup
			vim.lsp.config("pyright", {
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

			-- Terraform server setup (only attach in initialized workspaces;
			-- terraform-ls freezes on uninitialized ones)
			vim.lsp.config("terraformls", {
				filetypes = { "terraform", "terraform-vars" },
				root_dir = function(bufnr, cb)
					local fname = vim.api.nvim_buf_get_name(bufnr)
					local markers = vim.fs.find({ ".terraform", ".terraform.lock.hcl" }, {
						path = vim.fs.dirname(fname),
						upward = true,
					})
					if markers[1] then
						cb(vim.fs.dirname(markers[1]))
					end
				end,
			})

			-- Typescript server setup
			vim.lsp.config("ts_ls", {
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
			})

			-- Markdown server setup (wiki-link diagnostics disabled for Obsidian/Quartz)
			vim.lsp.config("marksman", {
				settings = {
					marksman = {
						wiki = { style = "obsidian" },
					},
				},
			})

			vim.lsp.enable({
				"apex_ls",
				"docker_compose_language_service",
				"dockerls",
				"golangci_lint_ls",
				"gopls",
				"jsonls",
				"lua_ls",
				"lwc_ls",
				"marksman",
				"protols",
				"pyright",
				"ruff",
				"terraformls",
				"ts_ls",
				"yamlls",
			})

			-- LSP keymaps are defined in whichkey.lua
		end,
	},
}
