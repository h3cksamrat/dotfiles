local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap

return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup()
			nnoremap("<leader>gk", gitsigns.preview_hunk)
		end,
	},
}
