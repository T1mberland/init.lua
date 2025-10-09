local lsp = require("lsp")
vim.lsp.config.rust_analyzer = {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
}
