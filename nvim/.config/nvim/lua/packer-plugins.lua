
return require("packer").startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- colorsscheme
  use("gruvbox-community/gruvbox")
  use("tomasiser/vim-code-dark")

  -- tpope plugins
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-commentary")

  -- A better status line
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")

  use("s1n7ax/nvim-terminal")
  use("kyazdani42/nvim-tree.lua")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use("nvim-treesitter/nvim-treesitter")
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("lukas-reineke/indent-blankline.nvim")
end)
