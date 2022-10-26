local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  hijack_cursor = true,
  hijack_netrw = false,
  update_focused_file = { enable = true },
  view = {
    width = 60
  }
})
vim.keymap.set('n', '\\\\', ':NvimTreeToggle<CR>', { silent = true })
