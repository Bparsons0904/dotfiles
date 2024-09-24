return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		enabled = false,
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "]]",
						refresh = "gr",
						open = "<M-n>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = false,
					auto_trigger = false,
					hide_during_completion = false,
					debounce = 75,
					keymap = {
						accept = "<C-l>",
						accept_word = false,
						accept_line = false,
						next = "<C-i>",
						prev = "<C-u>",
						dismiss = "<C-p>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		enabled = false,
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		enabled = false,
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = true,
		},
		config = function()
			require("CopilotChat").setup()
		end,
		addToKeyMap("n", "<leader>ct", "<cmd>CopilotChatToggle<CR>", "Toggle Copilot"),
		addToKeyMap("n", "<leader>co", "<cmd>CopilotChatOpen<CR>", "Open Copilot"),
		addToKeyMap("n", "<leader>cc", "<cmd>CopilotChatClose<CR>", "Close Copilot"),
		addToKeyMap("n", "<leader>cr", "<cmd>CopilotChatReset<CR>", "Reset Copilot"),
		addToKeyMap("n", "<leader>ce", "<cmd>CopilotChatExplain<CR>", "Explain Code"),
		addToKeyMap("n", "<leader>cf", "<cmd>CopilotChatFix<CR>", "Fix Selected Code"),
		addToKeyMap("n", "<leader>cv", "<cmd>CopilotChatOptimize<CR>", "Optimize Selected Code"),
		addToKeyMap("n", "<leader>cd", "<cmd>CopilotChatDocs<CR>", "Add comments to selected code"),
		addToKeyMap("n", "<leader>cu", "<cmd>CopilotChatTests<CR>", "Write unit tests for selected code"),
		addToKeyMap("n", "<leader>cg", "<cmd>CopilotChatDiagnostic<CR>", "Toggle CopilotChatToggle window"),
	},
}
