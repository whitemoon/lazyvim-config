return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = function(_, opts)
      opts.window = {
        width = 25,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          h = "close_node",
          l = "open",
        },
      }
    end,
  },
}
