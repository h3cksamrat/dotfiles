return {
	{
		"yetone/avante.nvim",
		build = function()
			-- conditionally use the correct build system for the current OS
			if vim.fn.has("win32") == 1 then
				return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource true"
			else
				return "make"
			end
		end,
		lazy = false,
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			provider = "copilot",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				"supermaven-inc/supermaven-nvim",
				event = "InsertEnter",
				cmd = {
					"SupermavenUseFree",
					"SupermavenUsePro",
				},
				opts = {
					ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
				},
			},
			{
				"Exafunction/windsurf.nvim",
				dependencies = {
					"nvim-lua/plenary.nvim",
					"hrsh7th/nvim-cmp",
				},
				config = function()
					require("codeium").setup({})
				end,
			},

			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
