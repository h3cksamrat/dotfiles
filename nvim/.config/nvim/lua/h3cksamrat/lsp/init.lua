require('h3cksamrat.lsp.nvim-cmp')
local lsp_installer = require('nvim-lsp-installer')
local cmp = require('cmp')

local Remap = require('h3cksamrat.keymap');
local nnoremap = Remap.nnoremap;

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local common_on_attach = function ()
  nnoremap("K", vim.lsp.buf.hover, {buffer=0})
  nnoremap("gd", vim.lsp.buf.definition, {buffer=0})
  nnoremap("gt", vim.lsp.buf.type_definition, {buffer=0})
  nnoremap("gi", vim.lsp.buf.implementation, {buffer=0})
  nnoremap("<leader>dn", vim.diagnostic.goto_next, {buffer=0})
  nnoremap("<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
  nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
  nnoremap("<leader>gr", vim.lsp.buf.rename, {buffer=0})
  nnoremap("<leader>ca", vim.lsp.buf.code_action, {buffer=0})
  nnoremap("<leader>bf", vim.lsp.buf.formatting, {buffer=0})
end

local lsp_servers = { "pyserver", "tsserver", "eslint", "emmet_ls" }

for _, name in pairs(lsp_servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local default_opts = {
    on_attach = common_on_attach,
    capabilities = capabilities,
  }

  server:setup(default_opts)
end)
