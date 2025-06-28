return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"saadparwaiz1/cmp_luasnip",
			"roobert/tailwindcss-colorizer-cmp.nvim",
			{
				"supermaven-inc/supermaven-nvim",
				config = function()
					require("supermaven-nvim").setup({
						-- disable_inline_completion = true,
					})
				end,
			},
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
			vim.opt.shortmess:append("c")

			vim.api.nvim_set_option("updatetime", 300)

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('vsnip').lsp_expand(args.body) -- For `vsnip` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				formatting = {
					-- Youtube: How to set up nice formatting for your sources.
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							buffer = "[buf]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[api]",
							path = "[path]",
							luasnip = "[lsnip]",
							vsnip = "[vsnip]",
						},
					}),
				},
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "vsnip", keyword_length = 2 },
					{ name = "nvim_lua", keyword_length = 2 },
					{ name = "luasnip", keyword_length = 2 }, -- For luasnip users.
				}, {
					{ name = "buffer", keyword_length = 2 },
				}),
			})

			if vim.g.snippets ~= "luasnip" then
				return
			end

			local ls = require("luasnip")
			local types = require("luasnip.util.types")

			ls.config.set_config({
				history = true,

				updateevents = "TextChanged,TextChangedI",

				enable_autosnippets = true,
				delete_check_events = "TextChanged",
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = {
								{
									" « ",
									"Error",
								},
							},
						},
					},
				},
			})

			if vim.g.snippets ~= "luasnip" then
				return
			end

			local ls = require("luasnip")

			vim.keymap.set({ "i", "s" }, "<c-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true, noremap = true })

			vim.keymap.set({ "i", "s" }, "<c-j>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true, noremap = true })

			vim.keymap.set({ "i", "s" }, "<c-l>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { noremap = true })

			vim.keymap.set({ "i", "s" }, "<c-u>", require("luasnip.extras.select_choice"), { noremap = true })

			require("h3cksamrat.luasnip.snippets")
		end,
	},
}
