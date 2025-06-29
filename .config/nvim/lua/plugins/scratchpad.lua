return {
  "athar-qadri/scratchpad.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local scratchpad = require("scratchpad")
    scratchpad:setup({ settings = { sync_on_ui_close = true } })
  end,

  addKeyMaps({
    {
      "n",
      "<leader>na",
      function()
        local scratchpad = require("scratchpad")
        scratchpad.ui:sync()
      end,
      "Push selection / current line to scratchpad",
    },
    {
      "n",
      "<leader>no",
      function()
        local scratchpad = require("scratchpad")
        scratchpad.ui:new_scratchpad()
      end,
      "show scratch pad",
    },
  }),
}
