local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap
local nmap = Remap.nmap

nnoremap("<leader>u", ":UndotreeShow<CR>")
nnoremap("<leader>o", "o<ESC>")
nnoremap("<leader>O", "O<ESC>")

nnoremap("<C-\\>", "<CMD>vsplit<CR>")
nnoremap("<A-\\>", "<CMD>split<CR>")

nnoremap("<C-j>", "<CMD>move .+1<CR>")
nnoremap("<C-k>", "<CMD>move .-2<CR>")
xnoremap("<C-j>", ":move '>+1<CR>gv=gv")
xnoremap("<C-k>", ":move '<-2<CR>gv=gv")

nnoremap("<leader>h", "<C-w>h")
nnoremap("<leader>j", "<C-w>j")
nnoremap("<leader>k", "<C-w>k")
nnoremap("<leader>l", "<C-w>l")

tnoremap("<ESC>", "<C-\\><C-n>")

local nvim_tree_api = require("nvim-tree.api")
nnoremap("<C-b>", nvim_tree_api.tree.toggle)
nnoremap("<leader>b", nvim_tree_api.tree.toggle)
nnoremap("<leader>bf", nvim_tree_api.tree.focus)
nnoremap("<leader>i", function()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		nvim_tree_api.tree.change_root_to_node()
	end
end)

-- Toogle number
nnoremap("<leader>tr", function ()
  if (vim.o.relativenumber) then
    vim.o.relativenumber = false
    vim.o.number = true
  else
    vim.o.relativenumber = true
  end
end )

-- To disable arrow keys
local arrow_keys = { "<Left>", "<Right>", "<Up>", "<Down>" }
local modes = {nnoremap, vnoremap, inoremap }
for _, key in pairs(arrow_keys) do
	for __, mode in pairs(modes) do
		mode(key, "<nop>")
	end
end
