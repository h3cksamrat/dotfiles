local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

vnoremap("<leader>sc", "<cmd>Freeze<CR>")
nnoremap("<leader>sc", "<cmd>Freeze<CR>")
