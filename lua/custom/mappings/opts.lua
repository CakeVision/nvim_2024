vim.g.have_nerd_font = false

vim.opt.relativenumber = true
-- enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
-- don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"
-- enable break indent
vim.opt.breakindent = true
-- save undo history
vim.opt.undofile = true
-- case-insensitive searching unless \c or one or more capital letters in the search term
vim.opt.ignorecase = true
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
-- sets how neovim will display certain whitespace characters in the editor.
--  see `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- show which line your cursor is on
vim.opt.cursorline = true
-- minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
