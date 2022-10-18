-------------------------------------------------
-- ADS'S NEOVIM CONFIGURATION
-- Neovim website: https://neovim.io/
--
-- Inspired by
-- DT's dotfiles: https://gitlab.com/dwt1/dotfiles
-- numToStr's dotfiles: https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim
-- David-Kunz's dotfiles: https://github.com/David-Kunz/vim
-------------------------------------------------


local g   = vim.g
local o   = vim.o
local opt = vim.opt
local cmd = vim.cmd
local A   = vim.api

-------------------------------------------------
-- SETTING
-------------------------------------------------

g.mapleader = " "
o.clipboard = 'unnamedplus'
opt.mouse = "a"

--o.termguicolors = true

opt.laststatus = 3

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 7

-- Draw line
vim.wo.colorcolumn = '79'

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 520

-- Better editor UI
o.number = true
o.numberwidth = 2
-- o.relativenumber = true
opt.signcolumn = 'yes'

-- Better editing experience
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true


--  I don't know what is it
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Set completeopt to have a better completion experience
opt.completeopt = {'menu', 'menuone', 'noselect'}

-- NETRW
g.netrw_banner = false
g.netrw_liststyle = 3

-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------

-- Uncomment just ONE of the following colorschemes!
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-dracula')
vim.cmd 'colorscheme gruvbox'

-- Highlight the region on yank
A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix Movement at insert mode
map('i', 'jj', '<ESC>')
map('i', 'kk', '<ESC>')

-- Switch off highlight search
map('n',',<space>',':nohlsearch<CR>')

-- Fix * (Keep the cursor position, don't move to next match)
-- map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
-- map('n', 'n', 'nzz')
-- map('n', 'N', 'Nzz')

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')


-- Go to next or prev tab by H and L accordingly
map('n', 'H', 'gT')
map('n', 'L', 'gt')

-- Move to the next/previous buffer
map('n', '<leader>[', '<CMD>bp<CR>')
map('n', '<leader>]', '<CMD>bn<CR>')
map('n', 'gp', '<CMD>bp<CR>')
map('n', 'gn', '<CMD>bn<CR>')
map('n', 'gw', '<CMD>Bclose<CR>')

-- Move to last buffer
map('n', "''", '<CMD>b#<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')
map('n', '«', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- Little support for 'gd'
map('n','gb','<C-o>')


-- Telescope
map('n', '<leader>fn', ':Telescope find_files<CR>')
map('n', '<leader>fr', ':Telescope resume<CR>')
map('n', '<leader>fG', ':Telescope git_branches<CR>')
map('n', '<leader>fg', ':Telescope git_status<CR>')
-- map('n', '<c-\\>', ':Telescope buffers<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>ff', ':Telescope live_grep<CR>')
map('n', '<leader>FF', ':Telescope grep_string<CR>')

-------------------------------------------------
-- PLUGINS
-------------------------------------------------

require('packer').init({
  display = {
    open_cmd = 'vnew \\[packer\\]',
  }
})

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]


require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Colorschemes --
  use 'morhetz/gruvbox'
  use 'xiyaowong/nvim-transparent'

  -- Generel --
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- Other --
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'psf/black' -- Formatter for Python

  -- Search --
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

end)


-------------------------------------------------
-- PLUGINS SETTING
-------------------------------------------------

  ---------------------
  -- lspconfig --
  ---------------------

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
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
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

  ---------------------
  -- L3MON4D3/LuaSnip --
  ---------------------

  -- luasnip setup
  local ls = require 'luasnip'

  -- nvim-cmp setup
  local cmp = require 'cmp'
  cmp.setup {
    completion = {
      autocomplete = true
    },
    snippet = {
      expand = function(args)
        ls.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if ls.jumpable(-1) then
          ls.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }


  ---------------------
  -- Telescope --
  ---------------------
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }
  require('telescope').load_extension('fzf')
