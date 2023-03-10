return {
  -- add python to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },

  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "black" })
    end,
  },

  -- add python to null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, { nls.builtins.formatting.black })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        pyright = {
          -- settings = {
          --   pyright = {
          --     disableLanguageServices = false,
          --     disableOrganizeImports = false,
          --   },
          --   python = {
          --     analysis = {
          --       autoSearchPaths = true,
          --       diagnosticMode = "workspace",
          --       useLibraryCodeForTypes = true,
          --     },
          --   },
          -- },
          single_file_support = true,
          root_dir = function(fname)
            local util = require("lspconfig.util")
            local root_files = {
              "pyproject.toml",
              "setup.py",
              "setup.cfg",
              "requirements.txt",
              "Pipfile",
              "manage.py",
              "pyrightconfig.json",
            }
            return util.root_pattern(unpack(root_files))(fname)
              or util.root_pattern(".git")(fname)
              or util.path.dirname(fname)
          end,
        },
        ruff_lsp = {},
      },
    },
  },
}
