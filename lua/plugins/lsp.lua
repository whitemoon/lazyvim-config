return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.github = {
        download_url_template = "https://ghproxy.com/https://github.com/%s/releases/download/%s/%s",
      }
    end,
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     if type(opts.ensure_installed) == "table" then
  --       vim.list_extend(opts.ensure_installed, {
  --       })
  --     end
  --   end,
  -- },

  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        -- clang-format
        nls.builtins.formatting.clang_format,
      })
    end,
  },
}
