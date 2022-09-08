local g = vim.g
local o = vim.o

o.termguicolors = true

-- Better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes:1'
o.cursorline = true

o.timeoutlen = 500
o.updatetime = 200

o.scrolloff = 8

o.clipboard = 'unnamedplus'

o.ignorecase = true
o.smartcase = true

o.history = 50

o.expandtab = true
o.wrap = true
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = -1

o.hlsearch = false
o.hidden = true

-- o.splitright = true
-- o.splitbelow = true

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '
