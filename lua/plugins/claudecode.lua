-- claudecode.nvim only pushes the "currently open file" to Claude on
-- CursorMoved/BufEnter/TextChanged (see claudecode/selection.lua). If you
-- focus Claude before ever moving the cursor in the buffer you're leaving
-- (e.g. right after opening nvim), no selection has been sent yet, so Claude
-- has no idea what file is next to it. Force a selection update from the
-- buffer we're still in, right before switching focus.
local function focus_claude()
	local ok, selection = pcall(require, "claudecode.selection")
	if ok then
		selection.update_selection()
	end
	vim.cmd("ClaudeCodeFocus")
end

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
		{ "<C-,>", focus_claude, mode = { "n", "x" }, desc = "Toggle Claude" },
		{ "<leader>cf", focus_claude, desc = "Focus Claude" },
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
