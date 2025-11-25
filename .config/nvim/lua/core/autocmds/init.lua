local autocmds_path = vim.fn.stdpath("config") .. "/lua/core/autocmds"

for _, file in ipairs(vim.fn.readdir(autocmds_path)) do
  if file:match("%.lua$") and file ~= "init.lua" then
    local module = file:gsub("%.lua$", "")
    require("core.autocmds." .. module)
  end
end
