-- Set netrw list style
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

function Get_git_project_and_file()
	local file = vim.fn.expand("%:t")
	if file == "" then
		file = "[No Name]"
	end

	local file_icon = "📄"

	local git_dir = vim.fn
		.system("git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel 2>/dev/null")
		:gsub("\n", "")

	if vim.v.shell_error ~= 0 then
		return file_icon .. " " .. file
	else
		local dir_icon = "📁"
		return dir_icon .. " " .. vim.fn.fnamemodify(git_dir, ":t") .. " | " .. file_icon .. " " .. file
		-- return file_icon .. " " .. file .. " | " .. dir_icon .. " " .. vim.fn.fnamemodify(git_dir, ":t")
	end
end

vim.opt.title = true
vim.opt.titlestring = "%{v:lua.Get_git_project_and_file()}"

vim.opt.title = true
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
