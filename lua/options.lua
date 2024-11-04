-- set <space> as the leader key
-- see `:help mapleader`
--  note: must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

-- set to true if you have a nerd font installed and selected in the terminal
vim.g.have_nerd_font = true

-- make line numbers default
vim.opt.number = true

-- don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching unless \c or one or more capital letters in the search term
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- decrease update time
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
-- displays which-key popup sooner
vim.opt.timeoutlen = 300

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- show which line your cursor is on
vim.opt.cursorline = true

-- the amount of space on screen a tab character can occupy
vim.opt.tabstop = 2

-- amount of characters neovim will use to indent a line
vim.opt.shiftwidth = 2

-- controls whether or not neovim should transform a tab character to spaces
vim.opt.expandtab = false

-- minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- when on, lines longer than the width of the window will wrap and displaying continues on the next line
vim.opt.wrap = true

-- maximum width of text that is being inserted.  a longer line will be broken after white space to get this width.
vim.opt.textwidth = 80

-- Apex filetypes
vim.filetype = on
vim.filetype.add({
  extension = {
    cls = 'apex',
    apex = 'apex',
    trigger = 'apex',
    soql = 'soql',
    sosl = 'sosl',
    log = 'sflog',
  }
})

-- sync clipboard between os and neovim.
--  schedule the setting after `uienter` because it can increase startup-time.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
