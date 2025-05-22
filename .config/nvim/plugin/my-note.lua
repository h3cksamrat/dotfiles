-- Configure the plugin
require("my-note").setup({
	files = {
		cwd = function()
			local bufPath = vim.api.nvim_buf_get_name(0)
			local cwd = require("lspconfig").util.root_pattern(".git")(bufPath)
			return cwd
		end,
		file_name = function(cwd) -- Function to generate the name of the note file for the current directory
			local file_path = vim.fn.expand("%:p:.")
			local base_name = vim.fs.basename(cwd)
			local parent_base_name = vim.fs.basename(vim.fs.dirname(cwd))
			-- replace / with _
			file_path = string.gsub(file_path, "/", "_")
			return parent_base_name .. "_" .. base_name .. "_" .. file_path .. ".md"
		end,
	},
})
