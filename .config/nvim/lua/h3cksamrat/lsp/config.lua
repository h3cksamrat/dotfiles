local M = {}
local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local common_on_attach = function()
	nnoremap("K", vim.lsp.buf.hover, { buffer = 0 })
	nnoremap("gr", vim.lsp.buf.references)
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
	nnoremap("<leader>co", function()
		vim.lsp.buf.code_action({
			apply = true,
			context = { diagnostics = {}, only = { "source.organizeImports", "source.removeUnused" } },
		})
	end, { buffer = 0 })
	nnoremap("<leader>ci", function()
		vim.lsp.buf.code_action({
			apply = true,
			context = { diagnostics = {}, only = { "source.addMissingImports" } },
		})
	end, { buffer = 0 })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
	nnoremap("<leader>bf", function()
		vim.lsp.buf.format({ async = true })
	end, { buffer = 0 })
end

M.capabilities = capabilities
M.common_on_attach = common_on_attach

return M
