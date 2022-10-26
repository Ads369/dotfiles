local status, transparent = pcall(require, "transparent")
if (not status) then return end

require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

  },
  exclude = { 'SignColumn', 'CursorLineNr' }, -- table: groups you don't want to clear
})

-- The default groups:
-- Normal NormalNC Comment Constant Special Identifier Statement
-- PreProc Type Underlined Todo String Function Conditional Repeat
-- Operator Structure LineNr NonText SignColumn CursorLineNr
