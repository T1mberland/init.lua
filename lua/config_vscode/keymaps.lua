local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-j>", "<C-d>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-u>", opts)
vim.api.nvim_set_keymap("v", "<C-j>", "<C-d>", opts)
vim.api.nvim_set_keymap("v", "<C-k>", "<C-u>", opts)
vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)

vim.cmd([[set iminsert=0]])
vim.cmd([[set imsearch=0]])
