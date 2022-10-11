local g = vim.g
local o = vim.o

o.termguicolors = true

-- Better editor UI
o.number = true
o.relativenumber = true
o.signcolumn = 'yes:1'
o.cursorline = true
o.colorcolumn = "80"

o.timeoutlen = 500
o.updatetime = 200

o.scrolloff = 8
o.clipboard = 'unnamedplus'

o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true
o.grepprg="rg --vimgrep --smart-case --follow"

o.expandtab = true
o.smarttab = true
o.wrap = true
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = -1

o.splitright = true
o.splitbelow = true

o.hidden = true
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '
