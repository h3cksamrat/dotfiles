local A = vim.api
local augroup = A.nvim_create_augroup
local autocmd = A.nvim_create_autocmd

return {
	{
		"sbdchd/neoformat",
		config = function()
			local PrettierGroup = augroup("Prettier", { clear = true })
			autocmd("BufWritePre", {
				group = PrettierGroup,
				pattern = {
					"*.js",
					"*.jsx",
					"*.ts",
					"*.tsx",
					"*.json",
					"*.css",
					"*.scss",
					"*.html",
					"*.vue",
					"*.lua",
					"*.go",
					"*.astro",
				},
				callback = function()
					vim.cmd("Neoformat")
				end,
			})
		end,
	},
}
