local my_arduino_fqbn = {}

local DEFAULT_FQBN = "esp32:esp32:esp32"

return {
	{
		"stevearc/vim-arduino",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			local custom_config = require("h3cksamrat.lsp.config")
			local lspconfig = require("lspconfig")
			local fqbn = my_arduino_fqbn[root_dir]
			if not fqbn then
				vim.notify(("Could not find which FQBN to use in %q. Defaulting to %q."):format(root_dir, DEFAULT_FQBN))
				fqbn = DEFAULT_FQBN
			end
			lspconfig.arduino_language_server.setup({
				cmd = {
					"arduino-language-server",
					"-cli",
					"/usr/bin/arduino-cli",
					"-cli-config",
					os.getenv("HOME") .. "/.arduino15/arduino-cli.yaml",
					"-fqbn",
					fqbn,
					"-log",
					"debug",
					"-clangd",
					"/usr/bin/clangd",
				},
				filetypes = { "arduino", "cpp" },
				root_dir = lspconfig.util.root_pattern("*.ino", ".git"),

				on_attach = custom_config.common_on_attach,
				capabilities = custom_config.capabilities,
			})
		end,
	},
}
