local M = {}

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
		return config
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
	local config = load_project_config()

	if not config then
		return
	end

	local current_buffer = vim.fn.expand("%:p")

	if config.trigger_files == nil or #config.trigger_files == 0 then
		return
	end

	if is_trigger_file(current_buffer, config.trigger_files) then
		local build_command = config.build_command

		if build_command == nil or build_command == "" then
			vim.api.nvim_err_writeln("No build command specified in config")
			return
		end

		-- Run the build command
		vim.fn.system(build_command)
	end
end

function M.setup()
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*",
		callback = on_buffer_write,
	})
end

return M
