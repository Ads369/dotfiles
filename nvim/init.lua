print('init.lua loaded')
require('ads.base')
require('ads.appearance')
require('ads.keymaps')
require('ads.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('ads.macos')
end
if is_win then
  require('ads.windows')
end
