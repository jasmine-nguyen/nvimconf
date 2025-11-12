-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Fix `commentstring` issue for apex
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "apex" },
	callback = function()
		vim.bo.commentstring = "// %s"
	end,
})

-- Make CursorLine transparent
vim.api.nvim_create_autocmd('ColorScheme', {
  command = [[highlight CursorLine guibg=NONE cterm=underline]]
})

-- Restore cursor position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "restore cursor position when opening a file",
	group = vim.api.nvim_create_augroup("restore-cursor", { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
			vim.api.nvim_win_set_cursor(0, mark)
		end
	end,
})
