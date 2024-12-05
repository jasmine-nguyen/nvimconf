return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = {
		"BurntSushi/ripgrep",
		"nvim-tree/nvim-web-devicons",
	},
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
			vim.keymap.set("n", "fb", fzflua.buffers, { desc = "find buffers", noremap = true }),
			vim.keymap.set("n", "ff", fzflua.files, { desc = "find files", noremap = true }),
			vim.keymap.set("n", "fk", fzflua.keymaps, { desc = "find key mappings", noremap = true }),
			vim.keymap.set("n", "fl", fzflua.loclist, { desc = "find loclist", noremap = true }),
			vim.keymap.set("n", "fg", fzflua.grep_curbuf, { desc = "grep current buffer", noremap = true }),
			vim.keymap.set("n", "fp", fzflua.live_grep_native, { desc = "live grep current project", noremap = true }),
			vim.keymap.set("n", "fo", fzflua.oldfiles, { desc = "find old files", noremap = true }),
			vim.keymap.set("n", "ft", fzftodo.todo, { desc = "find todos", noremap = true }),
		})
	end,
}
