local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      -- checkOnSave = {
      --   command = "clippy",
      -- }
    },
  },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "c++" },
}

lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "java" },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "go" },
}

lspconfig.kotlin_language_server.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  filetype = { "kotlin" },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
}
