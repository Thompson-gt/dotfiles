--vim editor settings
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
--long running undos
vim.opt.undodir = os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile = true
--search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
--fast updates?
vim.opt.updatetime = 50
--line on the right side of the screen
vim.opt.colorcolumn = "150"
--this is to allow the word to be deleted even if it was multiple insert modes ago
vim.opt.backspace = [[indent,eol,start]]
--allow for vim to access clipboard
vim.opt.clipboard = "unnamed"

