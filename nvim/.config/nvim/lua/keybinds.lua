local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- Exit of insert mode
map("i", "jk", "<ESC>")

-- Quit neovim
map("n", "<C-Q>", "<CMD>q<CR>")

-- leader-o/O inserts blank line below/above
map("n", "<leader>o", "o<ESC>")
map("n", "<leader>O", "O<ESC>")

-- Copying the vscode behaviour of making tab splits
map("n", "<C-\\>", "<CMD>vsplit<CR>")
map("n", "<A-\\>", "<CMD>split<CR>")

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("n", "<C-j>", "<CMD>move .+1<CR>")
map("n", "<C-k>", "<CMD>move .-2<CR>")
map("x", "<C-j>", ":move '>+1<CR>gv=gv")
map("x", "<C-k>", ":move '<-2<CR>gv=gv")

-- Navigation pane movement
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

-- Exit from terminal mode
map("t", "<leader>tq", "<C-\\><C-n>")

-- NvimTree
local nvim_tree_api = require("nvim-tree.api")
map("n", "<C-b>", nvim_tree_api.tree.toggle)
map("n", "<leader>b", nvim_tree_api.tree.toggle)
map("n", "<leader>bf", nvim_tree_api.tree.focus)
map("n", "i", function()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		nvim_tree_api.tree.change_root_to_node()
	end
end)

-- Telescope
map("n", "<leader>ps", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ") })
end)
map("n", "<leader>pf", function()
	require("telescope.builtin").find_files()
end)
map("n", "<leader>pw", function()
	require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end)
map("n", "<leader>pb", function()
	require("telescope.builtin").buffers()
end)

-- To disable arrow keys
local arrow_keys = { "<Left>", "<Right>", "<Up>", "<Down>" }
local modes = { "n", "v", "i" }
for _, key in pairs(arrow_keys) do
	for __, mode in pairs(modes) do
		map(mode, key, "<nop>")
	end
end
