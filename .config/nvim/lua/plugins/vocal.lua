-- Voice-to-text transcription using OpenAI Whisper
-- System dependencies:
--   Arch/paru: paru -S sox python-openai-whisper
--   Ubuntu/Pop!_OS:
--     1. Create python symlink: sudo ln -s /usr/bin/python3 /usr/bin/python
--     2. Install dependencies: nala install sox python3-pip
--     3. Install whisper: pip3 install openai-whisper
--     4. If import errors occur: pip3 install --upgrade openai-whisper numba coverage
-- First run will download whisper models to ~/whisper/
return {
  "kyza0d/vocal.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("vocal").setup({
      -- API key (string, table with command, or nil to use OPENAI_API_KEY env var)
      api_key = nil,

      -- Directory to save recordings
      recording_dir = os.getenv("HOME") .. "/recordings",

      -- Delete recordings after transcription
      delete_recordings = true,

      -- Keybinding to trigger :Vocal (set to nil to disable)
      keymap = "<leader>v",

      -- Local model configuration (set this to use local model instead of API)
      local_model = {
        model = "base", -- Model size: tiny, base, small, medium, large
        path = "~/whisper", -- Path to download and store models
      },

      -- API configuration (used only when local_model is not set)
      api = {
        model = "whisper-1",
        language = nil, -- Auto-detect language
        response_format = "json",
        temperature = 0,
        timeout = 60,
      },
    })
  end,

  addToKeyMap("n", "<leader>v", "<cmd>Vocal<cr>", "Toggle vocal speech to text"),
}
