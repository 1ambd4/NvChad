local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
        "jdtls",
        "gopls",
        "kotlin-language-server",
        "typescript-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      vim.lsp.set_log_level "error"
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    cmd = { "Lspsaga" },
    config = function()
      require("lspsaga").setup {}
    end,
  },
  {
    -- https://zenn.dev/hirokisan/articles/8f2c9ca238d8b1
    "github/copilot.vim",
    -- lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "tpope/vim-fugitive",
    event = "User InGitRepo",
    cmd = { "Git" },
    config = function() end,
  },
  {
    "f-person/git-blame.nvim",
    cmd = { "GitBlameToggle", "GitBlameCopySHA" },
    config = function()
      require("gitblame").setup {
        --Note how the `gitblame_` prefix is omitted in `setup`
        enabled = false,
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "mrded/nvim-lsp-notify",
    lazy = false,
    dependencies = "rcarriga/nvim-notify",
    config = function()
      require("lsp-notify").setup {
        notify = require "notify",
      }
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
    config = function()
      require "custom.configs.transparent"
    end,
  },
  {
    "chentoast/marks.nvim",
    lazy = false,
    cmd = { "MarksListBuf" },
    config = function()
      require "custom.configs.marks"
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    init = function()
      require("symbols-outline").setup()
      require("core.utils").load_mappings "symbols"
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapToggleBreakpoint", "Debuggables", "DapStepInto", "DapStepOut", "DapStepOver" },
    -- config = function ()
    --     require("dap")
    --     require("core.utils").load_mappings("dap")
    -- end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dapui").setup()
    end,
  },
}

return plugins
