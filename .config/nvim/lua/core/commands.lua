vim.api.nvim_create_user_command("GitIgnore", function()
  local file_path = vim.fn.expand("%:p")
  vim.cmd("!git update-index --skip-worktree " .. vim.fn.shellescape(file_path))
end, { desc = "Git: Ignore changes to current file locally" })

vim.api.nvim_create_user_command("GitTrack", function()
  local file_path = vim.fn.expand("%:p")
  vim.cmd("!git update-index --no-skip-worktree " .. vim.fn.shellescape(file_path))
end, { desc = "Git: Stop ignoring changes to current file" })

vim.api.nvim_create_user_command("BiomeFix", function()
  vim.lsp.buf.code_action({
    context = {
      only = { "source.fixAll.biome" },
      diagnostics = {},
    },
    apply = true,
  })
end, { desc = "Biome: Fix all issues in the current file" })
