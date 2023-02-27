-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("indent_and_tabs"),
  pattern = { "lua", "ruby", "markdown" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup("user_markdown"),
  pattern = "*.md",
  desc = "beautify markdown",
  callback = function()
    vim.cmd([[set syntax=markdown]])
    require("utils.markdown_syn").set_syntax()
  end,
})
