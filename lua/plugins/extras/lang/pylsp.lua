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
        rope_autoimport = {
          enabled = true,
        },
        rope = {
          enabled = true,
        },
      },
    },
  },
}
