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
			--"nvim-telescope/telescope.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
	},
}
