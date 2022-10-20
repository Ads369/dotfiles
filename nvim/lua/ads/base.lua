-------------------------------------------------
-- ADS'S NEOVIM CONFIGURATION
-- Neovim website: https://neovim.io/
--
-- Inspired by
-- DT's dotfiles: https://gitlab.com/dwt1/dotfiles
-- numToStr's dotfiles: https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim
-- David-Kunz's dotfiles: https://github.com/David-Kunz/vim
-- alexey-goloburdin's config :https://github.com/alexey-goloburdin/nvim-config
-- craftzdog's: https://github.com/craftzdog/dotfiles-public
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
------------------------------------------------

-- Uncomment just ONE of the following colorschemes!
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-dracula')
local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox')

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
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Mimic shell movements
-- map('i', '<C-E>', '<ESC>A')
-- map('i', '<C-A>', '<ESC>I')

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
map('n', '<leader><esc><esc>', ':tabclose<CR>')

-- Move to the next/previous buffer
map('n', '<leader>[', '<CMD>bp<CR>')
map('n', '<leader>]', '<CMD>bn<CR>')
map('n', 'gp', '<CMD>bp<CR>')
map('n', 'gn', '<CMD>bn<CR>')
map('n', 'gw', '<CMD>Bclose<CR>')
-- vim.keymap.set('n', 'gq', ':bd!<CR>')
-- map('n', '[b', ':bnext<CR>')
-- map('n', ']b', ':bprev<CR>')

-- Move to last buffer
-- map('n', "''", '<CMD>b#<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')

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
map('n', '<leader>ff', ':Telescope live_grep<CR>')
map('n', '<leader>FF', ':Telescope grep_string<CR>')
map('n', '<leader>fG', ':Telescope git_branches<CR>')
map('n', '<leader>fg', ':Telescope git_status<CR>')
-- map('n', '<c-\\>', ':Telescope buffers<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')

-- David-Kunz
-- map('n', '<leader><esc><esc>', ':tabclose<CR>')
-- map('n', '<leader>n', ':tabe ~/tmp/notes.md<CR>')


-- map('n', '<leader>x', ':lua send_line_to_terminal()<CR>')
-- map('n', '<c-o>', '<c-o>zz')
-- map('n', '<c-i>', '<c-i>zz')

-- map('n', '<leader>ds', ':Telescope dap frames<CR>')
-- -- vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
-- map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')


-- map('n', '\\', ':NvimTreeToggle<CR>', {silent=true})
-- map('n', 'gq', ':bd!<CR>')
-- map('n', '<leader>w', ':w<CR>')
-- map('t', '<Esc>', '<C-\\><C-n>')

