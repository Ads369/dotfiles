local status, wk = pcall(require, "which-key")
if (not status) then return end

wk.register()

-- method 1
-- wk.register({
--   f = {
--     name = "file", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123 }, -- additional options for creating the keymap
--     n = { "New File" }, -- just a label. don't create any mapping
--     e = "Edit File", -- same as above
--     ["1"] = "which_key_ignore", -- special label to hide it in the popup
--     b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--   },
-- }, { prefix = "<leader>" })

-- -- method 2
-- wk.register({
--   ["<leader>"] = {
--     f = {
--       name = "+file",
--       f = { "<cmd>Telescope find_files<cr>", "Find File" },
--       r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--       n = { "<cmd>enew<cr>", "New File" },
--     },
--   },
-- })

-- -- method 3
-- wk.register({
--   ["<leader>f"] = {
--     name = "+file",
--     f = { "<cmd>Telescope find_files<cr>", "Find File" },
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--     n = { "<cmd>enew<cr>", "New File" },
--   },
-- })

-- -- method 4
-- wk.register({
--   ["<leader>f"] = { name = "+file" },
--   ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
--   ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--   ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
-- })
