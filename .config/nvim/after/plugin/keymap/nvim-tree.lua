local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap

local nvim_tree_api = require("nvim-tree.api")
nnoremap("<C-b>", nvim_tree_api.tree.toggle)
nnoremap("<leader>i", function()
  local view = require("nvim-tree.view")
  if view.is_visible() then
    nvim_tree_api.tree.change_root_to_node()
  end
end)
