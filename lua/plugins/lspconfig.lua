return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics.virtual_text = false
      opts.autoformat = false
      opts.servers = {
        lua_ls = {
          mason = false,
          filetypes = { "lua" },
        },
        rust_analyzer = {
          mason = false,
          filetypes = { "rust" },
        },
        taplo = {
          filetypes = { "toml" },
        },
        bashls = {
          filetypes = { "bash" },
        },
        clangd = {
          mason = false,
          filetypes = { "c", "cpp" },
        },
        pyright = require("plugins.extras.lang.pyright"),
        ruff_lsp = {
          filetypes = { "python" },
        },
      }
      opts.setup = {}
    end,
  },
}
