-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set({ "i", "n" }, "<c-a>", "<Home>")
-- vim.keymap.set({ "i", "n" }, "<c-e>", "<End>")
vim.keymap.set("i", "jk", "<esc>")

-- search for visual mode selected
vim.keymap.set("v", "/", 'y/<c-r>"<cr>')

-- gitui
local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>gg", function()
  Util.terminal({ "gitui" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Gitui (root dir)" })
vim.keymap.set("n", "<leader>gG", function()
  Util.terminal({ "gitui" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Gitui (cwd)" })

if vim.g.neovide then
  vim.keymap.set("v", "<C-x>", '"+d') -- cut
  vim.keymap.set("v", "<C-c>", '"+y') -- copy
  vim.keymap.set("i", "<C-v>", "<C-r><C-o>+") -- paste insert mode
  vim.keymap.set("n", "<C-v>", 'm0"+P`]m`v`0=``') -- paste normal mode
  vim.keymap.set("v", "<C-v>", '"+P`]') -- paste visual mode
  vim.keymap.set("c", "<C-v>", "<C-r>+") -- paste command mode
end
