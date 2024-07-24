vim.g.mapleader = " "

function _G.addToKeyMap(mode, key, cmd, desc)
	vim.keymap.set(mode, key, cmd, { noremap = true, silent = true, desc = desc })
end

function _G.addKeys(keymaps)
	for _, maps in pairs(keymaps) do
		addToKeyMap(unpack(maps))
	end
end

local keymaps = {
	-- File Operations
	{ "n", "<leader>w", ":w<CR>", "Save file" },
	{ "n", "<leader>q", ":wqa<CR>", "Save all, quit all and exit" },

	-- General
	{ "i", "jk", "<ESC>", "Exit insert mode with jk" },
	{ "i", "kj", "<ESC>", "Exit insert mode with kj" },
	{ "n", "<C-a>", "ggVG", "Select entire file" },
	{ "n", "<leader>h", ":nohl<CR>", "Clear search highlights" },
	{ "n", "<leader>+", "<C-a>", "Increment number" },
	{ "n", "<leader>-", "<C-x>", "Decrement number" },
	{ "v", "<", "<gv", "Better indenting (decrease)" },
	{ "v", ">", ">gv", "Better indenting (increase)" },
	{ "n", "<leader>tt", ":terminal<CR>", "Open terminal" },
	{ "n", "<leader>lm", ":Mason<CR>", "Open Mason" },
	{ "n", "<leader>li", ":LspInfo<CR>", "Open Mason" },

	-- Scrolling and Centering
	{ "n", "<C-u>", "<C-u>zz", "Scroll up and center cursor" },
	{ "n", "<C-d>", "<C-d>zz", "Scroll down and center cursor" },
	{ "n", "<C-b>", "<C-b>zz", "Page up and center cursor" },
	{ "n", "<C-f>", "<C-f>zz", "Page down and center cursor" },
	{ "n", "n", "nzzzv", "Next search result and center cursor" },
	{ "n", "N", "Nzzzv", "Previous search result and center cursor" },
	{ "n", "J", "mzJ`z", "Join line below to current and center cursor" },
	{ "n", "G", "Gzz", "Go to end of file and center cursor" },
	{ "n", "gg", "ggzz", "Go to beginning of file and center cursor" },

	-- Buffers
	{ "n", "<leader>x", ":bd<CR>", "Close the current buffer" },
	{ "n", "<leader>bc", ":bd<CR>", "Close the current buffer" },
	{ "n", "<leader>bb", ":bprevious<CR>", "Go to previous buffer" },
	{ "n", "<leader>bn", ":bnext<CR>", "Go to next buffer" },
	{ "n", "<leader>ba", ":%bd|e#|bd#<CR>", "Close all buffers except current" },
	{ "n", "<leader>bl", ":ls<CR>", "List all buffers" },
	{ "n", "<leader>bx", ":bufdo bdelete<CR>", "Close all buffers" },
	{ "n", "<leader>bd", ":bp|bd #<CR>", "Delete buffer without closing window" },
	{ "n", "<leader>b1", "1gt", "Go to buffer 1" },
	{ "n", "<leader>b2", "2gt", "Go to buffer 2" },
	{ "n", "<leader>b3", "3gt", "Go to buffer 3" },
	{ "n", "<leader>b4", "4gt", "Go to buffer 4" },
	{ "n", "<leader>b5", "5gt", "Go to buffer 5" },
	{ "n", "<leader><leader>", "<C-^>", "Toggle between two most recent buffers" },

	-- Windows
	{ "n", "<C-h>", "<C-w>h", "Move to left split" },
	{ "n", "<C-j>", "<C-w>j", "Move to below split" },
	{ "n", "<C-k>", "<C-w>k", "Move to above split" },
	{ "n", "<C-l>", "<C-w>l", "Move to right split" },
	{ "n", "<leader>pv", "<C-w>v", "Split window vertically" },
	{ "n", "<leader>ph", "<C-w>s", "Split window horizontally" },
	{ "n", "<leader>pe", "<C-w>=", "Make splits equal size" },
	{ "n", "<leader>pc", "<cmd>close<CR>", "Close current split" },
	{ "n", "<leader>pp", ":vertical resize +5<CR>", "Increase window size" },
	{ "n", "<leader>pn", ":vertical resize -5<CR>", "Increase window size" },
	{ "n", "<leader>pP", ":vertical resize +15<CR>", "Increase window size" },
	{ "n", "<leader>pN", ":vertical resize -15<CR>", "Increase window size" },

	-- Tabs
	{ "n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab" },
	{ "n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab" },
	{ "n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab" },
	{ "n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab" },
	{ "n", "<leader>tf", "<cmd>tabnew %<CR>", "Open current buffer in new tab" },
}

addKeys(keymaps)
