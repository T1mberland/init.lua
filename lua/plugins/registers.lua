return {
	"tversteeg/registers.nvim",
	cmd = "Registers",
	config = true,
	keys = {
		{ '"', mode = { "n", "v" } },
		{ "<C-R>", mode = "i" },
	},
	opts = {
		window = {
			-- The window can't be wider than 100 characters
			max_width = 100,
			-- Show a small highlight in the sign column for the line the cursor is on
			highlight_cursorline = true,
			-- Don't draw a border around the registers window
			border = "rounded",
			-- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
			transparency = 10,
		},
	},
	name = "registers",
}
