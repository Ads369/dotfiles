local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- telescope-file-browser
local fb_actions = require "telescope".extensions.file_browser.actions
telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}
telescope.load_extension("file_browser")
telescope.load_extension('fzf')

vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end, { desc = 'file' })
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end, { desc = 'grep' })
vim.keymap.set('n', ';b', function()
  builtin.buffers()
end, { desc = 'buffer' })
vim.keymap.set('n', ';h', function()
  builtin.help_tags()
end, { desc = 'help' })
vim.keymap.set('n', ';;', function()
  builtin.resume()
end, { desc = 'recent' })
vim.keymap.set('n', ';d', function()
  builtin.diagnostics()
end, { desc = 'diagnostic' })
vim.keymap.set("n", ";\\", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end, { desc = 'file browser' })


-- Telescope old keymaps
-- vim.keymap.set('n', '<leader>fn', ':Telescope find_files<CR>')
-- map('n', '<leader>fr', ':Telescope resume<CR>')
-- map('n', '<leader>ff', ':Telescope live_grep<CR>')
-- map('n', '<leader>FF', ':Telescope grep_string<CR>')
-- map('n', '<leader>fG', ':Telescope git_branches<CR>')
-- map('n', '<leader>fg', ':Telescope git_status<CR>')
-- -- map('n', '<c-\\>', ':Telescope buffers<CR>')
-- map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
