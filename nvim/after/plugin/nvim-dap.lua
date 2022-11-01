local status, dap = pcall(require, "dap")
if (not status) then return end
local status, dap_py = pcall(require, "dap-python")
if (not status) then return end
local status, dap_ui = pcall(require, "dapui")
if (not status) then return end

dap_py.setup()
dap_ui.setup()

vim.fn.sign_define('DapBreakpoint',
  { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected',
  { text = '🟦', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped',
  { text = '⭐️', texthl = '', linehl = '', numhl = '' })

vim.keymap.set('n', '<leader>dh', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', '<leader>dsk', function() dap.step_out() end)
vim.keymap.set('n', '<leader>dsl', function() dap.step_into() end)
vim.keymap.set('n', '<leader>dsj', function() dap.step_over() end)
vim.keymap.set('n', '<leader>dsh', function() dap.continue() end)
vim.keymap.set('n', '<leader>dn', function() dap.run_to_cursor() end)
vim.keymap.set('n', '<leader>dc', function() dap.terminate() end)
vim.keymap.set('n', '<leader>dR', function() dap.clear_breakpoints() end)
vim.keymap.set('n', '<leader>de', function() dap.set_exception_breakpoints({ "all" }) end)
vim.keymap.set('n', '<leader>da', function() require "debugHelper".attach() end)
vim.keymap.set('n', '<leader>dA', function() require "debugHelper".attachToRemote() end)
vim.keymap.set('n', '<leader>di', function() require "dap.ui.widgets".hover() end)

--UI
vim.keymap.set('n', '<leader>d?', function() local widgets = require "dap.ui.widgets";
  widgets.centered_float(widgets.scopes)
end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
vim.keymap.set('n', '<leader>du', ':lua require"dapui".toggle()<CR>')
