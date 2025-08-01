
return  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function() 
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
            dark_purple = '#121520',
            custom_violet = '#7F00FF',


        }


        local lsp =  {
            -- Lsp server name .
            function()
                local msg = 'RAW'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = 'ξ',
            color = { fg = colors.white, gui = 'italic' },
        }


        local theme = {
            normal = {
                a = { fg = colors.custom_violet, bg = colors.darkpurple },
                b = { fg = colors.white, bg = colors.darkpurple },
                c = { fg = colors.custom_violet, bg = colors.darkpurple },
                x = { fg = colors.custom_violet, bg = colors.darkpurple },
                y = { fg = colors.custom_violet, bg = colors.darkpurple },
                z = { fg = colors.white, bg = colors.darkpurple },
            },

            insert = { a = { fg = colors.white, bg = colors.darkgreen1 } },
            visual = { a = { fg = colors.white, bg = colors.darkgreen1 } },
            replace = { a = { fg = colors.white, bg = colors.darkgreen1 } },

            inactive = {
                a = { fg = colors.yellow, bg = colors.darkgreen2 },
                b = { fg = colors.white, bg = colors.darkgreen2 },
                c = { fg = colors.darkgreen2, bg = colors.black },
            },
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = theme,
                component_separators = { left = ' ', right = ' '},
                section_separators = { left = ' ', right = ' '},

                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        file_status=true,
                        path=2
                    }
                },
                lualine_x = {lsp, 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end}
