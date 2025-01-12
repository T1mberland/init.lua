return {
	"folke/noice.nvim",
	event = "VeryLazy",
	--enabled = false,
	opts = {
		notify = {
			-- Noice can be used as `vim.notify` so you can route any notification like other messages
			-- Notification messages have their level and other properties set.
			-- event is always "notify" and kind can be any log level as a string
			-- The default routes will forward notifications to nvim-notify
			-- Benefit of using Noice for this is the routing and consistent history view
			enabled = false,
			view = "notify",
		},
	},

	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
