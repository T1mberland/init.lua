-- Nvim-cmp plugins
return {
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						--vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					--["<C-b>"] = cmp.mapping.scroll_docs(-4),
					--["<C-f>"] = cmp.mapping.scroll_docs(4),
					--['<C-Space>'] = cmp.mapping.complete(),
					["<C-f>"] = cmp.mapping.abort(),
					--['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" }, -- For vsnip users.
					-- { name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
					{ name = "nvim_lsp_signature_help" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
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
require("cmp_git").setup() ]]
			--

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "nvim_lsp_document_symbol" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			vim.o.updatetime = 250 -- Set delay for diagnostics display
			vim.diagnostic.config({
				virtual_text = false, -- Disable inline diagnostics
				float = {
					source = "always", -- Show source of diagnostics
				},
			})

			-- Configure rounded borders for LSP floating windows
			vim.diagnostic.config({
				float = { border = "rounded" }, -- Rounded corners for diagnostics
			})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded", -- Rounded corners for hover
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded", -- Rounded corners for signature help
			})

			-- Override floating preview globally
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or "rounded"
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			-- <Leader>k to see the diagnostics(errors, warnings)
			vim.keymap.set("n", "<Leader>k", function()
				vim.diagnostic.open_float(nil, { focusable = false })
			end, { noremap = true, silent = true })

			vim.keymap.set("n", "<Leader>l", function()
				vim.diagnostic.setloclist()
				vim.cmd("lopen") -- Opens the location list
			end, { noremap = true, silent = true })

			local on_attach = function(_, _)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
				--vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			end

			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig")["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			require("lspconfig")["rust_analyzer"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			require("lspconfig")["tinymist"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			require("lspconfig")["hls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			require("lspconfig")["pylsp"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					pylsp = {
						plugins = {
							ruff = {
								enabled = true,
								organizeImports = false,
							},
							--autopep8 = { enabled = false },
							--yapf = { enabled = false },
							--isort = { enabled = false },
							--pyflakes = { enabled = false },
						},
					},
				},
			})

			-- --- Hoverに枠＆色を必ず付けるパッチ ---------------------------------------
			do
				-- ① open_floating_preview にデフォルト枠を強制
				local ofp = vim.lsp.util.open_floating_preview
				function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
					opts = opts or {}
					opts.border = opts.border or "rounded" -- ← 丸枠を必ず付ける
					-- (任意) サイズ控えめに
					opts.max_width = opts.max_width or math.floor(vim.o.columns * 0.45)
					opts.max_height = opts.max_height or math.floor(vim.o.lines * 0.30)

					local bufnr, winnr = ofp(contents, syntax, opts, ...)

					-- 枠・背景のハイライトを確実に適用（テーマで見えない問題に対応）
					pcall(
						vim.api.nvim_set_option_value,
						"winhighlight",
						"NormalFloat:NormalFloat,FloatBorder:FloatBorder",
						{ win = winnr }
					)

					return bufnr, winnr
				end

				-- ② 枠が見える色に調整（colorscheme 変更にも追随）
				local function set_float_hl()
					local nf = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
					local cm = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
					local nor = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
					local fg = (cm and cm.fg) or (nor and nor.fg) or "#a0a0a0"
					vim.api.nvim_set_hl(0, "NormalFloat", { bg = (nf and nf.bg) or "NONE" })
					vim.api.nvim_set_hl(0, "FloatBorder", { fg = fg, bg = (nf and nf.bg) or "NONE" })
				end
				set_float_hl()
				vim.api.nvim_create_autocmd("ColorScheme", { callback = set_float_hl })

				-- ③ 念のためハンドラ側でも丸枠要求（ダブルで保険）
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
				vim.lsp.handlers["textDocument/signatureHelp"] =
					vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			end
			-- ---------------------------------------------------------------------------
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
	{ "hrsh7th/cmp-path", event = "InsertEnter" },
	{ "hrsh7th/cmp-vsnip", event = "InsertEnter" },
	{ "hrsh7th/cmp-cmdline", event = "ModeChanged" }, --これだけは'ModeChanged'でなければまともに動かなかった。
	{ "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lsp-document-symbol", event = "InsertEnter" },
	{ "hrsh7th/cmp-calc", event = "InsertEnter" },
	{ "onsails/lspkind.nvim", event = "InsertEnter" },
	{ "hrsh7th/vim-vsnip", event = "InsertEnter" },
	{ "hrsh7th/vim-vsnip-integ", event = "InsertEnter" },
	{ "rafamadriz/friendly-snippets", event = "InsertEnter" },
}
