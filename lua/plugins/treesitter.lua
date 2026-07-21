return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()

		local available = ts.get_available()

		local function start(buf, lang)
			vim.treesitter.start(buf, lang)
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end

		-- Install parsers on demand: only when a file of that language is
		-- opened, so a fresh clone doesn't compile parsers it never uses.
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if not lang then
					return
				end
				if vim.treesitter.language.add(lang) then
					start(args.buf, lang)
				elseif vim.tbl_contains(available, lang) then
					ts.install(lang):await(function()
						if vim.api.nvim_buf_is_valid(args.buf) and vim.treesitter.language.add(lang) then
							start(args.buf, lang)
						end
					end)
				end
			end,
		})
	end,
}
