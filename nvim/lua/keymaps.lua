-- space bar leader key
vim.g.mapleader = " "

-- save, quit
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "Quit" })

-- ignore capitalization mistakes
vim.cmd("ca W w")
vim.cmd("ca Q q")
vim.cmd("ca WQ wq")
vim.cmd("ca Wq wq")

-- windows
vim.keymap.set("n", "<leader><left>", ":vertical resize +20<cr>")
vim.keymap.set("n", "<leader><right>", ":vertical resize -20<cr>")
vim.keymap.set("n", "<leader><up>", ":resize +10<cr>")
vim.keymap.set("n", "<leader><down>", ":resize -10<cr>")

-- find and replace
-- vim.keymap.set("v", "<C-r>", "\"hy:%s/<C-r>h//g<left><left><left>")

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "buffer next" })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "buffer prev" })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "buffer del" })
vim.keymap.set("n", "<leader>ml", ":b#<cr>", { desc = "buffer last" })

-- unhilight
vim.keymap.set("n", "<leader>h", ":noh<cr>", { desc = "unhilight" })

-- move a blocks of text up/down with K/J in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "move a blocks of text up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "move a blocks of text down" })

-- Center the screen after scrolling up/down with Ctrl-u/d
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scrolling up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scrolling down" })

-- Center the screen on the next/prev search result with n/N
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste in visual mode without yanking replaced text
vim.keymap.set("x", "p", [["_dP]])

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to clipboard" })
-- yank line to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank line to clipboard" })

-- delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- map Ctrl-c to Escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- disable the Q command
-- vim.keymap.set("n", "Q", "<nop>")

-- move to before/after underscores with - and l (repeatable with "n/N")
-- vim.keymap.set({ "n", "v" }, "<leader>-", "/_/e-1<cr>", { silent = true })
-- vim.keymap.set({ "n", "v" }, "<leader>l", "?_?e+1<cr>", { silent = true })
--
-- move to underscores with - and l (repeatable with ";")
vim.keymap.set({ "n", "v" }, "<leader>-", "f_", { silent = true, desc = "move to next underscores" })
vim.keymap.set({ "n", "v" }, "<leader>l", "F_", { silent = true, desc = "move to prev underscores" })

-- -- search and replace the word under cursor in the file with <leader>s
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- pyright ignore line
vim.keymap.set("n", "<leader>ig", "A # pyright: ignore<Esc>", { desc = "pyright ignore line" })

-- checkbox
vim.keymap.set('n', '<leader>ty', [[:s/\[\s\]/[x]/<cr>]], { silent = true, desc = "mark checkbox" })
vim.keymap.set('n', '<leader>tu', [[:s/\[x\]/[ ]/<cr>]], { silent = true, desc = "unmark checkbox" })
