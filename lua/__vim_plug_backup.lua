if vim.g.vscode then
    local vim = vim
    local Plug = vim.fn['plug#']

    vim.call('plug#begin')
        Plug('unblevable/quick-scope')
        Plug('rhysd/clever-f.vim')
        Plug('rose-pine/neovim')
    vim.call('plug#end')

    vim.g.clever_f_fix_key_direction = 1
else
    local vim = vim
    local Plug = vim.fn['plug#']
    print("HERE WE GOOOOOOO!")

    vim.call('plug#begin')
        -- ============== THEMES ==============
        Plug('jonathanfilip/vim-lucius')
        Plug('djpohly/elly.vim')
        Plug('morhetz/gruvbox')
        Plug('luisiacc/gruvbox-baby')
        Plug('nanotech/jellybeans.vim')
        Plug('karoliskoncevicius/moonshine-vim')
        Plug('rose-pine/neovim')
        -- ============== THEMES END ==============

        --Plug('neovimhaskell/haskell-vim')
        ----Plug('vim-airline/vim-airline')
        ----Plug('vim-airline/vim-airline-themes')
        ----Plug('unblevable/quick-scope')
        ----Plug('nvim-lua/plenary.nvim')
        ----Plug('rhysd/clever-f.vim')
        ----Plug('nvim-telescope/telescope.nvim', { ['tag']= '0.1.5' })
        Plug('ThePrimeagen/harpoon')
        --Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

        ----Plug('williamboman/mason.nvim')
        ----Plug('williamboman/mason-lspconfig.nvim')
        ----Plug('neovim/nvim-lspconfig')
        ----Plug('mfussenegger/nvim-lint') -- Linter
        ----Plug('mhartington/formatter.nvim') -- formatter

        Plug('kaarmu/typst.vim')
    vim.call('plug#end')

    if vim.fn.has('gui_running') == 1 then
        vim.opt.guifont = "NovaMono for Powerline:h11"
    end

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

    --vim.cmd([[colorscheme elly]])
    --vim.cmd([[colorscheme gruvbox]])

    -- Enable telescope theme
    vim.g.gruvbox_baby_telescope_theme = 1
    -- Enable transparent mode
    --vim.g.gruvbox_baby_transparent_mode = 1
    vim.cmd([[colorscheme gruvbox-baby]])
    --vim.cmd([[colorscheme moonshine_lowcontrast]])
    vim.opt.termguicolors = true

    vim.g.Powerline_symbols = 'fancy'
    vim.g.airline_theme = 'base16'
    vim.g.airline_powerline_fonts = 1
    vim.g.webdevicons_enable_airline_tabline = 0
    vim.g['airline#extensions#tabline#enabled'] = 1
    vim.api.nvim_set_keymap('n', '<C-l>', ':bnext', {silent = true})
    vim.api.nvim_set_keymap('n', '<C-h>', ':bprev', {silent = true})

    require('lsp')
    require('linter')
    require('telescope')
end

