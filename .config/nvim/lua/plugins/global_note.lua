return {
  "backdround/global-note.nvim",
  config = function()
    local global_note = require("global-note")
    global_note.setup()
    addToKeyMap("n", "<leader>gn", global_note.toggle_note, "Global Note Toggle")
  end,
}
