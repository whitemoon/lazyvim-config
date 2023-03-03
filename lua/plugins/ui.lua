return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   opts = {
  --     transparent_background = true,
  --   },
  -- },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      vim.list_extend(opts.sections.lualine_x, { "encoding", "fileformat" })
      opts.sections.lualine_z = { "os.date()" }
    end,
  },
}