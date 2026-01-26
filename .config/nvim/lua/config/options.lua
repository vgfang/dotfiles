-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"
vim.opt.ttimeoutlen = 00

-- disable all snacks animations by default (for <leader>ua toggle)
vim.g.snacks_animate = false
vim.g.lazyvim_animate = false

-- enable clipboard integration
vim.opt.clipboard = "unnamedplus"

-- enable word wrap by default (for <leader>uw toggle)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.g.lazyvim_wrap = true

-- enable auto-reload of files when changed externally
vim.opt.autoread = true
