return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	keys = {
		{ "<leader>uu", "<cmd>Neotree float reveal toggle<cr>", desc = "NeoTree" },
		{ "<leader>ui", "<cmd>Neotree left reveal toggle<cr>", desc = "NeoTree" },
		{ "<leader>ul", "<cmd>Neotree left reveal toggle<cr>", desc = "NeoTree" },
		{ "<leader>ur", "<cmd>Neotree right reveal toggle<cr>", desc = "NeoTree" },

		{ "<leader>ug", "<cmd>Neotree buffers<cr>", desc = "NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
}
