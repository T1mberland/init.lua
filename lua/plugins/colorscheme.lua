return {
    "luisiacc/gruvbox-baby",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.g.gruvbox_baby_telescope_theme = 1
      vim.opt.termguicolors = true
      vim.cmd([[colorscheme gruvbox-baby]])
    end,
}
