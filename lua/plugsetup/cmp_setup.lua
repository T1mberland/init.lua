local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    --['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    --['<C-e>'] = cmp.mapping.abort(),
     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    { name = 'nvim_lsp_signature_help' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'git' },
}, {
  { name = 'buffer' },
})
})
require("cmp_git").setup() ]] --

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' }
  }, {
    { name = 'buffer' }
  })
})

vim.o.updatetime = 250 -- Set delay for diagnostics display
vim.diagnostic.config({
  virtual_text = false,  -- Disable inline diagnostics
  float = {
    source = "always",   -- Show source of diagnostics
  },
})

-- <Leader>k to see the diagnostics(errors, warnings)
vim.keymap.set("n", "<Leader>k", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>l", function()
  vim.diagnostic.setloclist()
  vim.cmd("lopen")  -- Opens the location list
end, { noremap = true, silent = true })


local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  --vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require('lspconfig')['tinymist'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require('lspconfig')['hls'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require('lspconfig')['pylsp'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}

