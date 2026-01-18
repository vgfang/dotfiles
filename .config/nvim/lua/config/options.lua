-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"
vim.opt.ttimeoutlen = 00

-- disable all snacks animations
vim.g.snacks_animate = false

-- enable clipboard integration
vim.opt.clipboard = "unnamedplus"

-- enable word wrap
vim.opt.wrap = true
vim.opt.linebreak = true
