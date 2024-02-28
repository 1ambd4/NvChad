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
      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = { "codespell" },
      -- Use the "_" filetype to run formatters on filetypes
      -- that don't have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },

    -- format_on_save = {
    --   -- pattern = '.lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs',
    --   pattern = "*.lua,*.rs,*.go,*.ts,*.js,*.tsx,*.jsx",
    --   timeout_ms = 500,
    --   async = false,
    --   lsp_fallback = true,
    -- },

    format_on_save = function(bufnr)
      local ignore_filetypes = { "cpp", "java" }
      if not vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return {
          timeout_ms = 500,
          async = false,
          lsp_fallback = true,
        }
      end
    end,
  },
}

return options
