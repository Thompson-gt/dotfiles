
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
        --vim.keymap.set('n', '<leader>*',function()
        --    builtin.grep_string({search = vim.fn.input(" > ") });
        --end)
        -- NOTE NEED RIPGREP FOR ALL COMMANDS BELOW
        -- search whole directory for word
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>*', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>/', function ()
        -- advanced search for live grep string on open files only
           --builtin.live_grep({grep_open_files=true})
           -- use telescope to search the open file for grep string
           builtin.live_grep({search_dirs={vim.fn.expand("%:p")}})
           --builtin.current_buffer_fuzzy_find({layout_stategy='vertical'})'<leader
        end)
        local colors = {
            blue   = '#80a0ff',
            cyan   = '#79dac8',
            black  = '#080808',
            white  = '#c6c6c6',
            red    = '#ff5189',
            violet = '#d183e8',
            grey   = '#303030',
            darkgreen1 = '#010300',
            lightgreen = '#4cd770',
            darkgreen2 = '#0f0f0a',
            custom_violet =    '#7F00FF',
        }
        vim.api.nvim_set_hl(0, 'TelescopeBorder', {fg = colors.custom_violet})
        vim.api.nvim_set_hl(0, 'TelescopePreviewMatch', {fg = colors.custom_violet})
    end}
