return {
  {
    "altermo/ultimate-autopair.nvim",
    branch = "development",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      space2 = { enable = true },
      bs = { space = "balance", indent_ignore = true, single_delete = true },
      cr = { autoclose = true },
      tabout = { enable = true, hopout = true },
    },
  },
}
