return {
  mason = false,
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true,
          extendSelect = { "I" },
        },
      },
    },
  },
}
