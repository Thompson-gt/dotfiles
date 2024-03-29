--vim.cmd [[packadd packer.nvim]]
--
--return require('packer').startup(function(use)
--  -- Packer can manage itself
--  use 'wbthomason/packer.nvim'
-- use {
--	  'nvim-treesitter/nvim-treesitter',
--	  run = function()
--		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
--		  ts_update()
--	  end,}
--
--  use {
--	  'nvim-telescope/telescope.nvim', tag = '0.1.x',
--	  -- or                            , branch = '0.1.x',
--	  requires = { {'nvim-lua/plenary.nvim'} }
--  }
--  --color theme
--  --use 'folke/tokyonight.nvim'
--  --vim.cmd[[colorscheme tokyonight-storm]]
--  use {'ellisonleao/gruvbox.nvim'}
--
--  -- undo tree
--  use('mbbill/undotree')
--
--  use {
--      'nvim-lualine/lualine.nvim',
--      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
--  }
--
----lsp server
--  use {
--  'VonHeikemen/lsp-zero.nvim',
--  branch = 'v2.x',
--  requires = {
--    -- LSP Support
--    {'neovim/nvim-lspconfig'},             -- Required
--  {                                      -- Optional
--      'williamboman/mason.nvim',
--      run = function()
--        pcall(vim.cmd, 'MasonUpdate')
--      end,
--    },
--    {'williamboman/mason-lspconfig.nvim'}, -- Optional
--
--    -- Autocompletion
--    {'hrsh7th/nvim-cmp'},     -- Required
--    {'hrsh7th/cmp-nvim-lua'},
--    {'hrsh7th/cmp-nvim-lsp'}, -- Required
--    {'L3MON4D3/LuaSnip'},     -- Required
--  }
--}
--   end)
--
