return {
	'xixiaofinland/sf.nvim',

	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
	},

	config = function()
		require('sf').setup() -- Important to call setup() to initialize the plugin!
		local sf = require('sf')
		vim.keymap.set('n', '<leader>ss', sf.set_target_org)
		vim.keymap.set('n', '<leader>sp', sf.save_and_push)
		vim.keymap.set('n', '<leader>sr', sf.retrieve)
	end
}
