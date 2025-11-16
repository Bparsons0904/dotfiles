return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap",
  },
  -- config = function()
  --   require("flutter-tools").setup({})
  -- end,
  config = function()
    require("flutter-tools").setup({
      ui = {
        border = "rounded",
        notification_style = "native",
      },
      decorations = {
        statusline = {
          -- Show Flutter app version in statusline
          app_version = true,
          -- Show current running device in statusline
          device = true,
          -- Show currently selected project config
          project_config = true,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        register_configurations = function(_)
          require("dap").configurations.dart = {}
          require("dap.ext.vscode").load_launchjs()
        end,
      },
      root_patterns = { ".git", "pubspec.yaml" }, -- Find Flutter project root
      fvm = true, -- Support Flutter Version Management
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "//",
        enabled = true,
      },
      dev_log = {
        enabled = true,
        notify_errors = false,
        open_cmd = "tabedit | setlocal modifiable",
      },
      dev_tools = {
        autostart = false,
        auto_open_browser = true,
      },
      outline = {
        open_cmd = "30vnew",
        auto_open = false,
      },
      lsp = {
        color = {
          enabled = true,
          background = false,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          updateImportsOnRename = true,
          enableSnippets = true,
        },
      },
    })

    -- Flutter commands keymap
    addKeyMaps({
      {
        "n",
        "<leader>Fc",
        function()
          require("telescope").extensions.flutter.commands()
        end,
        "Flutter Commands",
      },

      -- Run build_runner for code generation (freezed, json_serializable, etc.)
      {
        "n",
        "<leader>Fb",
        function()
          vim.cmd("20new")
          vim.cmd("te flutter pub run build_runner build --delete-conflicting-outputs")
          vim.cmd("2sleep | normal G")
        end,
        "Flutter Build Runner",
      },

      -- Outline toggle
      { "n", "<leader>Fo", ":FlutterOutlineToggle<CR>", "Flutter Outline Toggle" },

      -- Device selection
      { "n", "<leader>Fd", ":FlutterDevices<CR>", "Flutter Devices" },

      -- Reload/Restart
      { "n", "<leader>Fr", ":FlutterReload<CR>", "Flutter Hot Reload" },
      { "n", "<leader>FR", ":FlutterRestart<CR>", "Flutter Hot Restart" },

      -- Run
      { "n", "<leader>Fu", ":FlutterRun<CR>", "Flutter Run" },
      { "n", "<leader>Fq", ":FlutterQuit<CR>", "Flutter Quit" },

      -- Debug controls (DAP)
      {
        "n",
        "<leader>Fdb",
        function()
          require("dap").toggle_breakpoint()
        end,
        "Toggle breakpoint",
      },
      {
        "n",
        "<leader>Fdc",
        function()
          require("dap").continue()
        end,
        "Debug: Continue",
      },
      {
        "n",
        "<leader>Fds",
        function()
          require("dap").step_over()
        end,
        "Debug: Step Over",
      },
      {
        "n",
        "<leader>Fdi",
        function()
          require("dap").step_into()
        end,
        "Debug: Step Into",
      },
      {
        "n",
        "<leader>Fdo",
        function()
          require("dap").step_out()
        end,
        "Debug: Step Out",
      },
      {
        "n",
        "<leader>Fdx",
        function()
          require("dap").terminate()
        end,
        "Debug: Terminate",
      },
      {
        "n",
        "<leader>Fdl",
        function()
          require("dapui").toggle()
        end,
        "Debug: Toggle UI",
      },
    })
  end,
  ft = "dart",
}
