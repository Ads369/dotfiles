local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    python = 'python',
    -- typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>lk', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>lj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', '<leader>lf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', '<leader>lp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>lr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
