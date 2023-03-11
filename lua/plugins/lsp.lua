return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd",
      },
      github = {
        download_url_template = "https://ghproxy.com/https://github.com/%s/releases/download/%s/%s",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "help",
        "json",
        "lua",
        "luap",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
        "yaml",
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
        },
      }
    end,
  },

  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.clangd" },
  { import = "plugins.extras.lang.python" },
  { import = "plugins.extras.lang.bash" },
}
