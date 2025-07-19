local opt = vim.opt

-- Lines
opt.relativenumber = true -- Shows line numbers relative to current cursor position
opt.number = true -- Shows absolute line number on current line
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Number of spaces for each indentation level
opt.expandtab = true -- Converts tabs to spaces
opt.autoindent = true -- Copies indentation from previous line on new line
opt.cursorline = true -- Highlights the current line
opt.backspace = "indent,eol,start" -- Makes backspace work over indents, line breaks, and insertion start
opt.scrolloff = 8 -- Keeps 8 lines visible above/below cursor when scrolling
opt.wrap = false -- Prevents lines from wrapping

-- Appearance
opt.termguicolors = true -- Enables 24-bit RGB colors
opt.background = "dark" -- Sets the color scheme to dark mode
opt.signcolumn = "yes" -- Always shows the sign column (where git/diagnostic icons appear)
-- opt.laststatus = 0 -- Disables the status line completely (0 = never show)
-- opt.cmdheight = 0 -- Minimizes command line height (0 = hide unless needed)

-- Split Windows
opt.splitright = true -- Opens vertical splits to the right
opt.splitbelow = true -- Opens horizontal splits below

-- System
opt.mouse = "a" -- Enables mouse support in all modes
opt.ignorecase = true -- Makes search case-insensitive
opt.smartcase = true -- Makes search case-sensitive if it contains uppercase
opt.clipboard:append("unnamedplus") -- Uses system clipboard for all operations
opt.swapfile = false -- Disables swap file creation
opt.encoding = "utf-8" -- Sets internal encoding
opt.fileencoding = "utf-8" -- Sets file encoding for saving

-- Performance
opt.updatetime = 300 -- Reduces update time (affects CursorHold & swap file writing)
opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete

-- Undo Directory
local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
opt.undofile = true
opt.undodir = undodir

-- LSP Logging (reduce spam)
vim.lsp.set_log_level("ERROR")

-- Diagnostic Configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Could also be "■", "▎", "▸", etc.
    spacing = 2,
    severity = { min = vim.diagnostic.severity.WARN }, -- Only show warnings and errors in virtual text
  },
  float = {
    border = "rounded",
    source = "always", -- Show diagnostic source
    header = "",
    prefix = "",
    format = function(diagnostic)
      local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
      return string.format("%s %s", code, diagnostic.message)
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲", 
      [vim.diagnostic.severity.HINT] = "⚑",
      [vim.diagnostic.severity.INFO] = "»",
    },
    linehl = {},
    numhl = {},
  },
  underline = true,
  update_in_insert = false, -- Don't update diagnostics while typing
  severity_sort = true, -- Show more severe diagnostics first
})
