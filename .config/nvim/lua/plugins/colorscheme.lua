-- return {
-- "folke/tokyonight.nvim",
-- opts = {
-- transparent = true,
-- styles = {
--   sidebars = "transparent",
--   floats = "transparent",
-- },
-- },
-- }

return {
  { "folke/tokyonight.nvim", priority = 1000 },
  { "rebelot/kanagawa.nvim", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
      -- colorscheme = "tokyonight",
    },
  },
}
