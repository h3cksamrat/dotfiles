local custom_config = require("h3cksamrat.lsp.config")
local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap
local rt = require("rust-tools")

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

require("lspconfig").rust_analyzer.setup({
	on_attach = function(_, bufnr)
		nnoremap("gr", rt.references.references, { buffer = bufnr })
		nnoremap("gR", vim.lsp.buf.rename, { buffer = 0 })
		nnoremap("gd", vim.lsp.buf.definition, { buffer = 0 })
		nnoremap("<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
		nnoremap("<leader>gi", vim.lsp.buf.implementation, { buffer = 0 })
		nnoremap("dn", function()
			vim.diagnostic.jump({
				severity = vim.diagnostic.severity.ERROR,
				count = 1,
				float = true,
			})
		end, { buffer = 0 })
		nnoremap("dp", function()
			vim.diagnostic.jump({
				severity = vim.diagnostic.severity.ERROR,
				count = -1,
				float = true,
			})
		end, { buffer = 0 })
		nnoremap("dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
		nnoremap("<leader>bf", function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = 0 })
		nnoremap("K", rt.hover_actions.hover_actions, { buffer = bufnr })
		nnoremap("<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
		xnoremap("<leader>ca", rt.code_action_group.code_action_group, { buffer = 0 })
	end,
	capabilities = custom_config.capabilities,
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
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
