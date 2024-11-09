-- lua/plugins/typescript.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Initialize servers table if it doesn't exist
      opts.servers = opts.servers or {}

      -- Disable tsserver
      opts.servers.tsserver = { enabled = false }

      -- Configure vtsls
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
}
