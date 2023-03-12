-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "n" }, "<c-a>", "<Home>")
vim.keymap.set({ "i", "n" }, "<c-e>", "<End>")
vim.keymap.set("i", "jk", "<esc>")

-- search for visual mode selected
vim.keymap.set("v", "/", 'y/<c-r>"<cr>')
