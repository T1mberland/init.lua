-- Set up encoding
vim.opt.encoding = "utf-8"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Search options
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override 'ignorecase' when search contains uppercase characters
vim.opt.incsearch = true -- Shows the match while typing

-- UI options
vim.opt.laststatus = 2 -- Always display the status line
vim.opt.ruler = true -- Show the cursor position all the time
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line number

-- Editing options
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.softtabstop = 4 -- Number of spaces in tab when editing

-- Set leader key
vim.g.mapleader = " "

-- Additional settings
vim.opt.scrolloff = 8 -- Minimum number of screen lines to keep above and below the cursor
vim.opt.formatoptions:append("mM") -- Don't insert line breaks in the middle of multibyte characters
vim.opt.ambiwidth = "double" -- Make ambiguous-width characters twice as wide (useful for some Unicode characters)
vim.opt.display:append("lastline") -- Try to show as much as possible of the last line
vim.opt.updatetime = 500

-- Enable filetype plugins and indenting
vim.cmd [[filetype plugin indent on]]

-- Enable syntax highlighting
vim.cmd [[syntax on]]

-- Set leader key
vim.g.mapleader = " "
--vim.g.maplocalleader = "]"

require('keymaps')
require('plugins')
require('commands')

-- 

