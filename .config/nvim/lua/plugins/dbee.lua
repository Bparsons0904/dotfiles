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
        require("dbee.sources").MemorySource:new({
          {
            name = "Waugze Dev",
            type = "postgres",
            url = 'postgres://waugzee_dev_user:{{ env "DB_PASSWORD" }}@192.168.86.203:5432/waugzee_dev?sslmode=disable',
          },
        }),
      },
    })
  end,
}
