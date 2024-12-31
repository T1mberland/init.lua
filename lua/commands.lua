local function shortcut_name(name)
	if name == "a" then
		return "align"
	elseif name == "as" then
		return "align*"
	elseif name == "t" then
		return "theorem"
	elseif name == "ts" then
		return "theorem*"
	elseif name == "d" then
		return "definition"
	elseif name == "ds" then
		return "definition*"
	elseif name == "p" then
		return "proposition"
	elseif name == "ps" then
		return "proposition*"
	else
		return name
	end
end

local function insert_text_block(args)
	-- Split the argument into parts
	local parts = vim.split(args.args, " ")

	local env_name = shortcut_name(parts[1])
	local current_line = vim.api.nvim_get_current_line()
	local indent = string.match(current_line, "^%s*") -- Matches leading whitespace
	-- The function inserts the LaTeX align* block
	local lines = { indent .. "\\begin{" .. env_name .. "}", "", indent .. "\\end{" .. env_name .. "}" }
	-- Get the current line number
	local line_num = vim.api.nvim_win_get_cursor(0)[1]
	-- Insert the lines at the current line number
	vim.api.nvim_buf_set_lines(0, line_num, line_num, false, lines)
	-- Move the cursor to the empty line inside the align environment
	vim.api.nvim_win_set_cursor(0, { line_num + 1, 0 })
end

-- Create a flexible command named "Tb" that accepts an argument
vim.api.nvim_create_user_command("T", insert_text_block, { nargs = 1 })
