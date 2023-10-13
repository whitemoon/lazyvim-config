return {
  -- markdown preview
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = "cd app && npm install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --     require("which-key").register({
  --       ["<leader>o"] = { name = "+open" },
  --     })
  --   end,
  --   ft = { "markdown" },
  --   event = "VeryLazy",
  --   keys = {
  --     { "<leader>om", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },
  --   },
  -- },
  {
    "0x00-ketsu/markdown-preview.nvim",
    event = "VeryLazy",
    ft = { "md", "markdown", "mkd", "mkdn", "mdwn", "mdown", "mdtxt", "mdtext", "rmd", "wiki" },
    cmd = { "MPToggle" },
    opts = {},
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      require("which-key").register({
        ["<leader>o"] = { name = "+open" },
      })
    end,
    keys = {
      { "<leader>om", "<cmd>MPToggle<cr>", desc = "Toggle markdown preview on split buffer" },
    },
  },
}
