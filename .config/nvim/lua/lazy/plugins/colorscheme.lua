function ColorMyPencils()
	vim.g.gruvbox_contrast_dark = "hard"
	vim.g.tokyonight_transparent_sidebar = true
	vim.g.tokyonight_transparent = true
	vim.g.gruvbox_invert_selection = "0"
	vim.opt.background = "dark"

	vim.cmd("colorscheme " .. vim.g.h3cksamrat_colorscheme)

	local hl = function(thing, opts)
		vim.api.nvim_set_hl(0, thing, opts)
	end

	hl("SignColumn", {
		bg = "none",
	})

	hl("ColorColumn", {
		ctermbg = 0,
		bg = "#555555",
	})

	hl("CursorLineNR", {
		bg = "None",
	})

	hl("Normal", {
		bg = "none",
	})

	hl("LineNr", {
		fg = "#5eacd3",
	})
end

return {
	{
		"folke/tokyonight.nvim",
		dependencies = {
			"ellisonleao/gruvbox.nvim",
		},
		config = function()
			vim.g.h3cksamrat_colorscheme = "tokyonight-night"
			ColorMyPencils()
		end,
	},
}
