return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter", -- Load on VimEnter event
	opts = {
		options = {
			--theme = "auto",
			theme = "gruvbox",
			globalstatus = true,
			icons_enabled = true,
		},
		-- sections と同列に追記する
		tabline = {
			lualine_a = {
				{
					"buffers",
					buffers_color = switch_color,
					symbols = { modified = "_󰷥", alternate_file = " ", directory = " " },
				},
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {
				"diff",
			},
			lualine_y = {
				"branch",
			},
			lualine_z = {
				{ "tabs", tabs_color = switch_color },
			},
		},
	},
}
