return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.github = {
        download_url_template = "https://mirror.ghproxy.com/https://github.com/%s/releases/download/%s/%s",
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
  },
}
