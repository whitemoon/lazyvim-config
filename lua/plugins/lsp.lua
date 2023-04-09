return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd",

        -- debug
        "codelldb",
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
        "json",
        "lua",
        "luap",
        "luadoc",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
        "yaml",

        -- rust
        "rust",
        "toml",
        -- bash
        "bash",
        -- c/cpp
        "c",
        "cpp",
        -- python
        "python",
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
          -- bash
          nls.builtins.formatting.shfmt,
          -- clang-format
          nls.builtins.formatting.clang_format,
          -- python
          nls.builtins.formatting.black,
        },
      }
    end,
  },
}
