return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install("go")
  end,
  config = function()
    require("dbee").setup({
      sources = {
        require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
      },
    })
  end,

  addKeyMaps({
    {
      "n",
      "<leader>do",
      function()
        require("dbee").open()
      end,
      "Open dbee",
    },
    {
      "n",
      "<leader>dc",
      function()
        require("dbee").close()
      end,
      "Close dbee",
    },
  }),
}
