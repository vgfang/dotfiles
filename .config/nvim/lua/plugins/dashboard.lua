return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    local logo = [[
                     7333333333
                   333333333333
           31      333333333333333
           331    7333333333333333337
             33   33333333333333333333
              7333333333333333333333337
     77    777 713333333333333333331
      333   3  1333333333333333337
      37337 3  133 7333333333333337
      3  3333  133  333333333333333
      3   733  133   733333333333333
    73337   3 133333337  333333333337
                 7333333 133333333333
                  33  33  33333333333
                  33333    33 3333333
                  33 333    333733333
                 3331 3331   37  7333
                                   73
     ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"
    opts.dashboard.preset.header = vim.split(logo, "\n")
  end,
}
