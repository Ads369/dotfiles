-- vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0 -- transparent for floating windows
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.pumheight = 10
-- vim.opt.background = 'dark'

-- Highlight the region on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
  end,
})
