return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sg",
        function()
          require("telescope.builtin").live_grep({
            default_text = require("utils").visual_selection(),
          })
        end,
        mode = "v",
        desc = "Grep (visual range)",
      },
    },
  },
}