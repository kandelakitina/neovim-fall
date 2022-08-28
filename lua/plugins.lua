-- 907th/vim-auto-save

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim' -- must be cloned beforehand

  -- Visuals
	use 'shatur/neovim-ayu'
	use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'akinsho/bufferline.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- Utils
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'andymass/vim-matchup'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'dinhhuy258/git.nvim'
  use {                          -- Nvim in browser text fields
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSP and autocompletion stuff
	use 'neovim/nvim-lspconfig'
	use 'onsails/lspkind.nvim'
	use 'hrsh7th/cmp-buffer'
	use	'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
  use 'glepnir/lspsaga.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'nvim-treesitter/nvim-treesitter',
  	run = ':TSUpdate'
  	-- don't forget to install tree-sitter on the system 
  }

  --[[ for Wilder
  use 'gelguy/wilder.nvim'

  use 'sharkdp/fd'
  use 'nixprime/cpsm'
  use 'romgrk/fzy-lua-native'
  use 'roxma/nvim-yarp'
  --]]

end)

-- Colorscheme bindings
vim.cmd [[colorscheme ayu-dark]]
