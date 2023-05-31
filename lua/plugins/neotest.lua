return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = { justMyCode = false },
        },
        ["neotest-rust"] = {
          args = { "--no-capture" },
          dap_adapter = "lldb",
        },
      },
    },
  },
}