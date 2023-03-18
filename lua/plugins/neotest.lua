return {
  "nvim-neotest/neotest",
  ft = { "rust", "python" },
  dependencies = {
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
  },
  opts = function(_, opts)
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    opts.adapters = {
      require("neotest-rust"),
      require("neotest-python")({
        dap = { justMyCode = false, console = "integratedTerminal" },
      }),
    }
  end,
  init = function()
    require("which-key").register({
      ["<leader>t"] = { name = "+test" },
    })
  end,
  keys = {
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "neotest: toggle summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "neotest: output",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "neotest: run",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "neotest: run file",
    },
    {
      "<leader>tc",
      function()
        require("neotest").run.stop({ interactive = true })
      end,
      desc = "neotest: cancel",
    },
  },
}
