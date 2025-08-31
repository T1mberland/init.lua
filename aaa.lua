-- 1) LSP診断とその描画を止める
vim.diagnostic.enable(false)
vim.o.signcolumn = "no"
vim.o.statuscolumn = "" -- statuscol.nvim などを無力化

-- 2) inlay hints を止める
pcall(vim.lsp.inlay_hint.enable, false)

-- 3) semantic tokens を止める（よくフリーズ源になる）
vim.lsp.semantic_tokens.stop_all()
for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
	c.server_capabilities.semanticTokensProvider = nil
end

-- 4) hover は plaintext で出して markdown/hl 経路を避ける
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx)
	if not (result and result.contents) then
		return
	end
	local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	lines = vim.lsp.util.trim_empty_lines(lines)
	if vim.tbl_isempty(lines) then
		return
	end
	return vim.lsp.util.open_floating_preview(lines, "plaintext", { border = "single", max_width = 80 })
end
