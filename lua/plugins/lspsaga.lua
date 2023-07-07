return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    cmd = { "Lspsaga" },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {},
    keys = {
      -- LSP finder - Find the symbol's definition
      -- If there is no definition, it will instead be hidden
      -- When you use an action in finder like "open vsplit",
      -- you can use <C-t> to jump back
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", mode = "n", desc = "Lsp Finder" },

      -- Code action
      { "ga", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" }, desc = "Code Action" },

      -- Rename all occurrences of the hovered word for the selected files
      { "gr", "<cmd>Lspsaga rename ++project<CR>", mode = "n", desc = "Lsp Rename" },

      -- Peek definition
      -- You can edit the file containing the definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      { "gd", "<cmd>Lspsaga peek_definition<CR>", mode = "n", desc = "Peek Definition" },
      { "gD", "<cmd>Lspsaga goto_definition<CR>", mode = "n", desc = "Goto Definition" },

      -- Peek type definition
      -- You can edit the file containing the type definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>", mode = "n", desc = "Peek Type Definition" },

      -- Show line diagnostics
      -- You can pass argument ++unfocus to
      -- unfocus the show_line_diagnostics floating window
      { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", mode = "n", desc = "Show Line Diagnostic" },

      -- Show buffer diagnostics
      { "gL", "<cmd>Lspsaga show_buf_diagnostics<CR>", mode = "n", desc = "Show Buf Diagnostics" },

      -- Diagnostic jump
      -- You can use <C-o> to jump back to your previous location
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", mode = "n", desc = "Jump Prev Diagnostic" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", mode = "n", desc = "Jump Next Diagnostic" },

      -- Diagnostic jump with filters such as only jumping to an error
      {
        "[E",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        mode = "n",
        desc = "Jump Prev ERROR Diagnostic",
      },
      {
        "]E",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        mode = "n",
        desc = "Jump Next ERROR Diagnostic",
      },

      -- Toggle outline
      { "go", "<cmd>Lspsaga outline<CR>", mode = "n", desc = "OutLine" },

      -- If you want to keep the hover window in the top right hand corner,
      -- you can pass the ++keep argument
      -- Note that if you use hover with ++keep, pressing this key again will
      -- close the hover window. If you want to jump to the hover window
      -- you should use the wincmd command "<C-w>w"
      { "K", "<cmd>Lspsaga hover_doc<CR>", mode = "n", desc = "Hover Doc" },

      -- Call hierarchy
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", mode = "n", desc = "Call Incoming" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", mode = "n", desc = "Call Outgoing" },

      -- Floating terminal
      { "<Leader>ot", "<cmd>Lspsaga term_toggle<CR>", mode = { "n", "t" }, desc = "Float Terminal" },
    },
  },
}
