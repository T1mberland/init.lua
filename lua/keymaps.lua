-- =============== KEY MAPS ===============

local opts = { noremap = true, silent = true }

-- Moving by display lines
vim.api.nvim_set_keymap('n', 'j', 'gj', opts)
vim.api.nvim_set_keymap('n', 'k', 'gk', opts)
vim.api.nvim_set_keymap('n', '<Down>', 'gj', opts)
vim.api.nvim_set_keymap('n', '<Up>', 'gk', opts)

-- Reverse to move by actual lines
vim.api.nvim_set_keymap('n', 'gj', 'j', opts)
vim.api.nvim_set_keymap('n', 'gk', 'k', opts)

-- Various other normal mode mappings
vim.api.nvim_set_keymap('n', '<C-b>', '<', opts)
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', opts)
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', opts)
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-d>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-u>', opts)
vim.api.nvim_set_keymap('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>/\\<<C-r><C-w>\\>/gI<Left><Left><Left>', opts)
vim.api.nvim_set_keymap('n', '<C-d>', '"_dd', opts)
vim.api.nvim_set_keymap('n', '<C-x>', '"_x', opts)
vim.api.nvim_set_keymap('n', 'K', '<nop>', opts)

vim.api.nvim_set_keymap('n', '<C-S-a>', ':lua vim.lsp.buf.hover()', opts)

-- Disable <C-o> in normal mode
vim.api.nvim_set_keymap('n', '<C-o>', '<nop>', opts)
vim.api.nvim_set_keymap('n', '<C-m>', '<nop>', opts)
vim.api.nvim_set_keymap('n', '<C-n>', '<nop>', opts)

vim.api.nvim_set_keymap('i', 'jk', '<ESC>', opts)


-- Moving in visual mode
vim.api.nvim_set_keymap('v', '<C-j>', '<C-d>', opts)
vim.api.nvim_set_keymap('v', '<C-k>', '<C-u>', opts)
vim.api.nvim_set_keymap('v', '<C-d>', '"_d', opts)
vim.api.nvim_set_keymap('v', '<C-x>', '"_x', opts)
vim.api.nvim_set_keymap('v', '<C-o>', ':m \'<-2<CR>gv=gv', opts)
vim.api.nvim_set_keymap('v', '<C-i>', ':m \'>+1<CR>gv=gv', opts)
vim.api.nvim_set_keymap('v', 'J', '<nop>', opts)

-- <Leader>t to open settings
vim.api.nvim_set_keymap('n', '<Leader>t', ":e ~/AppData/Local/nvim", opts)

vim.api.nvim_set_keymap('v', 'K', '<nop>', opts)

