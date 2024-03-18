if vim.g.vscode then
    local vim = vim
    local Plug = vim.fn['plug#']

    vim.call('plug#begin')
    Plug('jonathanfilip/vim-lucius')
    Plug('djpohly/elly.vim')
    Plug('nanotech/jellybeans.vim')
    Plug('neovimhaskell/haskell-vim')
    Plug('vim-airline/vim-airline')
    Plug('vim-airline/vim-airline-themes')
    Plug('unblevable/quick-scope')
    Plug('rhysd/clever-f.vim')
    Plug('nvim-lua/plenary.nvim')
    Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })
    Plug('rose-pine/neovim')
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

    --  (ncomment the two plugins below if you want to manage the language servers from neovim
    Plug('williamboman/mason.nvim')
    Plug('williamboman/mason-lspconfig.nvim')

    -- LSP Support)
    Plug('neovim/nvim-lspconfig')
    -- Autocompletion)
    Plug('hrsh7th/nvim-cmp')
    Plug('hrsh7th/cmp-nvim-lsp')
    Plug('L3MON4D3/LuaSnip')

    Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x'})
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
    -- ============== THEMES END ==============

    --Plug('neovimhaskell/haskell-vim')
    Plug('vim-airline/vim-airline')
    Plug('vim-airline/vim-airline-themes')
    Plug('unblevable/quick-scope')
    Plug('rhysd/clever-f.vim')
    Plug('nvim-lua/plenary.nvim')
    Plug('nvim-telescope/telescope.nvim', { ['tag']= '0.1.5' })
    Plug('rose-pine/neovim')
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
    
    Plug('williamboman/mason.nvim')
    Plug('williamboman/mason-lspconfig.nvim')

    Plug('neovim/nvim-lspconfig')

    Plug('hrsh7th/nvim-cmp')
    Plug('hrsh7th/cmp-nvim-lsp')
    Plug('L3MON4D3/LuaSnip')

    Plug('VonHeikemen/lsp-zero.nvim', { ['branch']= 'v3.x'})
    
    Plug('ThePrimeagen/harpoon')
    
    Plug('lervag/vimtex')
    -- Plug( 'Shougo/deoplete.nvim')
    -- Plug('lervag/vimtex')
    Plug('dense-analysis/ale')
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

    vim.g.clever_f_fix_key_direction = 1
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
    --vim.api.nvim_set_keymap('n', '<C-a>', '<Plug>AirlineSelectPrevTab', {silent = true})
    --vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>AirlineSelectNextTab', {silent = true})

    -- Haskell configurations
    vim.g.haskell_enable_quantification = 1
    vim.g.haskell_enable_recursivedo = 1
    vim.g.haskell_enable_arrowsyntax = 1
    vim.g.haskell_enable_pattern_synonyms = 1
    vim.g.haskell_enable_typeroles = 1
    vim.g.haskell_enable_static_pointers = 1
    vim.g.haskell_backpack = 1

    -- LaTeX configurations
    vim.g.vimtex_compiler_latexmk = { ['continuous'] = 0 }

    -- Deoplete configurations
    vim.g['deoplete#enable_at_startup'] = 1

    -- ALE configurations
    -- vim.g.ale_echo_msg_error_str = 'E'
    -- vim.g.ale_echo_msg_warning_str = 'W'
    -- vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
    -- vim.g.ale_lint_on_text_changed = 'always'  -- Update warnings in insert mode
end
