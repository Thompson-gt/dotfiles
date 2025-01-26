return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
    },
    config = function()
        -- Add cmp_nvim_lsp capabilities settings to lspconfig
        -- This should be executed before you configure any language server
        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
        )



        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'ts_ls',
                'rust_analyzer',
                'gopls'
            },
            handlers = {
                -- asigns default fucntionality to all lsp servers
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                -- this will give lsp support to the neovim functions
                lua_ls = function()
                    require('lspconfig').lua_ls.setup({
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                workspace = {
                                    library = { vim.env.VIMRUNTIME },
                                },
                            },
                        },
                    })
                end,
                -- custom handler for lsps go here
                -- ex: lsp_server = function `handling funciton` end
            },
        })


        local cmp = require('cmp')
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'cmp-nvim-lua' },
                { name = 'hrsh7th/cmp-buffer' },
                { name = 'hrsh7th/cmp-path' },
            },

            experimental = {
                --ghost_text = true,
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "FloatBorder:DiagnosticSignOk,CursorLine:SpellRare"
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = "FloatBorder:DiagnosticSignOk,CursorLine:SpellRare"
                }),
            },
            mapping = cmp.mapping.preset.insert({
                -- `control space` key to confirm completion
                ['<C-Space>'] = cmp.mapping.confirm({ select = false }),

                -- Ctrl+y to trigger completion menu
                ['<C-y>'] = cmp.mapping.complete(),
            }),
        })

        -- enable completion when typing commands
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })

        -- add aditional config to lsp 
        --
        --
        vim.diagnostic.config {
            underline = true,
            italic = true,
            virtual_text = true,
            signs = true,
            severity_sort = true,
            update_in_insert = false,
            border = true,

        }

        -- Add borders to floating windows
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {border = 'single'}
        )
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {border = 'single'}
        )


        -- removes the left shift when diagnostics start
        vim.opt.signcolumn = 'yes'

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '✘',
                    [vim.diagnostic.severity.WARN] = '▲',
                    --[vim.diagnostic.severity.HINT] = '⚑',
                    [vim.diagnostic.severity.INFO] = '»',
                },
            },
        })




        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            { border = 'rounded' }
        )
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            { border = 'rounded' }
        )

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
                vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
                vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>',
                    { noremap = true, silent = true })
                vim.keymap.set({ 'n', 'x' }, '<leader>gf', function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                end, opts)
            end,
        })
    end

}
