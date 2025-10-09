local lsp = require("lsp")
vim.lsp.config.tinymist = {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
}
