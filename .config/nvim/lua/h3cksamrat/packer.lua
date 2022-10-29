return require("packer").startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- misc plugins
  use("sbdchd/neoformat")
  use("mbbill/undotree")
  use("lukas-reineke/indent-blankline.nvim")
  use("p00f/nvim-ts-rainbow")
  use("lewis6991/gitsigns.nvim")

  -- colorsscheme
  use("gruvbox-community/gruvbox")
  use("folke/tokyonight.nvim")
  use({ "catppuccin/nvim", as = "catppuccin" })

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
  use("romgrk/nvim-treesitter-context")

  -- lsp
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use("folke/neodev.nvim")

  -- nvim-cmp
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  -- Luasnip
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  -- Debugger
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  use("nvim-telescope/telescope-dap.nvim")
  use("ravenxrz/DAPInstall.nvim")

  use("mfussenegger/nvim-dap-python")
  use("leoluz/nvim-dap-go")

  -- language support
  use("pangloss/vim-javascript") -- js support
  use("leafgarland/typescript-vim") -- ts support
  use("maxmellon/vim-jsx-pretty") -- JS and JSX syntax
  -- use("jparise/vim-graphql") -- GraphQL syntax
  use("mattn/emmet-vim")
end)
