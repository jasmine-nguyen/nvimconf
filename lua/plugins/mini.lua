return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		local ai = require("mini.ai")
		-- MiniAi setup
		ai.setup({
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

		-- MiniFiles setup
		local minifiles = require("mini.files")

		local map_split = function(buf_id, lhs, direction, close_on_file)
			local rhs = function()
				local new_target_window
				local cur_target_window = require("mini.files").get_explorer_state().target_window
				if cur_target_window ~= nil then
					vim.api.nvim_win_call(cur_target_window, function()
						vim.cmd("belowright " .. direction .. " split")
						new_target_window = vim.api.nvim_get_current_win()
					end)

					require("mini.files").set_target_window(new_target_window)
					require("mini.files").go_in({ close_on_file = close_on_file })
				end
			end

			local desc = "Open in " .. direction .. " split"
			if close_on_file then
				desc = desc .. " and close"
			end
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		minifiles.setup({
			vim.keymap.set("n", "\\", function()
				minifiles.open(nil, false)
			end, { desc = "open minifiles", noremap = true }),

			vim.keymap.set("n", "<esc>", function()
				minifiles.close()
			end, { desc = "close minifiles", noremap = true }),

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id

					map_split(buf_id, "<leader>h", "horizontal", false)
					map_split(buf_id, "<leader>v", "vertical", false)
					map_split(buf_id, "<leader>H", "horizontal", true)
					map_split(buf_id, "<leader>V", "vertical", true)
				end,
			}),
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
			{ desc = "trim all trailing empty lines", noremap = true }
		)
		vim.keymap.set(
			"n",
			"<leader>tw",
			"<cmd>lua MiniTrailspace.trim()<CR>",
			{ desc = "trim all trailing whitespace", noremap = true }
		)
	end,
}
