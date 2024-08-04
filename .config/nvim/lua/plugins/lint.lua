return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "pylint" },
		}

		lint.linters.eslint_d = {
			cmd = "eslint_d",
			name = "eslint_d",
			args = {
				"--format",
				"json",
				"--stdin",
				"--stdin-filename",
				function(_, bufnr)
					return vim.api.nvim_buf_get_name(bufnr)
				end,
			},
			parser = function(output, _)
				local diagnostics = {}
				if output and output ~= "" then
					local decoded = vim.json.decode(output)
					if decoded and decoded[1] and decoded[1].messages then
						for _, message in ipairs(decoded[1].messages) do
							table.insert(diagnostics, {
								source = "eslint",
								lnum = message.line - 1,
								col = message.column - 1,
								end_lnum = message.endLine and (message.endLine - 1) or nil,
								end_col = message.endColumn and (message.endColumn - 1) or nil,
								severity = message.severity == 2 and vim.diagnostic.severity.ERROR
									or vim.diagnostic.severity.WARN,
								message = message.message,
								code = message.ruleId,
							})
						end
					end
				end
				return diagnostics
			end,
			stream = "both",
		}

		-- Set up autocommands for linting
		local lint_augroup = vim.api.nvim_create_augroup("Linting", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Keymapping to manually trigger linting
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
