local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Exit of insert mode
map('i', 'jk', '<ESC>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Navigation pane movement
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- Exit from terminal mode
map('t', '<leader>tq', '<C-\\><C-n>')

-- NvimTree
local nvim_tree_api = require('nvim-tree.api')
map('n', '<C-b>', nvim_tree_api.tree.toggle)

local telescope_search = function()
   require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })
 end

map('n', '<leader>ps', telescope_search)
