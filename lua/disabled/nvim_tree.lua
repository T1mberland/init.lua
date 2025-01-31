return {
	"nvim-tree/nvim-tree.lua",
	--enabled = false,
	version = "*",
	--lazy = false,
	cmd_ = {
		"NvimTreeOpen",
		"NvimTreeFocus",
		"NvimTreeToggle",
		"NvimTreeRefresh",
	},

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true

		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			--vim.keymap.set('n', '?',  api.tree.toggle_help, opts('Help'))
			vim.keymap.del("n", "<C-k>", { buffer = bufnr })
		end

		-- empty setup using defaults
		require("nvim-tree").setup({
			on_attach = my_on_attach,
		})
	end,
}
