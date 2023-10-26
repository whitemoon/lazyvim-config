return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "ga", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
    end,
    opts = {
      diagnostics = { virtual_text = false },
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
