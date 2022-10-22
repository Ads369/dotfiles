vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.g.mapleader = " "
vim.opt.mouse = "a"

vim.opt.laststatus = 3 -- Common status line for all layers
vim.o.scrolloff = 7 -- Number of screen lines to keep above and below the cursor
vim.o.colorcolumn = '79' -- Draw vertical line

-- Decrease update time
vim.o.timeoutlen = 500
vim.o.updatetime = 520

-- Better editor UI
vim.o.number = true
vim.o.numberwidth = 2
-- vim.o.relativenumber = true
vim.opt.signcolumn = 'yes'

-- Better editing experience
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.smarttab = true
vim.o.softtabstop = -1 -- If negative, shiftwidth value is used
vim.opt.scrolloff = 10

-- Wrap line
vim.opt.wrap = true
vim.opt.breakindent = true
vim.o.showbreak = '↪'

-- Ident
vim.o.autoindent = true
vim.opt.smartindent = true
-- vim.o.cindent = true - alternative for smartident

-- Show space chars
vim.o.list = true
vim.o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- vim.o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- vim.o.formatoptions = 'qrn1'

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Path config
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undo and backup options
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.swapfile = false

-- Remember 50 items in commandline history
-- vim.o.history = 50

-- Better buffer splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- Set completeopt to have a better completion experience
-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- NETRW
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3
