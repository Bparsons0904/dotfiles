local M = {}

local log_file_path = vim.fn.expand("~/.nvim_project_watch.log")

local function log_message(message)
	local log_file = io.open(log_file_path, "a")
	if log_file then
		log_file:write(message .. "\n")
		log_file:close()
	end
end

local function file_exists(incoming)
	local file = io.open(incoming, "r")
	if file then
		file:close()
	end
	return file ~= nil
end

local function load_project_config()
	local project_config_file = ".templ-reload.lua"
	local cwd = vim.fn.getcwd()
	local config_path = cwd .. "/" .. project_config_file

	if file_exists(config_path) then
		local config = dofile(config_path)
		log_message("Loaded project config from: " .. config_path)
		log_message("Config contents: " .. vim.inspect(config))
		return config
	else
		log_message("No project config found at: " .. config_path)
	end

	return nil
end

local function is_trigger_file(file, trigger_files)
	local ext = file:match("^.+(%..+)$")
	if ext then
		ext = ext:sub(2) -- remove the leading dot
		for _, trigger in ipairs(trigger_files) do
			if ext == trigger then
				return true
			end
		end
	end
	return false
end

local function on_buffer_write()
	log_message("Buffer write triggered")
	local config = load_project_config()

	if not config then
		log_message("No configuration loaded, returning")
		return
	end

	local current_buffer = vim.fn.expand("%:p")
	log_message("Current buffer: " .. current_buffer)

	if config.trigger_files == nil or #config.trigger_files == 0 then
		log_message("No trigger files specified in config")
		return
	end

	if is_trigger_file(current_buffer, config.trigger_files) then
		log_message("Buffer matches trigger file types: " .. vim.inspect(config.trigger_files))
		local update_file = config.update_file
		log_message("Update file: " .. update_file)

		-- Get the buffer number for the update file, or create a new buffer
		local buf = vim.fn.bufnr(update_file, true)
		log_message("Buffer number for update file: " .. buf)

		-- Check if the buffer is loaded, if not, load it
		if not vim.api.nvim_buf_is_loaded(buf) then
			vim.fn.bufload(buf)
			log_message("Loaded buffer: " .. buf)
		end

		-- Save the current window to restore later
		local current_window = vim.api.nvim_get_current_win()
		log_message("Current window: " .. current_window)

		-- Use a new window to perform the write operation
		vim.api.nvim_command("vsplit")
		local new_window = vim.api.nvim_get_current_win()
		log_message("New window: " .. new_window)
		vim.api.nvim_set_current_buf(buf)
		vim.api.nvim_command("write")
		vim.api.nvim_win_close(new_window, true)
		log_message("Closed new window")

		-- Restore the original window
		vim.api.nvim_set_current_win(current_window)
		log_message("Restored original window: " .. current_window)
	else
		log_message("Buffer does not match trigger file types: " .. vim.inspect(config.trigger_files))
	end
end

function M.setup()
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*",
		callback = on_buffer_write,
	})
	log_message("Autocmd for BufWritePost set up")
end

return M
