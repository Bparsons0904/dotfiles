-- Adds a wrap on text for markdown
local function enable_soft_wrap()
  vim.opt_local.wrap = true
  vim.opt_local.linebreak = true
  vim.opt_local.textwidth = 0
  vim.opt_local.wrapmargin = 0
end

local augroup = vim.api.nvim_create_augroup("MarkdownWrapping", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "text", "gitcommit" },
  callback = enable_soft_wrap,
})

-- Also trigger on BufEnter to catch cases where FileType might have already fired
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  pattern = { "*.md", "*.txt", "*.markdown" },
  callback = function()
    if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" or vim.bo.filetype == "gitcommit" then
      enable_soft_wrap()
    end
  end,
})
