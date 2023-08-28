local custom_config = require("h3cksamrat.lsp.config")

require("mason-lspconfig").setup_handlers({
	function(server)
		local default_opts = {
			on_attach = custom_config.common_on_attach,
			capabilities = custom_config.capabilities,
		}
		require("lspconfig")[server].setup(default_opts)
	end,
})
