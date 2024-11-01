return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		local ai = require("mini.ai")
		-- MiniAi setup
		require("mini.ai").setup({
			n_lines = 500,
			custom_textobjects = {
				o = ai.gen_spec.treesitter({ -- code block
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
				d = { "%f[%d]%d+" }, -- digits
				e = { -- Word with case
					{ "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
					"^().*()$",
				},
				u = ai.gen_spec.function_call(), -- u for "Usage"
				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
			},
		})

		-- MiniIndentscope setup
		require("mini.indentscope").setup({
			symbol = "┋",
		})

		-- MiniMove setup
		require("mini.move").setup({
			mappings = {
				left = "<S-h>",
				right = "<S-l>",
				down = "<S-j>",
				up = "<S-k>",
				line_left = "<S-h>",
				line_right = "<S-l>",
				line_down = "<S-j>",
				line_up = "<S-k>",
			},
		})

		-- MiniPairs setup
		require("mini.pairs").setup({
			mappings = {
				["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		})

		-- MiniSurround setup
		require("mini.surround").setup()

		-- MiniTrailspace setup
		require("mini.trailspace").setup()
		vim.keymap.set(
			"n",
			"<leader>tl",
			"<cmd>lua MiniTrailspace.trim_last_lines()<CR>",
			{ desc = "Trim all trailing empty lines", noremap = true }
		)
		vim.keymap.set(
			"n",
			"<leader>tw",
			"<cmd>lua MiniTrailspace.trim()<CR>",
			{ desc = "Trim all trailing whitespace", noremap = true}
		)
	end,
}
