return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = function(_, opts)
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({ tex = false }))
      end
    end,
  },
}
