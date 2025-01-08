return {
	{
		"williamboman/mason.nvim",
		opts = {},
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
			"MasonUpdate",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"ast_grep",
				"lua_ls",
				"pylsp",
				"ruff",
				"rust_analyzer",
				"tinymist",
			},
		},
		dependencies = { "williamboman/mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvim-telescope/telescope.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"mfussenegger/nvim-lint",
		dependencies = { "williamboman/mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				markdown = { "markdownlint" },
				python = { "ruff" },
				haskell = { "hlint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()

					-- You can call `try_lint` with a linter name or a list of names to always
					-- run specific linters, independent of the `linters_by_ft` configuration
					--require("lint").try_lint("cspell")
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "ruff" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				haskell = { "ormolu" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"zapling/mason-conform.nvim",
		opts = {
			ignore_install = { "rustfmt" }, -- List of formatters to ignore during install
		},
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
	},

	-- Nvim-cmp plugins
	{
		"hrsh7th/nvim-cmp",
		event = "BufReadPre",
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
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					--['<C-b>'] = cmp.mapping.scroll_docs(-4),
					--['<C-f>'] = cmp.mapping.scroll_docs(4),
					--['<C-Space>'] = cmp.mapping.complete(),
					["<C-f>"] = cmp.mapping.abort(),
					--['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = 'vsnip' }, -- For vsnip users.
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
				sources = {
					{ name = "buffer" },
				},
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

			cmp.setup.cmdline("/", {
				sources = cmp.config.sources({
					{ name = "nvim_lsp_document_symbol" },
				}, {
					{ name = "buffer" },
				}),
			})

			vim.o.updatetime = 250 -- Set delay for diagnostics display
			vim.diagnostic.config({
				virtual_text = false, -- Disable inline diagnostics
				float = {
					source = "always", -- Show source of diagnostics
				},
			})

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
			})
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
