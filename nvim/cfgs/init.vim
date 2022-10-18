"===============
"== PLUGINS ===
"===============


call plug#begin('~/.vim/plugged')

" general
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'


" color schemas
Plug 'morhetz/gruvbox'  " colorscheme gruvbox
Plug 'mhartington/oceanic-next'  " colorscheme OceanicNext
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'xiyaowong/nvim-transparent' " transparent 

" JS/JSX/TS
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'maxmellon/vim-jsx-pretty'
" TS from here https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
" Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
" Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'psf/black', { 'branch': 'stable' }

 "search
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

"================
"=== SETTINGS ===
"================

syntax enable
filetype plugin indent on 

set mouse=a  " enable mouse
set encoding=utf-8
set number
set noswapfile
set scrolloff=7
set colorcolumn=79
set clipboard+=unnamedplus
lang en_US.UTF-8

" for tabulation
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

" colors
colorscheme gruvbox
" if (has('termguicolors'))
"  set termguicolors
" endif
" syntax enable


"================
"=== SETTINGS ===
"================
" Leader bind to space
let mapleader = " "

inoremap jk <esc>
inoremap jj <esc>

" Quit neovim 
nnoremap <C-Q> <CMD>q<CR>

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

" Fix * (Keep the cursor position, don't move to next match) 
nnoremap * *N

" Fix n and N. Keeping cursor in center
nnoremap n nzz
nnoremap N Nzz

" Mimic shell movements
inoremap <C-E> <ESC>A
inoremap <C-A> <ESC>I

" Quickly save the current buffer or all buffers
nnoremap <leader>w <CMD>update<CR>
nnoremap <leader>W <CMD>wall<CR>


" leader-o/O inserts blank line below/above
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" Go to next or prev tab by H and L accordingly
nnoremap H gT
nnoremap L gt

" Move to the next/previous buffer
nnoremap <leader>[ <CMD>bp<CR>
nnoremap <leader>] <CMD>bn<CR>
map gn :bn<cr>
map gp :bp<cr>
map gw :Bclose<cr>
" nnoremap [b :bnext<CR>
" nnoremap ]b :bprev<CR>

" Move to last buffer
nnoremap  <CMD>b#<CR>

" Copying the vscode behaviour of making tab splits
nnoremap <C-\\> <CMD>vsplit<CR>
nnoremap <A-\\> <CMD>split<CR>
nnoremap « <CMD>split<CR>

" Move line up and down in NORMAL and VISUAL modes
" Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
" Control Move
nnoremap <C-j> <CMD>move .+1<CR>
nnoremap <C-k> <CMD>move .-2<CR>
vnoremap <C-j> >+1<CR>gv=gv")
vnoremap <C-k> <-2<CR>gv=gv")

