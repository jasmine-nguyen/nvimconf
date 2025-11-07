return {
	"xixiaofinland/sf.nvim",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"ibhagwan/fzf-lua", -- no need if you don't use listing metadata feature
	},

	config = function()
		require("sf").setup({
			fetch_org_list_at_nvim_start = false,
		})
		local sf = require("sf")
		vim.keymap.set("n", "<leader>ss", sf.set_target_org, { desc = "set target org" })
		vim.keymap.set("n", "<leader>sp", sf.save_and_push, { desc = "push current file" })
		vim.keymap.set("n", "<leader>sr", sf.retrieve, { desc = "retrieve current file" })
		vim.keymap.set("n", "<leader>sc", sf.copy_apex_name, { desc = "copy apex name" })
	end,
}
