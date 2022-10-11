return require("packer").startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")
  use("sbdchd/neoformat")
  use("mbbill/undotree")
  use("lukas-reineke/indent-blankline.nvim")

  -- colorsscheme
  use("gruvbox-community/gruvbox")
  use("tomasiser/vim-code-dark")
  use("folke/tokyonight.nvim")

  -- tpope plugins
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-commentary")

  -- a better status line
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")

  use("s1n7ax/nvim-terminal")
  use("kyazdani42/nvim-tree.lua")

  -- telescope
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")

  -- treesitter
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("romgrk/nvim-treesitter-context")
end)