-- Easy select all of file
map('n', '<Leader>A', 'ggVG<c-$>')


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

  -- LSP and CMP --
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use "ray-x/lsp_signature.nvim" 
  use 'mhartington/formatter.nvim'
  use({ "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga()
    end,
  })

  -- Auto complete --
  use {'psf/black', branch= 'stable' }
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  
  -- Errors log from LSP --
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Icons --
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Line --
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- File explorer --
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- Other --
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  -- use 'majutsushi/tagbar'
  -- use "jose-elias-alvarez/null-ls.nvim"

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Search --
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} , {'nvim-lua/popup.nvim'} }
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

  -- Use for connect poetry
  local configs = require('lspconfig/configs')
  local util = require('lspconfig/util')
  local path = util.path

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
  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- buf_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  end
  map('n', 'gd', function() vim.lsp.buf.definition() end)
  map('n', 'gh', function() vim.lsp.buf.hover() end)
  map('n', 'gD', function() vim.lsp.buf.implementation() end)
  map('n', '<c-k>', function() vim.lsp.buf.signature_help() end)
  map('n', 'gr', function() vim.lsp.buf.references() end)
  map('n', 'gR', function() vim.lsp.buf.rename() end)
  map('n', 'ga', function() vim.lsp.buf.code_action() end)
  map('n', 'gA', ':Telescope lsp_range_code_actions<CR>')

  --Poetry # TODO need check how it's work
  local function get_python_path(workspace)
      -- Use activated virtualenv.
      if vim.env.VIRTUAL_ENV then
          return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
      end

      -- Find and use virtualenv via poetry in workspace directory.
      local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
      if match ~= "" then
          local venv = vim.fn.trim(vim.fn.system "poetry env info -p")
          return path.join(venv, "bin", "python")
      end

      -- Fallback to system Python.
      return vim.fn.exepath "python3" or vim.fn.exepath "python" or "python"
  end

  require("lspconfig").pyright.setup {
      on_init = function(client)
          client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
      end,
  }

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
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local ls = require 'luasnip'
  local cmp = require 'cmp'

  cmp.setup {
    -- completion = {
    --   autocomplete = true
    -- },
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
        if cmp.visible() then
          cmp.select_next_item()
        elseif ls.expand_or_jumpable() then
          ls.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif ls.jumpable(-1) then
          ls.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' }, 
      -- { name = 'nvim_lsp_signature_help' },
    }, {
      { name = 'buffer' },
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

  ---------------------
  -- nvim-tree --
  ---------------------
  require('nvim-tree').setup({
    hijack_cursor = true,
    update_focused_file = { enable = true },
    view = {
      width = 60
    }
  })
  vim.keymap.set('n', '\\', ':NvimTreeToggle<CR>', {silent=true})



  ---------------------
  -- Icon --
  ---------------------
  require'nvim-web-devicons'.setup({
    override = {
      lir_folder_icon = {
        -- icon = "",
        color = "#7ebae4",
        name = "LirFolderNode"
      },
    }
  })



  ---------------------
  -- lewis6991/gitsigns.nvim
  ---------------------
  function diffThisBranch()
   local branch = vim.fn.input("Branch: ", "")
   require"gitsigns".diffthis(branch)
  end

  require('gitsigns').setup({
    -- signs = {
    --   add = { hl = 'GitGutterAdd', text = '+' },
    --   change = { hl = 'GitGutterChange', text = '~' },
    --   delete = { hl = 'GitGutterDelete', text = '_' },
    --   topdelete = { hl = 'GitGutterDelete', text = '‾' },
    --   changedelete = { hl = 'GitGutterChange', text = '~' },
    -- },
    current_line_blame = true,
    on_attach = function(bufnr)
         -- Navigation
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

      -- Actions
      vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
      vim.keymap.set('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
      vim.keymap.set('n', '<leader>hb', function() require"gitsigns".blame_line{full=true} end)
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
      vim.keymap.set('n', '<leader>hD', function() require"gitsigns".diffthis("~") end)
      vim.keymap.set('n', '<leader>hm', function() require"gitsigns".diffthis("main")end)
      vim.keymap.set('n', '<leader>hM', diffThisBranch)
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

      -- Text object
      vim.keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      vim.keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
  })


  ---------------------
  -- treesitter -- 
  ---------------------
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
    -- playground = {
    --   enable = true,
    -- }
    -- rainbow = {
    --   enable = true,
    --   extended_mode = true
    -- }
    -- indent = {
    --   enable = true
    -- },
  }



  ---------------------
  -- black -- 
  ---------------------
  map('n', '<leader>f', '<CMD>Black<CR>')
  vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'format python on write using black',

    group = vim.api.nvim_create_augroup('black_on_save', { clear = true }),
    callback = function (opts)
      if vim.bo[opts.buf].filetype == 'python' then
        vim.cmd 'Black'
      end
    end,
  })

  ---------------------
  -- autopairs -- 
  ---------------------
  require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
  })
  
  ---------------------
  -- lsp_signature -- 
  ---------------------
  cfg = {
    debug = false, -- set to true to enable debug logging
    log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
    -- default is  ~/.cache/nvim/lsp_signature.log
    verbose = false, -- show debug line number

    bind = true, -- This is mandatory, otherwise border config won't get registered.
                 -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                   -- set to 0 if you DO NOT want any API comments be shown
                   -- This setting only take effect in insert mode, it does not affect signature help in normal
                   -- mode, 10 by default

    max_height = 12, -- max height of signature floating_window
    max_width = 80, -- max_width of signature floating_window
    wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
    
    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

    floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
    -- will set to true when fully tested, set to false will use whichever side has more space
    -- this setting will be helpful if you do not want the PUM and floating win overlap

    floating_window_off_x = 1, -- adjust float windows x position.
    floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

    close_timeout = 4000, -- close floating window after ms when laster parameter is entered
    fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = false, -- virtual hint enable
    hint_prefix = "🐼 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
    handler_opts = {
      border = "single"   -- double, rounded, single, shadow, none
    },

    always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

    auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
    extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

    padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

    transparency = nil, -- disabled by default, allow floating win transparent value 1~100
    shadow_blend = 36, -- if you using shadow as border use this set the opacity
    shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
    timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
    toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

    select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
    move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
  }

  -- recommended:
  require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

  -- You can also do this inside lsp on_attach
  -- note: on_attach deprecated
  -- require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key

  -- Signature in status line
  -- require("lsp_signature").status_line(80)

   
  ---------------------
  -- lsp_signature -- 
  ---------------------
  local status, lualine = pcall(require, "lualine")
  if (not status) then return end

  lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'solarized_dark',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
      } },
      lualine_x = {
        { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
          hint = ' ' } },
        'encoding',
        'filetype'
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      } },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = { 'fugitive' }
  }


-------------------------------------------------
-- Custom function
-------------------------------------------------
  ---------------------
  -- Terminal --
  ---------------------
  _G.term_buf_of_tab = _G.term_buf_of_tab or {}
  _G.term_buf_max_nmb = _G.term_buf_max_nmb or 0

  function spawn_terminal()
    local cur_tab = vim.api.nvim_get_current_tabpage()
    vim.cmd('vs | terminal')
    local cur_buf = vim.api.nvim_get_current_buf()
    _G.term_buf_max_nmb = _G.term_buf_max_nmb + 1
    vim.api.nvim_buf_set_name(cur_buf, "Terminal " .. _G.term_buf_max_nmb)
    table.insert(_G.term_buf_of_tab, cur_tab, cur_buf)
    vim.cmd(':startinsert')
  end


  function toggle_terminal()
    local cur_tab = vim.api.nvim_get_current_tabpage()
    local term_buf = term_buf_of_tab[cur_tab]
    if term_buf ~= nil then
     local cur_buf = vim.api.nvim_get_current_buf()
     if cur_buf == term_buf then
       vim.cmd('q')
     else
       local win_list = vim.api.nvim_tabpage_list_wins(cur_tab)
       for _, win in ipairs(win_list) do
         local win_buf = vim.api.nvim_win_get_buf(win)
         if win_buf == term_buf then
           vim.api.nvim_set_current_win(win)
           vim.cmd(':startinsert')
           return
         end
       end
       vim.cmd('vert sb' .. term_buf)
       vim.cmd(':startinsert')
     end
    else
      spawn_terminal()
      vim.cmd(':startinsert')
    end
  end
  vim.keymap.set('n', '<c-y>', toggle_terminal)
  vim.keymap.set('i', '<c-y>', '<ESC>:lua toggle_terminal()<CR>')
  vim.keymap.set('t', '<c-y>', '<c-\\><c-n>:lua toggle_terminal()<CR>')
  -- vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')


