-- minimal.lua
vim.cmd("filetype plugin indent on")
local ok, lsp = pcall(require, "lspconfig")
if ok then
	lsp.lua_ls.setup({})
end -- ある言語サーバ1つでOK
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", max_width = 80 })
