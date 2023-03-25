return {
  -- add python to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
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
          mason = false,
          filetypes = { "python" },
          settings = {
            --   pyright = {
            --     disableLanguageServices = false,
            --     disableOrganizeImports = false,
            --   },
            python = {
              analysis = {
                typeCheckingMode = "off", -- off, basic, strict
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                diagnosticSeverityOverrides = {
                  strictListInference = true,
                  strictDictionaryInference = true,
                  strictSetInference = true,
                  reportUnusedImport = "warning",
                  reportUnusedClass = "warning",
                  reportUnusedFunction = "warning",
                  reportUnusedVariable = "warning",
                  reportUnusedCoroutine = "warning",
                  reportDuplicateImport = "warning",
                  reportPrivateUsage = "warning",
                  reportUnusedExpression = "warning",
                  reportConstantRedefinition = "error",
                  reportIncompatibleMethodOverride = "error",
                  reportMissingImports = "error",
                  reportUndefinedVariable = "error",
                  reportAssertAlwaysTrue = "error",
                },
              },
            },
          },
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
        ruff_lsp = {
          filetypes = { "python" },
        },
      },
    },
  },
}
