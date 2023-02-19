return {
  -- markdown preview
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>op",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "dark" }, -- 'dark' or 'light'
    init = function()
      require("which-key").register({
        ["<leader>o"] = { name = "+open" },
      })
    end,
  },
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   build = 'cd app && npm install',
  --   init = function()
  --     vim.g.mkdp_filetypes = { 'markdown' }
  --     require("which-key").register({
  --      ["<leader>o"] = { name = "+open" },
  --     })
  --   end,
  --   ft = { 'markdown' },
  --
  --   keys = {
  --     { '<leader>om', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Toggle markdown preview' },
  --   },
  -- },
}
