return {
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		main = "nvim-treesitter.configs",
		opts = {
			--highlight = { enable = false },
			ensure_installed = {
				-- "markdown",
				"haskell",
				"python",
				"lua",
			},
			highlight = {
				enable = true, -- 全体はオン
				disable = { "markdown", "markdown_inline" }, -- ←ここで markdown だけオフ
				-- optional: TSを切ったmarkdownに従来のregexハイライトを併用したい時
				additional_vim_regex_highlighting = { "markdown" },
			},
			incremental_selection = { enable = false },
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Treesitterで構文解析ベースの折りたたみを有効化
			vim.o.foldmethod = "expr"
			vim.o.foldexpr = "nvim_treesitter#foldexpr()"

			-- デフォルトで全部展開しておく（必要に応じて）
			vim.o.foldenable = false
			vim.o.foldlevel = 99
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		--event = "CursorMoved",
		event = { "BufReadPre", "BufNewFile" },
	},
}
