local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>kk', builtin.find_files, {})
vim.keymap.set('n', '<C-o>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff',function()
    builtin.grep_string({ serach = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<C-p>',function()
    builtin.grep_string({ serach = vim.fn.input("Grep > ") });
end)

