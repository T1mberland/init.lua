return {
  "unblevable/quick-scope",
  config = function()
    -- Your plugin configuration here
    vim.api.nvim_create_augroup("qs_colors", {clear = true})
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = "qs_colors",
        pattern = "*",
        command = "highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline",
    })
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = "qs_colors",
        pattern = "*",
        command = "highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline",
    })
  end,
}
