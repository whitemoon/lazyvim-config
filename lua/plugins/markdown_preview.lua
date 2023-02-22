return {
  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      require("which-key").register({
        ["<leader>o"] = { name = "+open" },
      })
    end,
    ft = { "markdown" },

    keys = {
      { "<leader>om", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },
    },
  },
}
