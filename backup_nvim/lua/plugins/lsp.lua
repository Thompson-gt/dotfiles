return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-nvim-lua"},
},
config = function()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    lsp.ensure_installed({
        'tsserver',
        'rust_analyzer',
    })

    -- Fix Undefined global 'vim'
    lsp.nvim_workspace()
    -- need all of this to change the keybinds for the default lsp????
    local cmp = require('cmp')
    cmp.setup({
        sources = {
            {name = 'nvim_lsp','cmp-nvim-lua',"hrsh7th/cmp-buffer","hrsh7th/cmp-path"},
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
        mapping = {
            -- `control space` key to confirm completion
            ['<C-Space>'] = cmp.mapping.confirm({select = false}),

            -- Ctrl+y to trigger completion menu
            ['<C-y>'] = cmp.mapping.complete(),
        },
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

    lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = 'E',
            warn = 'W',
            hint = 'H',
            info = 'I'
        }
    })

    lsp.on_attach(function(_, bufnr)
        local opts = {buffer = bufnr, remap = false}
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
        vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
    end)


    lsp.setup()

    vim.diagnostic.config {
        underline = true,
        italic = true,
        virtual_text = true,
        signs = true,
        severity_sort = true,
        update_in_insert = false,
    }

end
    }