" Alt move
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Use operator pending mode to visually select the whole buffer
" e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
onoremap A :<C-U>normal! mzggVG<CR>`z
xnoremap A :<C-U>normal! ggVG<CR>

" Little support for 'gd'
nnoremap gb <C-o>

" Split line
function! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction
nnoremap <C-K> :<C-u>call BreakHere()<CR>


" Telescope
nnoremap <leader>fn :Telescope find_files<CR>
nnoremap <leader>fr :Telescope resume<CR>
nnoremap <leader>fG :Telescope git_branches<CR>
nnoremap <leader>fg :Telescope git_status<CR>
nnoremap <c-\\> :Telescope buffers<CR>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>FF :Telescope grep_string<CR>

" David-Kunz
" map('n', '<leader><esc><esc>', ':tabclose<CR>')
" map('n', '<leader>n', ':tabe ~/tmp/notes.md<CR>')
" map('n', '<c-y>', toggle_terminal)

" map('i', '<c-y>', '<ESC>:lua toggle_terminal()<CR>')
" map('t', '<c-y>', '<c-\\><c-n>:lua toggle_terminal()<CR>')

" map('n', '<leader>x', ':lua send_line_to_terminal()<CR>')
" map('n', '<c-o>', '<c-o>zz')
" map('n', '<c-i>', '<c-i>zz')

" map('n', '<leader>ds', ':Telescope dap frames<CR>')
" vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
" map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')


" map('n', '\\', ':NvimTreeToggle<CR>', {silent=true})
" map('n', 'gq', ':bd!<CR>')
" map('n', '<leader>w', ':w<CR>')
" map('t', '<Esc>', '<C-\\><C-n>')

" Easy select all of file
nnoremap <Leader>A ggVG<c-$>

" Netrw file explorer settings {{{
let g:netrw_banner = 1 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " vertical split window when Enter pressed on file
" }}}

" Telescope setting {{{
" Telescope bindings
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>

" Telescope fzf plugin
" lua << EOF
" require('telescope').load_extension('fzf')
" EOF
" " Telescope command_palette plugin
" lua << EOF
" require('telescope').setup({
"   extensions = {
"     command_palette = {
"       {"File",
"         { "entire selection (C-a)", ':call feedkeys("GVgg")' },
"         { "save current file (C-s)", ':w' },
"         { "save all files (C-A-s)", ':wa' },
"         { "quit (C-q)", ':qa' },
"         { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
"         { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
"         { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
"         { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
"       },
"       {"Help",
"         { "tips", ":help tips" },
"         { "cheatsheet", ":help index" },
"         { "tutorial", ":help tutor" },
"         { "summary", ":help summary" },
"         { "quick reference", ":help quickref" },
"         { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
"       },
"       {"Vim",
"         { "reload vimrc", ":source $MYVIMRC" },
"         { 'check health', ":checkhealth" },
"        { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
"         { "commands", ":lua require('telescope.builtin').commands()" },
"         { "command history", ":lua require('telescope.builtin').command_history()" },
"         { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
"         { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
"         { "vim options", ":lua require('telescope.builtin').vim_options()" },
"         { "keymaps", ":lua require('telescope.builtin').keymaps()" },
"         { "buffers", ":Telescope buffers" },
"         { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
"         { "paste mode", ':set paste!' },
"         { 'cursor line', ':set cursorline!' },
"         { 'cursor column', ':set cursorcolumn!' },
"         { "spell checker", ':set spell!' },
"         { "relative number", ':set relativenumber!' },
"         { "search highlighting (F12)", ':set hlsearch!' },
"       }
"     }
"   }
" })
" require('telescope').load_extension('command_palette')
" EOF
" " }}}




" lua << EOF
" -- Set completeopt to have a better completion experience
" vim.o.completeopt = 'menuone,noselect'

" -- luasnip setup
" local luasnip = require 'luasnip'

" -- nvim-cmp setup
" local cmp = require 'cmp'
" cmp.setup {
"   completion = {
"     autocomplete = true
"   },
"   snippet = {
"     expand = function(args)
"       require('luasnip').lsp_expand(args.body)
"     end,
"   },
"   mapping = {
"     ['<C-p>'] = cmp.mapping.select_prev_item(),
"     ['<C-n>'] = cmp.mapping.select_next_item(),
"     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"     ['<C-f>'] = cmp.mapping.scroll_docs(4),
"     ['<C-Space>'] = cmp.mapping.complete(),
"     ['<C-e>'] = cmp.mapping.close(),
"     ['<CR>'] = cmp.mapping.confirm {
"       behavior = cmp.ConfirmBehavior.Replace,
"       select = true,
"     },
"     ['<Tab>'] = function(fallback)
"       if vim.fn.pumvisible() == 1 then
"         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
"       elseif luasnip.expand_or_jumpable() then
"         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
"       else
"         fallback()
"       end
"     end,
"     ['<S-Tab>'] = function(fallback)
"       if vim.fn.pumvisible() == 1 then
"         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
"       elseif luasnip.jumpable(-1) then
"         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
"       else
"         fallback()
"       end
"     end,
"   },
"   sources = {
"     { name = 'nvim_lsp' },
"     { name = 'luasnip' },
"   },
" }
" EOF


lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF



" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>


" run current script with python3 by CTRL+R in command and insert mode
autocmd FileType python map <buffer> <C-r> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-r> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" black formatting
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
nnoremap <F9> :Black<CR>
