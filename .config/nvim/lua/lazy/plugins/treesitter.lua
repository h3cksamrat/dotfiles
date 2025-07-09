local nnoremap = require("h3cksamrat.keymap").nnoremap

function ContextSetup(show_all_context)
	require("treesitter-context").setup({
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		throttle = true, -- Throttles plugin updates (may improve performance)
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		show_all_context = show_all_context,
		patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
			-- For all filetypes
			-- Note that setting an entry here replaces all other patterns for this entry.
			-- By setting the 'default' entry below, you can control which nodes you want to
			-- appear in the context window.
			default = {
				"function",
				"method",
				"for",
				"while",
				"if",
				"switch",
				"case",
			},

			rust = {
				"loop_expression",
				"impl_item",
			},

			typescript = {
				"class_declaration",
				"abstract_class_declaration",
				"else_clause",
			},
		},
	})
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		dependencies = {
			"romgrk/nvim-treesitter-context",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"typescript",
					"javascript",
					"lua",
					"json",
					"yaml",
					"comment",
					"html",
					"css",
					"bash",
				},
				enable = true,
				sync_install = false,
				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
			})

			nnoremap("<leader>cf", function()
				ContextSetup(true)
			end)
			nnoremap("<leader>cp", function()
				ContextSetup(false)
			end)
			ContextSetup(true)
		end,
	},
}
