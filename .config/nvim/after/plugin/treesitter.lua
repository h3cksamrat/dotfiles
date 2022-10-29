require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  sync_install = false,
  highlight = { enable = true, additional_vim_regex_highlighting = false,},
  rainbow = {
    enable = true,
  },
  refactor = {
    navigation = {
      enable = true,
      keymaps = {
        goto_next_usage = "<A-*>",
        goto_previous_usage = "<A-#>",
      },
    },
  },
})
