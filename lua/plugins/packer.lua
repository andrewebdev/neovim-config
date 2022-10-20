return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Utility
  use 'nvim-lua/plenary.nvim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommanded if need floating window support

  -- use 'tpope/vim-surround'
  use { 'echasnovski/mini.nvim', branch = 'stable' }

  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-orgmode/orgmode'}

	use 'editorconfig/editorconfig-vim'

  -- Git and Diff
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview',
    }
  }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }


  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Typography, Language, Grammar

	-- Colorscheme
	use 'gruvbox-community/gruvbox'
end)
