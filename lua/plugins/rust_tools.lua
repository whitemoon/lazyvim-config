return {
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    opts = function(_, opts)
      local mason_registry = require("mason-registry")
      -- rust tools configuration for debugging support
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
        or extension_path .. "lldb/lib/liblldb.so"
      opts.dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      }
      opts.server = {
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      }
    end,
  },
}
