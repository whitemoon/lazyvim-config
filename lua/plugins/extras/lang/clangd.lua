return {
  -- add C/C++ to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "c", "cpp" })
    end,
  },

  -- add clang_format to null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, { nls.builtins.formatting.clang_format })
    end,
  },

  -- correctly setup lspconfig for clangd
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        clangd = {
          mason = false,
          filetypes = { "c", "cpp" },
        },
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "neovim/nvim-lspconfig" },
    },
    opts = function(_, opts)
      opts.server = { capabilities = { offsetEncoding = { "utf-16" } } }
      opts.extensions = {
        ast = {
          --These require codicons (https://github.com/microsoft/vscode-codicons)
          role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
          },
          kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
          },
        },
      }
    end,
  },
}
