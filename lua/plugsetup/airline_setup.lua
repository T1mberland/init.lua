vim.g.Powerline_symbols = 'fancy'
vim.g.airline_theme = 'base16'
vim.g.airline_powerline_fonts = 1
vim.g.webdevicons_enable_airline_tabline = 0
vim.g['airline#extensions#tabline#enabled'] = 1
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext', {silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':bprev', {silent = true})
