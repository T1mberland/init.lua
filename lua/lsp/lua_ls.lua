local lsp = require("lsp")
vim.lsp.config.lua_ls = {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
}
