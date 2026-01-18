local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },

    -- colorscheme configuration
    { "folke/tokyonight.nvim", priority = 1000 },
    { "rebelot/kanagawa.nvim", priority = 1000 },
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "kanagawa-dragon",
        -- disable animations by default
        news = {
          lazyvim = false,
          neovim = false,
        },
      },
    },

    -- dashboard configuration
    {
      "folke/snacks.nvim",
      opts = function(_, opts)
        -- disable all animations by default (for <leader>ua toggle)
        opts.animate = opts.animate or {}
        opts.animate.enabled = false

        opts.scroll = opts.scroll or {}
        opts.scroll.enabled = false

        opts.indent = opts.indent or {}
        opts.indent.animate = opts.indent.animate or {}
        opts.indent.animate.enabled = false

        opts.dashboard = opts.dashboard or {}
        opts.dashboard.preset = opts.dashboard.preset or {}
        opts.dashboard.preset.header = [[
███╗   ██╗██╗   ██╗██╗███╗   ███╗
████╗  ██║██║   ██║██║████╗ ████║
██╔██╗ ██║██║   ██║██║██╔████╔██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
]]
        return opts
      end,
    },

    -- neo-tree configuration
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        window = {
          position = "right",
          width = 32,
        },
      },
    },

    -- disable blink.cmp since we're using nvim-cmp
    { "saghen/blink.cmp", enabled = false },

    -- nvim-cmp configuration with supertab
    {
      "L3MON4D3/LuaSnip",
      keys = function()
        return {}
      end,
    },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- ensure tables exist
      opts.mapping = opts.mapping or {}
      opts.sources = opts.sources or {}

      vim.list_extend(opts.sources, {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "emoji" },
        { name = "buffer" },
        { name = "path" },
      })

      -- your supertab mappings (unchanged)
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif vim.fn.col(".") > 1 then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      return opts
    end,
    },
    -- outline configuration
    {
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
    },

    -- telescope configuration
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup({
          defaults = {
            file_ignore_patterns = { "node_modules" },
          },
        })
      end,
    },

    -- typescript/javascript configuration
    {
      "neovim/nvim-lspconfig",
      opts = function(_, opts)
        -- initialize servers table if it doesn't exist
        opts.servers = opts.servers or {}

        -- disable tsserver
        opts.servers.tsserver = { enabled = false }

        -- configure vtsls
        opts.servers.vtsls =
          vim.tbl_deep_extend("force", opts.servers.vtsls or {}, {
            enabled = true,
            settings = {
              typescript = {
                preferences = {
                  importModuleSpecifier = "non-relative",
                },
                inlayHints = {
                  enumMemberValues = { enabled = true },
                  functionLikeReturnTypes = { enabled = true },
                  parameterNames = { enabled = "literals" },
                  parameterTypes = { enabled = true },
                  propertyDeclarationTypes = { enabled = true },
                  variableTypes = { enabled = false },
                },
              },
              javascript = {
                preferences = {
                  importModuleSpecifier = "non-relative",
                },
                inlayHints = {
                  enumMemberValues = { enabled = true },
                  functionLikeReturnTypes = { enabled = true },
                  parameterNames = { enabled = "literals" },
                  parameterTypes = { enabled = true },
                  propertyDeclarationTypes = { enabled = true },
                  variableTypes = { enabled = false },
                },
              },
              vtsls = {
                autoUseWorkspaceTsdk = true,
                enableMoveToFileCodeAction = true,
                experimental = {
                  completion = {
                    enableServerSideFuzzyMatch = true,
                  },
                },
              },
            },
          })
        return opts
      end,
    },

    -- prettier configuration for auto-formatting
    {
      "stevearc/conform.nvim",
      opts = function(_, opts)
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft.javascript = { "prettier" }
        opts.formatters_by_ft.typescript = { "prettier" }
        opts.formatters_by_ft.javascriptreact = { "prettier" }
        opts.formatters_by_ft.typescriptreact = { "prettier" }
        opts.formatters_by_ft.json = { "prettier" }
        opts.formatters_by_ft.html = { "prettier" }
        opts.formatters_by_ft.css = { "prettier" }
        opts.formatters_by_ft.scss = { "prettier" }
        opts.formatters_by_ft.markdown = { "prettier" }
        opts.formatters_by_ft.yaml = { "prettier" }

        return opts
      end,
    },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  ui = {
    -- disable animations
    backdrop = 100,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
