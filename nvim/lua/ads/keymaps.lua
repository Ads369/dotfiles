-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = false })
end

-- Fix Movement at insert mode
map('i', 'jj', '<ESC>')
map('i', 'kk', '<ESC>')

-- Switch off highlight search
map('n', '<leader>,', ':nohlsearch<CR>')
map('n', ',<leader>', ':nohlsearch<CR>')

-- Past without yanking
map('v', '<leader>p', '"0p')

-- Easy select all of file
map('n', '<C-a>', 'gg<S-v>G')

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Quickly save the current buffer or all buffers
map('n', '<leader>s', '<CMD>update<CR>')
map('n', '<leader>S', '<CMD>wall<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- New tab
map('n', 'te', ':tabedit')
-- Go to next or prev tab by H and L accordingly
map('n', ']t', 'gt')
map('n', '[t', 'gT')
map('n', 'ct', ':tabclose<CR>')

-- Move cursor to Old position and New position
map('n', '<c-o>', '<c-o>zz')
map('n', '<c-i>', '<c-i>zz')
-- Move to the next/previous buffer
map('n', ']b', '<CMD>bn<CR>')
map('n', '[b', '<CMD>bp<CR>')
map('n', 'cb', '<CMD>Bclose<CR>')
-- map('n', 'gq', ':bd!<CR>')
-- map('n', '[b', ':bnext<CR>')
-- map('n', ']b', ':bprev<CR>')
-- Little support for 'gd'
map('n', 'gb', '<C-o>')

-- Split window
map('n', 'ss', ':split<Return>')
map('n', 'sv', ':vsplit<Return>')
-- Move window
map('', 'sh', '<C-w>h')
map('', 'sk', '<C-w>k')
map('', 'sj', '<C-w>j')
map('', 'sl', '<C-w>l')
-- Resize window
map('n', '<C-w><left>', '<C-w><')
map('n', '<C-w><right>', '<C-w>>')
map('n', '<C-w><up>', '<C-w>+')
map('n', '<C-w><down>', '<C-w>-')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
-- map('n', '<A-j>', '<CMD>move .+1<CR>')
-- map('n', '<A-k>', '<CMD>move .-2<CR>')
-- map('x', '<A-j>', ":move '>+1<CR>gv=gv")
-- map('x', '<A-k>', ":move '<-2<CR>gv=gv")

-- David-Kunz keymaps
-- map('n', '<leader><esc><esc>', ':tabclose<CR>')
map('n', '<leader>n', ':tabe ~/tmp/notes.md<CR>')

-- map('n', '<leader>x', ':lua send_line_to_terminal()<CR>')
-- map('n', '<leader>ds', ':Telescope dap frames<CR>')
-- -- vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
-- map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')
-- map('n', '\\', ':NvimTreeToggle<CR>', {silent=true})
-- map('t', '<Esc>', '<C-\\><C-n>')

-- X without save char
-- map('n', 'x', '"_x')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
