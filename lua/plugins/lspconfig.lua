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
        taplo = {
          filetypes = { "toml" },
        },
        bashls = {
          filetypes = { "sh" },
        },
        pyright = require("plugins.extras.lang.pyright"),
        ruff_lsp = {
          filetypes = { "python" },
        },
        -- pylsp = require("plugins.extras.lang.pylsp"),
      }
      opts.setup = {}
    end,
  },
}
