local options = {
  require("conform").setup {
    formatters_by_ft = {
      rust = { "rustfmt" },
      go = { "gofmt" },
      lua = { "stylua" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      css = { "prettierd" },
      html = { "prettierd" },
      json = { "jq" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      graphql = { "prettierd" },
    },

    format_on_save = {
      -- pattern = '.lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs',
      pattern = "*.lua,*.rs,*.go,*.ts,*.js,*.tsx,*.jsx",
      timeout_ms = 500,
      async = false,
      lsp_fallback = true,
    },
  },
}

return options
