return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			--"nvim-telescope/telescope.nvim",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = { },
		dependencies = { {"williamboman/mason.nvim", opts = {} }, "neovim/nvim-lspconfig", },
	},
}
