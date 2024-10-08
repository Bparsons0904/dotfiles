-- Set netrw list style
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

function Get_git_project_and_file()
	local file = vim.fn.expand("%:t")
	if file == "" then
		file = "[No Name]"
	end

	local file_icon = "📄"
	local dir_icon = "📁"
	local file_dir = vim.fn.expand("%:p:h")
	local git_dir = ""

	local success = pcall(function()
		local output =
			vim.fn.system("git -C " .. vim.fn.shellescape(file_dir) .. " rev-parse --show-toplevel 2>/dev/null")
		if vim.v.shell_error == 0 then
			git_dir = output:gsub("\n", "")
		end
	end)

	if success and git_dir ~= "" then
		return dir_icon .. " " .. vim.fn.fnamemodify(git_dir, ":t") .. " " .. file_icon .. " " .. file
	else
		return file_icon .. " " .. file
	end
end

local cached_titlestring = ""

local function update_titlestring()
	local new_titlestring = Get_git_project_and_file()
	if new_titlestring ~= cached_titlestring then
		cached_titlestring = new_titlestring
		vim.opt.titlestring = new_titlestring
	end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufFilePost", "BufWritePost" }, {
	callback = update_titlestring,
})

-- Initial setup
vim.opt.title = true
update_titlestring()
vim.opt.titlestring = "%{v:lua.Get_git_project_and_file()}"

-- Lines
opt.relativenumber = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.cursorline = true
opt.backspace = "indent,eol,start"
opt.scrolloff = 8
opt.wrap = false
opt.foldmethod = "marker"

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.laststatus = 0
opt.cmdheight = 0

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- System
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.clipboard:append("unnamedplus")
opt.swapfile = false
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Performance
opt.updatetime = 300
opt.timeoutlen = 500

-- Encoding

-- Undo Directory
local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
opt.undofile = true
opt.undodir = undodir

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})
