local status_ok, black = pcall(require, "black")
if not status_ok then return end

-- vim.keymap('n', '<leader>f', '<CMD>Black<CR>')
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'format python on write using black',

  group = vim.api.nvim_create_augroup('black_on_save', { clear = true }),
  callback = function(opts)
    if vim.bo[opts.buf].filetype == 'python' then
      vim.cmd 'Black'
    end
  end,
})
