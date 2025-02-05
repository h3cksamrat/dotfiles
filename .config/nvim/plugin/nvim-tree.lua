require("nvim-tree").setup({
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	actions = { open_file = { quit_on_open = true } },
	filters = { custom = { "^.git$" } },
	diagnostics = { enable = true },
})
