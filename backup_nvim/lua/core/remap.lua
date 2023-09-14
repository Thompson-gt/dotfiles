-- the <CR> means command run
-- map the leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--map to open the file tree
vim.keymap.set("n","<leader>e", "<cmd>Ex<cr>")
-- map to save file
vim.keymap.set("n","<leader>fs", "<cmd>w<cr>")
--map to save and close the file
vim.keymap.set("n","<leader>fc", "<cmd>wq<cr>")
-- map to close and not save
vim.keymap.set("n","<leader>Fc", "<cmd>q!<cr>")
-- re-center the screen when half page jumping
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")
--opens a terminal in the current dir(will need to use vim bindings to move around
vim.keymap.set("n","<leader>ft",":split term://zsh<CR>")
-- this will allow the esc key to return me to normal mode when using the terminal split
vim.keymap.set("t","<ESC>","<C-\\><C-n>")


--will enable the ctrl backspace to work in insert mode
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-H>', '<C-w>', {noremap = true})



--will allow the copy and paste from clipboard
vim.keymap.set("v",  "<leader>y  ",[[+y  ]])
vim.keymap.set("n", " <leader>Y  ",[[+yg_]])
vim.keymap.set("n", " <leader>yy  ", [[+yy]])

vim.keymap.set("v","<leader>p " ,[[+p]])
vim.keymap.set("n"," <leader>P ",[[+P]])
vim.keymap.set("n"," <leader>p ",[[+p]])


-- allow to move lines up and down in normal and visual mode
vim.keymap.set("n","<C-j>", ":m .+1<CR>==")
vim.keymap.set("n","<C-k>",":m .-2<CR>==" )
vim.keymap.set("v","<C-j>",":m '>+1<CR>gv=gv")
vim.keymap.set("v","<C-k>",":m '<-2<CR>gv=gv")

-- keybind to toggle on the file path complation
vim.keymap.set("i","<C-f>", "<C-x><C-f>")


-- to add a new line in normal mode
--vim.api.nvim_set_keymap("n", "<leader>o", "o<C-c>",{noremap=true})
vim.keymap.set("n", "<leader>o", "o<C-c>")


