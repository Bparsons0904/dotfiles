vim.g.mapleader = " "

function _G.addToKeyMap(mode, key, cmd, desc, opts)
  local options = vim.tbl_extend("force", { noremap = true, silent = true, desc = desc }, opts or {})
  vim.keymap.set(mode, key, cmd, options)
end

function _G.addKeyMaps(keymaps)
  for _, maps in pairs(keymaps) do
    local mode, key, cmd, desc, opts = unpack(maps)
    addToKeyMap(mode, key, cmd, desc, opts)
  end
end

local keymaps = {
  -- File Operations
  { "n", "<leader>ww", ":w<CR>", "Save file" },
  { "n", "<leader>wq", ":wqa<CR>", "Save and quit all" },
  --	{ "n", "<leader>q", ":wqa<CR>", "Save all, quit all and exit" },

  -- General
  { "n", "<leader>a", "ggVG", "Select entire file" },
  -- { "n", "<C-a>", "ggVG", "Select entire file" },
  { "n", "<leader>h", ":nohl<CR>", "Clear search highlights" },
  { "n", "<leader>+", "<C-a>", "Increment number" },
  { "n", "<leader>-", "<C-x>", "Decrement number" },
  { "v", "<", "<gv", "Better indenting (decrease)" },
  { "v", ">", ">gv", "Better indenting (increase)" },

  -- Scrolling and Centering
  { "n", "<C-u>", "<C-u>zz", "Scroll up and center cursor" },
  { "n", "<C-d>", "<C-d>zz", "Scroll down and center cursor" },
  { "n", "<C-b>", "<C-b>zz", "Page up and center cursor" },
  { "n", "<C-f>", "<C-f>zz", "Page down and center cursor" },
  { "n", "n", "nzzzv", "Next search result and center cursor" },
  { "n", "N", "Nzzzv", "Previous search result and center cursor" },

  -- Buffers
  -- { "n", "<leader>x", ":Bdelete<CR>", "Close the current buffer" },
  { "n", "<leader>bb", ":bprevious<CR>", "Go to previous buffer" },
  { "n", "<leader>bn", ":bnext<CR>", "Go to next buffer" },
  -- { "n", "<leader>ba", ":%bd|e#|bd#<CR>", "Close all buffers except current" },
  -- { "n", "<leader>bx", ":bufdo Bdelete<CR>", "Close all buffers" },
  { "n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", "Go to buffer 1" },
  { "n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", "Go to buffer 2" },
  { "n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", "Go to buffer 3" },
  { "n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", "Go to buffer 4" },
  { "n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", "Go to buffer 5" },
  { "n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", "Go to buffer 6" },
  { "n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", "Go to buffer 7" },
  { "n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", "Go to buffer 8" },
  { "n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", "Go to buffer 9" },
  { "n", "<leader>0", "<Cmd>BufferLineGoToBuffer 10<CR>", "Go to buffer 10" },
  { "n", "<leader><leader>", "<C-^>", "Toggle between two most recent buffers" },

  -- Windows
  { "n", "<C-h>", "<C-w>h", "Move to left split" },
  { "n", "<C-j>", "<C-w>j", "Move to below split" },
  { "n", "<C-k>", "<C-w>k", "Move to above split" },
  { "n", "<C-l>", "<C-w>l", "Move to right split" },
}

addKeyMaps(keymaps)
