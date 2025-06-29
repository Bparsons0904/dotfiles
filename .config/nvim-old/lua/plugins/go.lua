return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		-- local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	pattern = "*.go",
		-- 	callback = function()
		-- 		-- require("go.format").goimports()
		-- 		require("go.format")
		-- 	end,
		-- 	group = format_sync_grp,
		-- })
		require("go").setup({
			-- lsp_cfg = false,
			-- linter = "golangci-lint",
			-- linter_flags = { "--fast" },
			-- tag_transform = "snakecase",
			-- tag_options = "json=omitempty",
			-- luasnip = true,
			-- gopher_map = true,
			-- test_runner = 'go',
			-- run_in_floaterm = true,
			-- test_efm = true, -- error format for quickfix
			-- test_template = '', -- default to testify if not set; vim.g.go_nvim_tests_template  = "testify"
			-- lsp_inlay_hints = {
			-- 	enable = true,
			-- 	style = "inlay",
			-- 	only_current_line = false,
			-- 	only_current_line_autocmd = "CursorHold",
			-- 	show_variable_name = true,
			-- 	parameter_hints_prefix = "󰊕 ",
			-- 	show_parameter_hints = true,
			-- 	other_hints_prefix = "=> ",
			-- 	max_len_align = false,
			-- 	max_len_align_padding = 1,
			-- 	right_align = false,
			-- 	right_align_padding = 6,
			-- 	highlight = "Comment",
			-- },
			-- gofmt = "gofumpt",
			-- on_save = {
			-- 	goline = true,
			-- },
		})

		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
		require("nvim-dap-virtual-text").setup({})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- require("go").setup({
		-- 	lsp_cfg = false,
		-- })
		-- local cfg = require("go.lsp").config()
		--
		-- require("lspconfig").gopls.setup(cfg)
		-- addKeys({
		-- 	{ "n", "<leader>ww", ":w<CR>", "Save file" },
		-- 	{ "n", "<leader>wq", ":wqa<CR>", "Save all, quit all and exit" },
		-- })
	end,

	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
	vim.api.nvim_set_keymap("n", "<leader>Gc", ":GoCodeLen<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>Gi", ":GoToggleInlay<CR>", { noremap = true, silent = true }),
}
