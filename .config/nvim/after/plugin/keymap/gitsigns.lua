local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap

local gitsigns = require('gitsigns')

nnoremap("<leader>k", gitsigns.preview_hunk)
