return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = function(_, opts)
      opts.window.mappings["h"] = "close_node"
      opts.window.mappings["l"] = "open"
    end,
  },
}
