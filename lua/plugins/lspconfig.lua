return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = false },
      autoformat = false,
      servers = {
        rust_analyzer = {
          mason = false,
          filetypes = { "rust" },
        },
        clangd = {
          mason = false,
          filetypes = { "c", "cpp" },
        },
        bashls = {
          filetypes = { "sh" },
        },
        pyright = {
          mason = false,
          filetypes = { "python" },
        },
        ruff_lsp = {
          mason = false,
          filetypes = { "python" },
        },
        -- pylsp = require("plugins.extras.lang.pylsp"),
      },
    },
  },
}
