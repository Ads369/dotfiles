-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = false })
end

-- Fix Movement at insert mode
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', 'kk', '<ESC>')

-- Switch off highlight search
vim.keymap.set('n', '<leader>,', ':nohlsearch<CR>')
vim.keymap.set('n', ',<leader>', ':nohlsearch<CR>')

-- Past without yanking
vim.keymap.set('v', '<leader>p', '"0p')

-- Easy select all of file
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

-- Mimic shell movements
-- vim.keymap.set('i', '<C-E>', '<ESC>A' )
-- vim.keymap.set('i', '<C-A>', '<ESC>I')

-- Quickly save the current buffer or all buffers
vim.keymap.set('n', '<leader>w', '<CMD>update<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>W', '<CMD>wall<CR>', { desc = 'Save all' })

-- Quit neovim
vim.keymap.set('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
vim.keymap.set('n', '<leader>o', 'o<ESC>')
vim.keymap.set('n', '<leader>O', 'O<ESC>')

-- Go to next or prev tab by H and L accordingly
vim.keymap.set('n', '<leader>t]', 'gt', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>t[', 'gT', { desc = 'Prev tab' })
vim.keymap.set('n', '<leader>td', ':bd!<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>te', ':tabedit', { desc = 'Create new tab' })

-- Move cursor to Old position and New position
vim.keymap.set('n', '<c-o>', '<c-o>zz')
vim.keymap.set('n', '<c-i>', '<c-i>zz')
-- Move to the next/previous buffer
vim.keymap.set('n', '<leader>b]', '<CMD>bn<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>b[', '<CMD>bp<CR>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<leader>bd', ':bd!<CR>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<leader>bD', ':%bd|e#<CR>', { desc = 'Close all another buffer' })


-- Split window
vim.keymap.set('n', '<C-w><up>', '<C-w>+', { desc = 'Increas height' })
vim.keymap.set('n', '<C-w><down>', '<C-w>-', { desc = 'Decreas height' })
vim.keymap.set('n', '<C-w><right>', '<C-w>>', { desc = 'Increas width' })
vim.keymap.set('n', '<C-w><left>', '<C-w><', { desc = 'Decreas width' })

-- Move line up and down in NORMAL and VISUAL modes <A-j> <A-k>
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set('n', '∆', '<CMD>move .+1<CR>', { desc = 'Move line down' })
vim.keymap.set('n', '˚', '<CMD>move .-2<CR>', { desc = 'Move line up' })
vim.keymap.set('x', '∆', ":move '>+1<CR>gv=gv")
vim.keymap.set('x', '˚', ":move '<-2<CR>gv=gv")

-- David-Kunz keymaps
vim.keymap.set('n', '<leader><esc><esc>', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>n', ':tabe ~/Downloads/tmp_notes.md<CR>', { desc = 'TMP file' })

-- vim.keymap.set('n', '<leader>x', ':lua send_line_to_terminal()<CR>')
-- vim.keymap.set('n', '<leader>ds', ':Telescope dap frames<CR>')
-- -- vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
-- vim.keymap.set('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')
-- vim.keymap.set('n', '\\', ':NvimTreeToggle<CR>', {silent=true})
-- vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- X without save char
-- vim.keymap.set('n', 'x', '"_x')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
