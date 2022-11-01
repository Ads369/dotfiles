local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- ColorScheme
  use 'ellisonleao/gruvbox.nvim' -- New version grovbox
  use 'xiyaowong/nvim-transparent' -- transparen for Neovim use only ColorSheme don't have it

  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'akinsho/nvim-bufferline.lua' -- Tabsline

  -- Icons --
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Utils --
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim

  -- LSP
  use 'neovim/nvim-lspconfig' -- LSP-- Autocomplete vscode-like
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use "ray-x/lsp_signature.nvim" -- Signature helper vscode-like
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- use 'jayp0521/mason-null-ls.nvim'

  use 'L3MON4D3/LuaSnip' -- Snippet
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Autocomplete
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-path' -- file path completions
  use 'hrsh7th/cmp-cmdline' -- Autocomplete cmdline
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  --DAP (Debug Adapter Protocol)
  -- use 'mfussenegger/nvim-dap'
  -- use 'rcarriga/nvim-dap-ui'
  -- use 'mfussenegger/nvim-dap-python'
  -- use 'theHamsta/nvim-dap-virtual-text'ads plug
  -- use 'nvim-telescope/telescope-dap.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag' -- auto tags for TS
  use 'norcalli/nvim-colorizer.lua' -- Color in HTML

  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- File browser
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-tree/nvim-tree.lua' -- file explorer

  use 'lewis6991/gitsigns.nvim'
  -- use 'mhartington/formatter.nvim' -- formatter
  -- use { 'psf/black', branch = 'stable' }

  -- use {
  --   'kkoomen/vim-doge',
  --   run = ':call doge#install()'
  -- }

  use 'folke/which-key.nvim' -- Popup for hotkeys

end)
