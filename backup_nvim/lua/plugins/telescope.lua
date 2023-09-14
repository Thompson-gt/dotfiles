
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        --map to fuzzy find through whole project, means file find
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        --search through git files only
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        --map to search for a string through whole project, means project search
        -- make sure to install ripgrep when adding to a new linux machine
        vim.keymap.set('n', '<leader>ps',function()
            builtin.grep_string({search = vim.fn.input("Grep > ") });
        end)
    end}
