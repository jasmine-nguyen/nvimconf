return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()

		local parsers = {
			"apex",
			"dockerfile",
			"javascript",
			"json",
			"lua",
			"go",
			"gomod",
			"gosum",
			"proto",
			"regex",
			"terraform",
			"typescript",
			"markdown",
			"markdown_inline",
			"python",
			"sql",
			"yaml",
		}

		local installed = ts.get_installed("parsers")
		local to_install = {}
		for _, p in ipairs(parsers) do
			if not vim.tbl_contains(installed, p) then
				table.insert(to_install, p)
			end
		end
		if #to_install > 0 then
			ts.install(to_install)
		end

		local filetypes = {}
		for _, p in ipairs(parsers) do
			local fts = vim.treesitter.language.get_filetypes(p)
			for _, ft in ipairs(fts) do
				table.insert(filetypes, ft)
			end
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
			pattern = filetypes,
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if lang and vim.treesitter.language.add(lang) then
					vim.treesitter.start(args.buf, lang)
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
