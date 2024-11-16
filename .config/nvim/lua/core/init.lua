require("core.options")
require("core.keymaps")
require("core.lazy")
-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme night-owl]])
-- vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd([[colorscheme rose-pine]])
-- vim.cmd([[colorscheme nightfly]])
-- vim.cmd([[colorscheme moonfly]])
vim.cmd([[colorscheme eldritch]])
-- require("custom.templ-static-reload").setup()
--

-- Function to trim LSP log file
local function trim_lsp_log()
	local log_path = vim.fn.expand("~/.local/state/nvim/lsp.log")

	local fs_stat = vim.uv and vim.uv.fs_stat or vim.loop.fs_stat
	if not fs_stat(log_path) then
		print("LSP log file not found at:", log_path)
		return
	end

	local ok, lines = pcall(function()
		return vim.fn.readfile(log_path)
	end)

	if not ok or not lines then
		print("Failed to read file:", lines)
		return
	end

	local max_lines = 20000
	local trim_lines = 1000

	if #lines <= max_lines then
		print("File is under threshold, no trimming needed")
		return
	end

	local trimmed_lines = vim.list_slice(lines, #lines - trim_lines + 1)

	local write_ok, write_err = pcall(function()
		vim.fn.writefile(trimmed_lines, log_path)
	end)

	if not write_ok then
		print("Failed to write file:", write_err)
		return
	end

	print("Successfully trimmed log file from", #lines, "to", #trimmed_lines, "lines")
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		trim_lsp_log()
	end,
	desc = "Trim LSP log file on startup",
})

vim.api.nvim_create_user_command("TrimLspLog", trim_lsp_log, {
	desc = "Trim the LSP log file",
})
