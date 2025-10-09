local lsp = require("lsp")
vim.lsp.config.pylsp = {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
	settings = {
		pylsp = {
			plugins = {
				ruff = { enabled = true, organizeImports = false },
			},
		},
	},
}
