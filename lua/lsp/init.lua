-- lua/lsp/init.lua
local M = {}

-- 共通設定
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

-- 他のファイルで使えるように
M.capabilities = capabilities
M.on_attach = on_attach

-- 各サーバー設定ファイルをrequireして登録
require("lsp.lua_ls")
require("lsp.rust_analyzer")
require("lsp.hls")
require("lsp.tinymist")
require("lsp.pylsp")

-- 全サーバーをenable
for _, srv in ipairs({ "lua_ls", "rust_analyzer", "hls", "tinymist", "pylsp" }) do
	vim.lsp.enable(srv)
end

return M
