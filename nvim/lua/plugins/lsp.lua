-- Import lspconfig and utils
local util = require("lspconfig/util")

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      denols = {
        root_dir = util.root_pattern("deno.json", "deno.jsonc"),
      },
      tsserver = {
        root_dir = util.root_pattern("package.json"),
      },
    },
  },
}
-- local nvim_lsp = require("lspconfig")
-- nvim_lsp.denols.setup({
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- })
--
-- nvim_lsp.tsserver.setup({
--   on_attach = on_attach,
--   root_dir = nvim_lsp.util.root_pattern("package.json"),
--   single_file_support = false,
-- })

-- return {
--   -- Deno LSP setup
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         denols = {
--           root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
--           init_options = {
--             lint = true,
--           },
--         },
--         -- TSServer setup for TypeScript/JavaScript projects
--         tsserver = {
--           root_dir = require("lspconfig").util.root_pattern("package.json"),
--           single_file_support = false,
--           on_new_config = function(new_config, new_root_dir)
--             if new_root_dir:find("deno") then
--               new_config.enabled = false
--             end
--           end,
--         },
--       },
--       setup = {
--         tsserver = function(_, opts)
--           -- Disable `tsserver` in Deno projects (those using deno.json or deno.jsonc)
--           opts.root_dir = function(fname)
--             return require("lspconfig").util.root_pattern("package.json")(fname)
--               or require("lspconfig").util.find_git_ancestor(fname)
--           end
--         end,
--       },
--     },
--   },
-- }

--
-- lspconfig.denols.setup({
--   root_dir = util.root_pattern("deno.json", "deno.jsonc"),
-- })
--
-- lspconfig.tsserver.setup({
--   root_dir = util.root_pattern("package.json"),
-- })

-- -- Function to detect if it's a Deno project
-- local function is_deno_project(root_dir)
--   return util.root_pattern("deno.json", "deno.jsonc")(root_dir) ~= nil
-- end
--
-- return {
--   -- ESLint LSP setup
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       denols = {
--         on_attach = on_attach,
--         root_dir = util.root_pattern("deno.json", "deno.jsonc"),
--         -- root_dir = function(fname)
--         --   -- Only load denols if it's a Deno project
--         --   return util.root_pattern("deno.json", "deno.jsonc")(fname)
--         -- end,
--         -- init_options = {
--         --   lint = true,
--         -- },
--         -- on_attach = function(client, bufnr)
--         --   -- Disable denols in non-Deno projects
--         --   if not is_deno_project(client.config.root_dir) then
--         --     client.stop()
--         --   end
--         -- end,
--       },
--       tsserver = {
--         on_attach = on_attach,
--         root_dir = util.root_pattern("package.json"),
--         single_file_support = false, -- root_dir = function(fname)
--         --   -- Only load tsserver if not a Deno project
--         --   if not is_deno_project(fname) then
--         --     return util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
--         --   end
--         -- end,
--         -- on_attach = function(client, bufnr)
--         --   -- Disable tsserver in Deno projects
--         --   if is_deno_project(client.config.root_dir) then
--         --     client.stop()
--         --   end
--         -- end,
--       },
--       eslint = {
--         -- root_dir = function(fname)
--         --   -- Only load eslint if not a Deno project
--         --   if not is_deno_project(fname) then
--         --     return util.root_pattern(".eslintrc", ".eslintrc.json", ".eslintrc.js", ".git")(fname)
--         --   end
--         -- end,
--         -- on_attach = function(client, bufnr)
--         --   -- Disable ESLint diagnostics
--         --   client.server_capabilities.diagnosticsProvider = false
--         --   -- Enable formatting if you want to keep that
--         --   client.server_capabilities.documentFormattingProvider = true
--         --   -- Disable eslint in Deno projects
--         --   if is_deno_project(client.config.root_dir) then
--         --     client.stop()
--         --   end
--         -- end,
--       },
--     },
--   },
-- }
