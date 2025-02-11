return {
  "mluders/comfy-line-numbers.nvim",
  enabled = true,
  config = function()
    require("comfy-line-numbers").setup({
      hidden_buffer_types = {
        "terminal",
        "telescope",
        "prompt",
        "popup",
        "nofile",
      },
      hidden_file_types = {
        "TelescopeResults",
        "TelescopePrompt",
        "TelescopePreview",
        "telescope",
        "Telescope",
      },
    })
  end,
}
