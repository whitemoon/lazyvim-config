return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sg",
        function()
          require("utils").grep_string_visual()
        end,
        mode = "v",
        desc = "Grep (visual range)",
      },
    },
  },
}