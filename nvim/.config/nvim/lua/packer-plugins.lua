-- Automatically run :PackerCompile whenever packer-plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "packer-plugins.lua",
	command = "PackerInstall",
})

return require("packer").startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- colorsscheme
	use("gruvbox-community/gruvbox")

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
	use("rcarriga/nvim-notify")
	-- use("romgrk/barbar.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("sunjon/shade.nvim")

	--> lsp
	use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
	use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
	use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
	use("tami5/lspsaga.nvim") --> icons for LSP diagnostics
	use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
	use("hrsh7th/nvim-cmp") --> Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") --> Snippets plugin
end)
