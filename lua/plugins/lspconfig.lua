return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
      inlay_hints = {
        enabled = vim.fn.has("nvim-0.10"),
      },
      servers = {
        bashls = {
          filetypes = { "sh" },
        },
      },
    },
  },
}
