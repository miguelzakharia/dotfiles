return {
  -- ESLint LSP setup
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        on_attach = function(client, bufnr)
          -- Disable ESLint diagnostics
          client.server_capabilities.diagnosticsProvider = false
          -- Enable formatting if you want to keep that
          client.server_capabilities.documentFormattingProvider = true
        end,
      },
    },
  },
}
