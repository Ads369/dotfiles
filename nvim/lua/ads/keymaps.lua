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
map('n', '<leader>te', ':tabedit')
-- Go to next or prev tab by H and L accordingly
map('n', '<leader>t]', 'gt')
map('n', '<leader>t[', 'gT')
map('n', '<leader>td', ':bd!<CR>')

-- Move cursor to Old position and New position
map('n', '<c-o>', '<c-o>zz')
map('n', '<c-i>', '<c-i>zz')
-- Move to the next/previous buffer
map('n', '<leader>b]', '<CMD>bn<CR>')
map('n', '<leader>b[', '<CMD>bp<CR>')
map('n', '<leader>bd', ':bd!<CR>')
map('n', '<leader>bo', ':%bd|e#<CR>')


-- Split window
map('n', '<leader>ss', ':split<Return>')
map('n', '<leader>sv', ':vsplit<Return>')
-- Move window
map('', '<leader>sh', '<C-w>h')
map('', '<leader>sk', '<C-w>k')
map('', '<leader>sj', '<C-w>j')
map('', '<leader>sl', '<C-w>l')
-- Resize window
map('n', '<leader>w<left>', '<C-w><')
map('n', '<leader>w<right>', '<C-w>>')
map('n', '<leader>w<up>', '<C-w>+')
map('n', '<leader>w<down>', '<C-w>-')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<A-j>', '<CMD>move .+1<CR>')
map('n', '<A-k>', '<CMD>move .-2<CR>')
map('x', '<A-j>', ":move '>+1<CR>gv=gv")
map('x', '<A-k>', ":move '<-2<CR>gv=gv")

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
