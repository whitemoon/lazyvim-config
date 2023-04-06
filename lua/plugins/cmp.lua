return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
      },
      {
        "delphinus/cmp-ctags",
      },
    },
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local neogen = require("neogen")
      local compare = cmp.config.compare

      opts.sorting = {
        priority_weight = 2,
        comparators = {
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.locality,
          compare.kind,
          compare.length,
          compare.order,
        },
      }

      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
            -- elseif luasnip.expand_or_jumpable() then
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif neogen.jumpable() then
            neogen.jump_next()
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
          elseif neogen.jumpable(true) then
            neogen.jump_prev()
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      local sources = {
        { name = "crates" },
        { name = "cmp_ctags" },
      }
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, sources))
    end,
  },
}
