return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("h3cksamrat.lsp")
		end,
	},
}
