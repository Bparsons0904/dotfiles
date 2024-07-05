-- Set netrw list style
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

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
