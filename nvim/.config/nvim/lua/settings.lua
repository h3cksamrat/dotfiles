local g = vim.g
local o = vim.o

vim.notify = require("notify")

o.termguicolors = true

-- Better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes:1'
o.cursorline = true
o.colorcolumn = 80

o.timeoutlen = 500
o.updatetime = 200

o.scrolloff = 8

o.clipboard = 'unnamedplus'

o.ignorecase = true
o.smartcase = true

o.history = 50

o.expandtab = true
o.smarttab = true
o.wrap = true
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = -1

o.hlsearch = false
o.hidden = true
o.incsearch = true

o.fileencoding = 'utf-8'

o.splitright = true
o.splitbelow = true

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '
g.bufferline = {
  animation = true,
  tabpages = true,
  clickable = true,
  icon_close_tab = "",
  icon_separator_active = "",
  icon_separator_inactive = "",
}
