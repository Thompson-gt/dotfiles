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
vim.keymap.set("n","<leader>Fc", "<cmd>wq<cr>")
-- re-center the screen when half page jumping
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")
--opens a terminal in the current dir(will need to use vim bindings to move around
--will problem just use the kitty split window instead though
vim.keymap.set("n","<leader>ft",function () vim.cmd.terminal()
end)

--will enable the ctrl backspace to work in insert mode
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', {noremap = true})
