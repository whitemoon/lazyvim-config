-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- parser gbk file
vim.opt.fileencodings = "utf-8,gbk"

vim.g.autoformat = false

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve-r-cr-o:hor20,a:blinkon100"
vim.opt.cursorcolumn = true

vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for

-- vim.o.background = "light"
vim.o.termguicolors = true

if vim.g.neovide then
  vim.o.guifont = "Iosevka Nerd Font Mono:h15"
  vim.g.neovide_transparency = 0.9
  -- transparent popupmenu and float window
  -- vim.o.winblend = 80
  -- vim.o.pumblend = 80

  -- vim.g.neovide_cursor_vfx_mode = "sonicboom"
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.neovide_underline_automatic_scaling = true
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_scroll_animation_length = 0.3
end
