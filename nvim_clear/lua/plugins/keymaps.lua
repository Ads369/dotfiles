local wk = require("which-key")
wk.add({

    -- telescope
    { "<leader>f",  group = "find" },
    { "<leader>fb", ":Telescope buffers<cr>",                                          desc = "Buffers" },
    { "<leader>fh", ":Telescope help_tags<cr>",                                        desc = "Help Tags" },
    { "<leader>fo", ":Telescope oldfiles<cr>",                                         desc = "Old Files" },
    { "<leader>fp", ":Telescope git_files<cr>",                                        desc = "Find Git Files" },
    { "<leader>fs", ":Telescope find_files<cr>",                                       desc = "Find Files" },
    { "<leader>fz", ":Telescope live_grep<cr>",                                        desc = "Live Grep" },
    { "<leader>fk", ":Telescope keymaps<cr>",                                          desc = "Keymaps" },

    -- tree
    { "<leader>e",  ":NvimTreeFindFileToggle<cr>",                                     desc = "Toggle Nvim Tree" },

    -- icon picker
    { "<leader>ic", ":IconPickerNormal<cr>",                                           desc = "Icon Picker" },

    -- twilight
    { "<leader>il", ":Twilight<cr>",                                                   desc = "Twilight" },

    -- zen mode
    { "<leader>zm", ":ZenMode<cr>",                                                    desc = "Zen Mode" },

    -- format code using LSP
    { "<leader>gf", "vim.lsp.buf.format",                                              desc = "Format LSP" },

    -- markdown preview
    { "<leader>mp", ":MarkdownPreviewToggle<cr>",                                      desc = "Markdown Preview" },

    -- nvim-comment
    { "<leader>/",  ":CommentToggle<cr>",                                              desc = "Toggle Comment" },

    ------------------
    -- goto-preview --
    ------------------
    --
    -- note: lsp config (from lsp.lua)
    -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    -- nmap('gt', vim.lsp.buf.type_definition, 'Type [D]efinition')
    -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    { "<leader>g",  group = "goto-preview" },
    { "<leader>gd", ":lua require('goto-preview').goto_preview_definition()<CR>",      desc = "Goto Definition" },
    { "<leader>gi", ":lua require('goto-preview').goto_preview_implementation()<CR>",  desc = "Goto Implementation" },
    { "<leader>gp", ":lua require('goto-preview').close_all_win()<CR>",                desc = "Close All Windows" },
    { "<leader>gt", ":lua require('goto-preview').goto_preview_type_definition()<CR>", desc = "Type Definition" },


    -- codeium
    { "<leader>cc", ":Codeium Chat<cr>",                                               desc = "Codeium Chat" },
    { "<leader>ch", ":codeium#CycleOrComplete(1)<CR>",                                 desc = "Codeium Help" },


})
