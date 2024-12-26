return {
  "hedyhli/outline.nvim",
  keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
  cmd = "Outline",
  opts = function()
    local opts = {
      keymaps = {
        up_and_jump = "<up>",
        down_and_jump = "<down>",
      },
      outline_window = {
        position = "left",
        width = 18,
      },
    }
    return opts
  end,
}
