return {
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed={ "lua_ls", "rust_analyzer", "tinymist", "hls" }
      },
      dependencies = { "williamboman/mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
      dependencies = {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          "nvim-telescope/telescope.nvim",
      },
    },
    {
        "mfussenegger/nvim-lint",
        dependencies = { "williamboman/mason.nvim" },
    },
    {
        "mhartington/formatter.nvim",
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
         'neovim/nvim-lspconfig',
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-cmdline',
        },
    }
}
