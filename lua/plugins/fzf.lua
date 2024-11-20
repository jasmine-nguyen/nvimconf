return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzflua = require("fzf-lua")
		local fzftodo = require("todo-comments.fzf")
		fzflua.setup({
			-- key mappings
			vim.keymap.set(
				"n",
				"<leader>fc",
				fzflua.command_history,
				{ desc = "find command history", noremap = true }
			),
			vim.keymap.set("n", "<leader>fb", fzflua.buffers, { desc = "find buffers", noremap = true }),
			vim.keymap.set("n", "<leader>ff", fzflua.files, { desc = "find files", noremap = true }),
			vim.keymap.set("n", "<leader>fk", fzflua.keymaps, { desc = "find key mappings", noremap = true }),
			vim.keymap.set("n", "<leader>fg", fzflua.live_grep, { desc = "find by grep", noremap = true }),
			vim.keymap.set("n", "<leader>fo", fzflua.oldfiles, { desc = "find old files", noremap = true }),
			vim.keymap.set("n", "<leader>ft", fzftodo.todo, { desc = "find todos", noremap = true }),
		})
	end,
}
