return {
    {
        "williamboman/mason.nvim", opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim", opts = {}, dependencies = { "williamboman/mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
          local on_attach = function(_, _)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            --vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
          end

          local lspconfig = require('lspconfig')
          lspconfig.lua_ls.setup({ on_attach = on_attach })
          lspconfig.rust_analyzer.setup({ on_attach = on_attach })
          lspconfig.typst_lsp.setup({ on_attach = on_attach })
        end,
      dependencies = {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          "nvim-telescope/telescope.nvim",
      },
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require('lint').linters_by_ft = {
              markdown = {'vale'},
              python = {'ruff'},
              haskell = {'hlint'},
            }
        end,
        dependencies = { "williamboman/mason.nvim" },
    },
    {
        "mhartington/formatter.nvim",
    },
}
