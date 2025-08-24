-- minimal.lua（プラグイン不要、--clean でOK）
if vim.loader and vim.loader.enable then
	vim.loader.enable()
end
vim.o.keywordprg = ":help"

-- Mason のパスを丁寧に当てにいく
local data = vim.fn.stdpath("data")
local cands = {
	data .. "\\mason\\bin\\lua-language-server.cmd", -- shim
	data .. "\\mason\\packages\\lua-language-server\\extension\\server\\bin\\lua-language-server.exe", -- 実体
}
-- PATH にある場合のフォールバック
table.insert(cands, "lua-language-server")

local function first_existing(paths)
	for _, p in ipairs(paths) do
		if vim.loop.fs_stat(p) then
			return p
		end
	end
end

local cmd_path = first_existing(cands)
if not cmd_path then
	vim.notify("lua-language-server not found in Mason or PATH", vim.log.levels.ERROR)
end

-- 余計な装飾を外した素朴 hover（描画起因のフリーズ回避）
vim.lsp.handlers["textDocument/hover"] =
	vim.lsp.with(vim.lsp.handlers.hover, { border = "single", max_width = 80, focusable = false })

-- 浮動markdownでTSを停止（重さ回避）
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(ev)
		if vim.bo[ev.buf].buftype == "nofile" then
			pcall(vim.treesitter.stop, ev.buf, "markdown")
		end
	end,
})

-- FileType=lua が付いた“そのバッファ”の文脈で確実に起動
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function(ev)
		if not cmd_path then
			return
		end
		vim.notify("Starting lua_ls: " .. cmd_path)
		vim.api.nvim_buf_call(ev.buf, function()
			vim.lsp.start({
				name = "lua_ls",
				cmd = { cmd_path },
				root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(ev.buf)),
				settings = { Lua = { workspace = { checkThirdParty = false }, telemetry = { enable = false } } },
			})
		end)
	end,
})

-- K は LSP が居れば hover、居なければ :help
vim.keymap.set("n", "K", function()
	if next(vim.lsp.get_clients({ bufnr = 0 })) then
		vim.lsp.buf.hover()
	else
		vim.cmd("help " .. vim.fn.expand("<cword>"))
	end
end, { silent = true })
