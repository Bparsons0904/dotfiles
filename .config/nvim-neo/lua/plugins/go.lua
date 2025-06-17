return {
  "ray-x/go.nvim",
  enabled = true,
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup({
          icons = { expanded = "▾", collapsed = "▸" },
          layouts = {
            {
              elements = {
                "scopes",
                "breakpoints",
                "stacks",
                "watches",
              },
              size = 40,
              position = "left",
            },
            {
              elements = {
                "repl",
                "console",
              },
              size = 10,
              position = "bottom",
            },
          },
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
    },
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
    })

    require("go").setup({
      dap_debug = true,
      dap_debug_gui = true,
      dap_debug_keymap = true,
      dap_debug_vt = true,
      dap_port = 38697,
    })

    addKeyMaps({
      -- Basic Go commands
      { "n", "<leader>gp", ":GoCodeLen<CR>", "Show code lens" },
      { "n", "<leader>gm", ":GoGet -u<CR>", "Go get package updates" },
      { "n", "<leader>Gi", ":GoToggleInlay<CR>", "Toggle inlay hints" },

      -- Debug controls
      { "n", "<leader>db", ":GoBreakToggle<CR>", "Toggle breakpoint" },
      { "n", "<leader>dbc", ":BreakCondition ", "Add conditional breakpoint" },
      { "n", "<leader>dT", ":GoDebug -t<CR>", "Debug test file" },
      { "n", "<leader>dt", ":GoDebug<CR>", "Start debug session" },
      { "n", "<leader>dn", ":GoDebug -n<CR>", "Debug nearest test" },
      { "n", "<leader>dr", ":GoDebug -R<CR>", "Restart debug session" },
      { "n", "<leader>dp", ":GoDebug -p<CR>", "Debug package tests" },
      { "n", "<leader>ds", ":GoDebug -s<CR>", "Stop debug session" },
      { "n", "<leader>dk", ":GoDbgKeys<CR>", "Show debug keymaps" },
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
}
-- go install github.com/go-delve/delve/cmd/dlv@latest
