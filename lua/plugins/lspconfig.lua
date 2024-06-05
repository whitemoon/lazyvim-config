return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "ga", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
    end,
    opts = {
      diagnostics = { virtual_text = false },
      servers = {
        bashls = {
          filetypes = { "sh" },
        },
        basedpyright = {
          settings = {
            basedpyright = { typeCheckingMode = "basic" },
          },
        },
        clangd = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "xmake.lua",
              ".vscode",
              ".clangd",
              "CMakeLists.txt",
              ".git"
              -- "Makefile",
              -- "configure.ac",
              -- "configure.in",
              -- "config.h.in",
              -- "meson.build",
              -- "meson_options.txt",
              -- "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--compile-commands-dir=.vscode",
          },
        },
      },
    },
  },
}
