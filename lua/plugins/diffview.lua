return {
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewRefresh", "DiffviewFileHistory" },
    opts = {},
    keys = {
      { "<leader>gd", "", desc = "+diffview" },
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
