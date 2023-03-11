return {
  -- add bash to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "bash" })
    end,
  },

  -- add bash to null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, { nls.builtins.formatting.shfmt })
    end,
  },

  -- correctly setup lspconfig for clangd
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        bashls = {},
      },
    },
  },
}
