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
    local output = vim.fn.system("git -C " .. vim.fn.shellescape(file_dir) .. " rev-parse --show-toplevel 2>/dev/null")
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

vim.opt.title = true
update_titlestring()
vim.opt.titlestring = "%{v:lua.Get_git_project_and_file()}"
