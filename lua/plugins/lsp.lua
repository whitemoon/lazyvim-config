return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.github = {
        download_url_template = "https://ghproxy.com/https://github.com/%s/releases/download/%s/%s",
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "json",
          "lua",
          "luap",
          "luadoc",
          "markdown",
          "markdown_inline",
          "regex",
          "vim",
          "yaml",

          -- bash
          "bash",
        })
      end
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        -- bash
        nls.builtins.formatting.shfmt,
        -- clang-format
        nls.builtins.formatting.clang_format,
        -- python
        nls.builtins.formatting.black,
      })
    end,
  },
}
