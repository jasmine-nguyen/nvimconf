return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {
		terminal = {
			snacks_win_opts = {
				keys = {
					-- Same key as the normal-mode toggle below, so <C-,>
					-- toggles Claude from either side without leaving
					-- terminal mode
					claude_hide = {
						"<C-,>",
						function(self)
							self:hide()
						end,
						mode = "t",
						desc = "Hide Claude",
					},
				},
			},
		},
	},
	keys = {
		{ "<C-,>", "<cmd>ClaudeCodeFocus<cr>", mode = { "n", "x" }, desc = "Toggle Claude" },
		{ "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>cr", "<cmd>ClaudeCodeResume<cr>", desc = "Resume Claude" },
		{ "<leader>cC", "<cmd>ClaudeCodeContinue<cr>", desc = "Continue Claude" },
		{ "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		-- Diff management
		{ "<leader>cy", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>cn", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
