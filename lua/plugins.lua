-- 907th/vim-auto-save

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim' -- must be cloned beforehand
	use 'shatur/neovim-ayu'
	use 'nvim-lualine/lualine.nvim'
	use 'neovim/nvim-lspconfig'
	use 'onsails/lspkind.nvim'
	use 'hrsh7th/cmp-buffer'
	use	'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
  use 'glepnir/lspsaga.nvim'
  use { 'nvim-treesitter/nvim-treesitter', 
  	run = ':TSUpdate' 
  	-- don't forget to install tree-sitter on the system 
  }

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'akinsho/bufferline.nvim'
  use 'norcalli/nvim-colorizer.lua'

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