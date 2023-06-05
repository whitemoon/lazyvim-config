return {
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "neovim/nvim-lspconfig" },
    },
    opts = function(_, opts)
      opts.server = { capabilities = { offsetEncoding = { "utf-16" } } }
      opts.extensions = {
        autoSetHints = false,
        ast = {
          --These require codicons (https://github.com/microsoft/vscode-codicons)
          role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
          },
          kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
          },
        },
      }
    end,
  },
}
