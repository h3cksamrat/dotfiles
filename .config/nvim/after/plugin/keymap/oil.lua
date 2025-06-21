local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

nnoremap("-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

nnoremap("<C-b>", function()
	cwd = vim.fn.getcwd()
	require("oil").toggle_float(cwd)
end, { desc = "Toggle Oil float" })
