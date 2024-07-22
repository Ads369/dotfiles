local wk = require("which-key")

wk.add({
    {
        -- Save and Quit
        { "<leader>w",       ":w<cr>",                   desc = "Save" },
        { "<leader>q",       ":q<cr>",                   desc = "Quit" },

        -- windows
        { "<leader><down>",  ":resize -10<cr>",          desc = "Decrease Height" },
        { "<leader><left>",  ":vertical resize +20<cr>", desc = "Increase Width" },
        { "<leader><right>", ":vertical resize -20<cr>", desc = "Decrease Width" },
        { "<leader><up>",    ":resize +10<cr>",          desc = "Increase Height" },


        -- buffers
        { "<leader>n",       ":bn<cr>",                  desc = "Next Buffer" },
        { "<leader>p",       ":bp<cr>",                  desc = "Previous Buffer" },
        { "<leader>x",       ":bd<cr>",                  desc = "Delete Buffer" },
        -- { "<leader>ml",      ":b#<cr>",                                              desc = "Last Buffer" },

        -- unhilight
        { "<leader>h",       ":noh<cr>",                 desc = "Clear Highlight" },

        -- move a blocks of text up/down with K/J in visual mode
        {
            mode = { "v" },
            { "K", ":m '<-2<CR>gv=gv", desc = "move block down" },
            { "J", ":m '>+1<CR>gv=gv", desc = "move block up" },
        },

        -- Center the screen after scrolling up/down with Ctrl-u/d
        {
            mode = { "n" },
            { "<C-u>", "<C-u>zz", desc = "Scrolling up and Center" },
            { "<C-d>", "<C-d>zz", desc = "Scrolling down and Center" },
        },

        -- Center the screen on the next/prev search result with n/N
        {
            mode = { "n" },
            { "n", "nzzzv", desc = "next search with n" },
            { "N", "Nzzzv", desc = "prev search with N" },
        },

        -- Paste in visual mode without yanking replaced text
        { "p",          [["_dP]],                   desc = "Paste without yanking ", mode = { "x" } },

        -- delete without yanking
        { "<leader>d",  [["_d]],                    desc = "Paste without yanking ", mode = { "n", "v" } },

        -- yank to clipboard
        { "<leader>y",  '"+y',                      desc = "Yank to Clipboard" },
        { "<leader>Y",  '"+Y',                      desc = "Yank Line to Clipboard" },


        -- map Ctrl-c to Escape
        { "<C-c>",      "<Esc>",                    desc = "Escape",                 mode = { "i" } },

        -- disable the Q command
        -- vim.keymap.set("n", "Q", "<nop>")

        -- move to before/after underscores with - and l (repeatable with "n/N")
        { "<leader>-",  "/_/e-1<cr>",               desc = "Next Underscore" },
        { "<leader>l",  "?_?e+1<cr>",               desc = "Previous Underscore" },


        -- move to underscores with - and l (repeatable with ";")
        { "<leader>-",  "f_",                       desc = "Next Underscore" },
        { "<leader>l",  "F_",                       desc = "Previous Underscore" },

        -- search and replace the word under cursor in the file with <leader>s
        -- { "<leader>s",       ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace Word Under Cursor" },

        -- pyright ignore line
        { "<leader>ig", "A # pyright: ignore<Esc>", desc = "Pyright Ignore Line" },

        -- checkbox
        { "<leader>tu", ":s/\\[x\\]/[ ]/<cr>",      desc = "Untoggle Checkbox" },
        { "<leader>ty", ":s/\\[\\s\\]/[x]/<cr>",    desc = "Toggle Checkbox" },


    }
})
