return {
  filetypes = { "python" },

  settings = {
    basedpyright = {
      analysis = {
        -- Use strict type checking
        typeCheckingMode = "standard", -- "off" | "basic" | "standard" | "strict" | "all"

        -- Auto-detect virtual environments
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,

        -- Diagnostic settings
        diagnosticMode = "workspace", -- "openFilesOnly" | "workspace"

        -- Report missing imports as errors
        diagnosticSeverityOverrides = {
          reportMissingImports = "error",
          reportMissingTypeStubs = "warning",
          reportUnusedImport = "information",
          reportUnusedVariable = "information",
          reportUndefinedVariable = "error",
        },
      },
    },
  },

  -- Virtual environment detection
  before_init = function(_, config)
    local Path = require("plenary.path")

    -- Function to find Python interpreter in virtual environment
    local function find_venv_python(venv_path)
      local python_paths = {
        venv_path .. "/bin/python",     -- Unix-like
        venv_path .. "/Scripts/python.exe", -- Windows
      }

      for _, python_path in ipairs(python_paths) do
        if vim.fn.executable(python_path) == 1 then
          return python_path
        end
      end
      return nil
    end

    -- Search for virtual environment
    local function find_venv()
      local cwd = vim.fn.getcwd()
      local venv_names = { ".venv", "venv", "env", ".env" }

      -- Check for virtual environment in current directory
      for _, venv_name in ipairs(venv_names) do
        local venv_path = Path:new(cwd, venv_name)
        if venv_path:exists() then
          local python = find_venv_python(venv_path:absolute())
          if python then
            return python
          end
        end
      end

      -- Check for conda environment
      local conda_prefix = vim.env.CONDA_PREFIX
      if conda_prefix then
        local python = find_venv_python(conda_prefix)
        if python then
          return python
        end
      end

      -- Check for poetry virtual environment
      local poetry_env = vim.fn.system("poetry env info -p 2>/dev/null"):gsub("\n", "")
      if poetry_env ~= "" and vim.fn.isdirectory(poetry_env) == 1 then
        local python = find_venv_python(poetry_env)
        if python then
          return python
        end
      end

      -- Check VIRTUAL_ENV environment variable
      local virtual_env = vim.env.VIRTUAL_ENV
      if virtual_env then
        local python = find_venv_python(virtual_env)
        if python then
          return python
        end
      end

      return nil
    end

    local python_path = find_venv()
    if python_path then
      config.settings.basedpyright.analysis.extraPaths = { vim.fn.getcwd() }
      config.settings.python = { pythonPath = python_path }

      -- Notify user which Python is being used
      vim.schedule(function()
        vim.notify("Using Python: " .. python_path, vim.log.levels.INFO)
      end)
    end
  end,

  -- Auto-restart LSP when switching virtual environments
  on_init = function(client)
    -- Watch for .venv creation/deletion
    local group = vim.api.nvim_create_augroup("basedpyright_venv_watcher", { clear = true })
    vim.api.nvim_create_autocmd({ "DirChanged", "BufEnter" }, {
      group = group,
      pattern = "*.py",
      callback = function()
        -- Restart LSP if virtual environment changed
        vim.schedule(function()
          vim.cmd("LspRestart basedpyright")
        end)
      end,
    })
  end,
}
