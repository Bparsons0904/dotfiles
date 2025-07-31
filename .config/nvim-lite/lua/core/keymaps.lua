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

  -- General
  { "n", "<leader>a", "ggVG", "Select entire file" },
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
  { "n", "<leader>bb", ":bprevious<CR>", "Go to previous buffer" },
  { "n", "<leader>bn", ":bnext<CR>", "Go to next buffer" },
  { "n", "<leader><leader>", "<C-^>", "Toggle between two most recent buffers" },
  { "n", "<leader>fb", ":ls<CR>:b<Space>", "List buffers and switch" },

  -- File Management (Built-in alternatives to Telescope)
  { "n", "<leader>fe", ":Explore<CR>", "Open file explorer (netrw)" },
  { "n", "<leader>ff", ":find<Space>", "Find file by name" },
  { "n", "<leader>fr", ":oldfiles<CR>", "Show recent files" },
  { "n", "<leader>fo", ":e<Space>", "Open/edit file" },

  -- Search (Built-in alternatives)
  { "n", "<leader>fg", ":vimgrep<Space>", "Grep search in files" },
  { "n", "<leader>fq", ":copen<CR>", "Open quickfix list" },
  { "n", "<leader>fn", ":cnext<CR>", "Next quickfix item" },
  { "n", "<leader>fp", ":cprev<CR>", "Previous quickfix item" },

  -- Windows
  { "n", "<C-h>", "<C-w>h", "Move to left split" },
  { "n", "<C-j>", "<C-w>j", "Move to below split" },
  { "n", "<C-k>", "<C-w>k", "Move to above split" },
  { "n", "<C-l>", "<C-w>l", "Move to right split" },

  -- LSP Inlay Hints (Global toggle)
  { "n", "<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, "Toggle Inlay Hints" },
}

addKeyMaps(keymaps)