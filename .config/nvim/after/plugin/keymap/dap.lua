local Remap = require("h3cksamrat.keymap")
local nmap = Remap.nmap

local dap = require("dap")

nmap("<F5>", dap.continue)
nmap("<F10>", dap.step_over)
nmap("<F11>", dap.step_into)
nmap("<F12>", dap.step_out)
nmap("<leader>b", dap.toggle_breakpoint)
nmap("<leader>B", function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
nmap("<leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
nmap("<leader>dr", dap.repl.open)

nmap("<leader>dgt", require("dap-go").debug_test, { silent = true })
