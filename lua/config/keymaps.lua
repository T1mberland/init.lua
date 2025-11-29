-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-j>", "<C-d>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-u>", opts)
vim.api.nvim_set_keymap("v", "<C-j>", "<C-d>", opts)
vim.api.nvim_set_keymap("v", "<C-k>", "<C-u>", opts)
vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)

vim.cmd([[set iminsert=0]])
vim.cmd([[set imsearch=0]])

vim.keymap.set("n", "<leader>k", function()
  vim.diagnostic.open_float(nil, { scope = "line", border = "rounded", source = true })
end, { desc = "Line diagnostics (float)" })
