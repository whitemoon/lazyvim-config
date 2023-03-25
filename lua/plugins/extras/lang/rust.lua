return {
  -- extend auto completion
  {
    "Saecki/crates.nvim",
    dependencies = {
      {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          local cmp = require("cmp")
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
            { name = "crates" },
          }))
        end,
      },
    },
    event = { "BufRead Cargo.toml" },
    config = true,
  },

  -- add rust to null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, { nls.builtins.formatting.rustfmt })
    end,
  },

  -- add rust to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "rust", "toml" })
    end,
  },

  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "codelldb" })
    end,
  },

  -- correctly setup lspconfig for Rust 🚀
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        rust_analyzer = {
          mason = false,
          filetypes = { "rust" },
        },
        taplo = {},
      },
      setup = {
        taplo = function(_, _)
          local function show_documentation()
            if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
              require("crates").show_popup()
            else
              vim.lsp.buf.hover()
            end
          end
          require("lazyvim.util").on_attach(function(client, buffer)
            -- stylua: ignore
            -- if client.name == "taplo" then
              vim.keymap.set("n", "K", show_documentation, { buffer = buffer, desc = "Show Crate Documentation" })
            -- end
          end)
          return false -- make sure the base implementation calls taplo.setup
        end,
      },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
    opts = function(_, opts)
      local mason_registry = require("mason-registry")
      -- rust tools configuration for debugging support
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
        or extension_path .. "lldb/lib/liblldb.so"
      opts.dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      }
      opts.server = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      }
    end,
  },
}
