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
		local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
		require("go").setup({
			lsp_inlay_hints = {
				enable = true,
				style = "inlay",
				only_current_line = false,
				only_current_line_autocmd = "CursorHold",
				show_variable_name = true,
				parameter_hints_prefix = "󰊕 ",
				show_parameter_hints = true,
				other_hints_prefix = "=> ",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 6,
				highlight = "Comment",
			},
			gofmt = "gofumpt",
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
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
