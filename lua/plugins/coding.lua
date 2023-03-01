return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
            -- elseif luasnip.expand_or_jumpable() then
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- disable diagnostics virtual_text
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics.virtual_text = false
      opts.autoformat = false
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    init = function()
      require("lspsaga").setup({})
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- LSP finder - Find the symbol's definition
      -- If there is no definition, it will instead be hidden
      -- When you use an action in finder like "open vsplit",
      -- you can use <C-t> to jump back
      keys[#keys + 1] = { "gh", "<cmd>Lspsaga lsp_finder<CR>", mode = "n", desc = "Lsp Finder" }

      -- Code action
      keys[#keys + 1] = { "ga", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" }, desc = "Code Action" }

      -- Rename all occurrences of the hovered word for the selected files
      keys[#keys + 1] = { "gr", "<cmd>Lspsaga rename ++project<CR>", mode = "n", desc = "Lsp Rename" }

      -- Peek definition
      -- You can edit the file containing the definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga peek_definition<CR>", mode = "n", desc = "Peek Definition" }
      keys[#keys + 1] = { "gD", "<cmd>Lspsaga goto_definition<CR>", mode = "n", desc = "Goto Definition" }

      -- Peek type definition
      -- You can edit the file containing the type definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      keys[#keys + 1] = { "gt", "<cmd>Lspsaga peek_type_definition<CR>", mode = "n", desc = "Peek Type Definition" }
      keys[#keys + 1] = { "gT", "<cmd>Lspsaga goto_type_definition<CR>", mode = "n", desc = "Goto Type Definition" }

      -- Show line diagnostics
      -- You can pass argument ++unfocus to
      -- unfocus the show_line_diagnostics floating window
      keys[#keys + 1] = { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", mode = "n", desc = "Show Line Diagnostic" }

      -- Show buffer diagnostics
      keys[#keys + 1] = { "gL", "<cmd>Lspsaga show_buf_diagnostics<CR>", mode = "n", desc = "Show Buf Diagnostics" }

      -- Diagnostic jump
      -- You can use <C-o> to jump back to your previous location
      keys[#keys + 1] = { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", mode = "n", desc = "Jump Prev Diagnostic" }
      keys[#keys + 1] = { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", mode = "n", desc = "Jump Next Diagnostic" }

      -- Diagnostic jump with filters such as only jumping to an error
      keys[#keys + 1] = {
        "[E",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        mode = "n",
        desc = "Jump Prev ERROR Diagnostic",
      }
      keys[#keys + 1] = {
        "]E",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        mode = "n",
        desc = "Jump Next ERROR Diagnostic",
      }

      -- Toggle outline
      keys[#keys + 1] = { "go", "<cmd>Lspsaga outline<CR>", mode = "n", desc = "OutLine" }

      -- If you want to keep the hover window in the top right hand corner,
      -- you can pass the ++keep argument
      -- Note that if you use hover with ++keep, pressing this key again will
      -- close the hover window. If you want to jump to the hover window
      -- you should use the wincmd command "<C-w>w"
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc ++keep<CR>", mode = "n", desc = "Hover Doc" }

      -- Call hierarchy
      keys[#keys + 1] = { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", mode = "n", desc = "Call Incoming" }
      keys[#keys + 1] = { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", mode = "n", desc = "Call Outgoing" }

      -- Floating terminal
      keys[#keys + 1] = { "<A-d>", "<cmd>Lspsaga term_toggle<CR>", mode = { "n", "t" }, desc = "Float Terminal" }
    end,
  },
}
