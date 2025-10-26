-- Helper to check if Biome is being used in the project
local function has_biome_config()
  local cwd = vim.fn.getcwd()
  return vim.fn.filereadable(cwd .. "/biome.json") == 1
    or vim.fn.filereadable(cwd .. "/biome.jsonc") == 1
end

-- Helper to check if ESLint config exists
local function has_eslint_config()
  local cwd = vim.fn.getcwd()
  local markers = {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs"
  }

  for _, marker in ipairs(markers) do
    if vim.fn.filereadable(cwd .. "/" .. marker) == 1 then
      return true
    end
  end

  return false
end

-- Only enable ESLint if there's an ESLint config and no Biome config
if has_eslint_config() and not has_biome_config() then
  return {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte', 'astro' },
    root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json', 'eslint.config.js', 'eslint.config.mjs', 'eslint.config.cjs' },
    single_file_support = false,
    settings = {
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = "separateLine"
        },
        showDocumentation = {
          enable = true
        }
      },
      codeActionOnSave = {
        enable = false,
        mode = "all"
      },
      experimental = {
        useFlatConfig = false
      },
      format = true,
      nodePath = "",
      onIgnoredFiles = "off",
      packageManager = "npm",
      problems = {
        shortenToSingleLine = false
      },
      quiet = false,
      rulesCustomizations = {},
      run = "onType",
      useESLintClass = false,
      validate = "on",
      workingDirectory = { mode = "auto" }
    },
  }
else
  -- Return empty config to disable ESLint LSP when Biome is present or no ESLint config exists
  return {}
end