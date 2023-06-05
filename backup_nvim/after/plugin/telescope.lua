local builtin = require('telescope.builtin')
--map to fuzzy find through whole project, means file find
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--search through git files only
vim.keymap.set('n', '<leader><C-p>', builtin.git_files, {})
--map to search for a string through whole project, means project search
vim.keymap.set('n', '<leader>ps',function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });
end)
