local nvim_11 = vim.fn.has 'nvim-0.11' == 1

require('options')
require('keymaps')
require('plugins.lazy')
require('plugins.lualine')
require('plugins.tele')
require('plugins.treesitter')
require('plugins.lsp')
-- require('plugins.obsidian')
require('plugins.zenmode')
require('plugins.keymaps')
require('plugins.options')
require('workflows')
