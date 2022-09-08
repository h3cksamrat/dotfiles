-- Automatically run :PackerCompile whenever packer-plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'packer-plugins.lua',
    command = 'PackerInstall',
})

return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorsscheme
	use 'gruvbox-community/gruvbox'

	-- A better status line
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt=true }
	}

	use {
	's1n7ax/nvim-terminal',
	config = function()
        	vim.o.hidden = true
        	require('nvim-terminal').setup()
	end
	}

	use 'kyazdani42/nvim-tree.lua'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end
)

