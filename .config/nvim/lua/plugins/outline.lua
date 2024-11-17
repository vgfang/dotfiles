return {
  "hedyhli/outline.nvim",
  keys = { { "<leader>ch", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
  cmd = "Outline",
  opts = function()
    local defaults = require("outline.config").defaults
    local opts = {
      symbols = {
        icons = {},
        filter = vim.deepcopy(LazyVim.config.kind_filter),
      },
      keymaps = {
        up_and_jump = "<up>",
        down_and_jump = "<down>",
      },
      outline_window = {
        position = "left",
        width = 18,
      },
    }

    for kind, symbol in pairs(defaults.symbols.icons) do
      opts.symbols.icons[kind] = {
        icon = LazyVim.config.icons.kinds[kind] or symbol.icon,
        hl = symbol.hl,
      }
    end
    return opts
  end,
}
