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
vim.opt.colorcolumn = "120"
--this is to allow the word to be deleted even if it was multiple insert modes ago
vim.opt.backspace = [[indent,eol,start]]
--allow for vim to access clipboard
vim.opt.clipboard = "unnamedplus"
-- set the primary split location to be bellow the current buffer
vim.opt.splitbelow = true
--set the primary split location to be to the right of the current bufffer
vim.opt.splitright = true
-- this is to the cursor will stay a block in any mode
vim.opt.guicursor= ""
-- change the way the file tree looks in the viewer
vim.cmd("let g:netrw_liststyle=3")
-- make the preview window open vertically
--vim.cmd("let g:netrw_preview=1")
--vim.cmd("let g:netrw_altv=1")
