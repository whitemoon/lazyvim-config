return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sg",
        function()
          require("telescope.builtin").grep_string()
        end,
        mode = "v",
        desc = "Grep (visual range)",
      },
    },
  },
}
