local status, icons = pcall(require, "nvim-web-devicons")
if (not status) then return end

icons.setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {
      -- lir_folder_icon = {
      --   icon = "",
      --   color = "#7ebae4",
      --   name = "LirFolderNode"
      -- },
  },
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true
}
