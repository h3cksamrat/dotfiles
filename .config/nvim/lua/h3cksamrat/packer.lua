return require("packer").startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- use("github/copilot.vim")
	use({
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	})
	-- use("Exafunction/codeium.vim")

	use("tpope/vim-fugitive")

	-- misc plugins
	use({
		"jellydn/my-note.nvim",
		requires = { "MunifTanjim/nui.nvim" },
	})

	use("dstein64/vim-startuptime")
	use("folke/zen-mode.nvim")
	use("sbdchd/neoformat")
	use("mbbill/undotree")
	use("lukas-reineke/indent-blankline.nvim")
	use("wakatime/vim-wakatime")
	use("charm-and-friends/freeze.nvim")
	use({ "3rd/image.nvim" })
	-- use("f-person/git-blame.nvim")

	use("luochen1990/rainbow")

	use("lewis6991/gitsigns.nvim")
	use({
		"kylechui/nvim-surround",
		tag = "*",
	})
	use("numToStr/Comment.nvim")
	use("vimwiki/vimwiki")

	-- colorsscheme
	use("abhidahal/onsetGlaze.nvim")
	use("folke/tokyonight.nvim")

	-- tpope plugins
	use("tpope/vim-repeat")

	-- a better status line
	use("nvim-lualine/lualine.nvim")

	-- use("s1n7ax/nvim-terminal")
	use("nvim-tree/nvim-web-devicons")
	-- use("kyazdani42/nvim-tree.lua")

	use({
		"echasnovski/mini.icons",
		branch = "stable",
		config = function()
			require("mini.icons").setup()
		end,
	})

	use("stevearc/oil.nvim")

	-- telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")
	use("folke/todo-comments.nvim")

	-- treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("romgrk/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- lsp
	use("mason-org/mason.nvim")
	use("mason-org/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind.nvim")
	use("kosayoda/nvim-lightbulb")
	use("b0o/schemastore.nvim")

	-- nvim-cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	-- use("hrsh7th/cmp-vsnip")
	-- use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-path")

	-- Luasnip
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("nvim-neotest/nvim-nio")
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

	-- dart
	use("dart-lang/dart-vim-plugin")
	-- use("thosakwe/vim-flutter")
	-- use("natebosch/vim-lsc")
	-- use("natebosch/vim-lsc-dart")

	use({
		"akinsho/flutter-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
	})

	-- terraform
	-- use({
	-- 	"nathom/filetype.nvim",
	-- 	config = function()
	-- 		require("filetype").setup({
	-- 			overrides = {
	-- 				extensions = {
	-- 					tf = "terraform",
	-- 					tfvars = "terraform",
	-- 					tfstate = "json",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- })
	--
	--

	--
	use({
		"pcolladosoto/tinygo.nvim",
		config = function()
			require("tinygo").setup()
		end,
	})

	-- rust
	use("simrat39/rust-tools.nvim")

	-- avante
	use("MunifTanjim/nui.nvim")
	use("MeanderingProgrammer/render-markdown.nvim")
	use("stevearc/dressing.nvim") -- for enhanced input UI
	use("folke/snacks.nvim") -- for modern input UI

	-- use({
	-- 	"yetone/avante.nvim",
	-- 	branch = "main",
	-- 	run = "make",
	-- 	config = function()
	-- 		require("avante").setup()
	-- 	end,
	-- })
end)
