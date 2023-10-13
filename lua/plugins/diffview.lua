return {
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewRefresh", "DiffviewFileHistory" },
    opts = {},
    init = function()
      require("which-key").register({
        ["<leader>gd"] = { name = "+diffview" },
      })
    end,
    keys = {
      {
        mode = { "n" },
        "<Leader>gdo",
        "<cmd>DiffviewOpen<cr>",
        desc = "Diffview Open",
      },
      {
        mode = { "n" },
        "<Leader>gdc",
        "<cmd>tabclose<cr>",
        desc = "Diffview Close",
      },
    },
  },
}
