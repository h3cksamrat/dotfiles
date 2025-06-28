local custom_config = require("h3cksamrat.lsp.config")

require("mason").setup({})
require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = {
		"ts_ls", -- typescript language server
		"rust_analyzer", -- rust language server
		"lua_ls", -- lua language server
		"gopls", -- go language server
	},
	handlers = {
		function(server)
			require("lspconfig")[server].setup({
				capabilities = custom_config.capabilities,
			})
		end,
	},
})

vim.diagnostic.config({
	virtual_text = true,
})

vim.lsp.config("*", {
	on_attach = custom_config.common_on_attach,
})

vim.lsp.config("ts_ls", {
	on_attach = custom_config.common_on_attach,
	capabilities = custom_config.capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
})

require("lspconfig").jsonls.setup({
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

require("lspconfig").yamlls.setup({
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
