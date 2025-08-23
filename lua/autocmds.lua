-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("textyankpost", {
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
