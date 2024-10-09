return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier", "yamlfmt" },
				dockerfile = { "dockfmt" },
				markdown = { "prettier" },
				-- templ = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				-- go = { "golines" },
				go = { "gofumpt", "goimports", "golines" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		local templ_format = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local filename = vim.api.nvim_buf_get_name(bufnr)
			local cmd = "templ fmt " .. vim.fn.shellescape(filename)

			vim.fn.jobstart(cmd, {
				on_exit = function()
					-- Reload the buffer only if it's still the current buffer
					if vim.api.nvim_get_current_buf() == bufnr then
						vim.cmd("e!")
					end
				end,
			})
		end

		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = { "*.templ" },
			callback = templ_format,
			-- callback = function()
			-- 	vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
			-- end,
		})

		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = { "*.tsx" },
			callback = function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
		})
	end,
}
