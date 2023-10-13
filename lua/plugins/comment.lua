return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    event = "VeryLazy",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    opts = function()
      local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    end,
  },
}
