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
      python = { "ruff" },
      go = { "golangcilint" },
    }

    -- Custom parser for golangci-lint JSON output
    local function golangci_lint_parser(output, _)
      if output == "" then
        return {}
      end

      local diagnostics = {}
      local decoded = vim.json.decode(output)

      if type(decoded) ~= "table" or not decoded.Issues then
        return {}
      end

      for _, issue in ipairs(decoded.Issues) do
        local severity = vim.diagnostic.severity.WARN
        if issue.Severity == "error" then
          severity = vim.diagnostic.severity.ERROR
        elseif issue.Severity == "info" then
          severity = vim.diagnostic.severity.INFO
        elseif issue.Severity == "hint" then
          severity = vim.diagnostic.severity.HINT
        end

        table.insert(diagnostics, {
          source = "golangci-lint",
          lnum = issue.Pos.Line - 1,
          col = issue.Pos.Column - 1,
          end_lnum = issue.Pos.Line - 1, -- golangci-lint might not provide end positions
          end_col = issue.Pos.Column, -- approximating end column
          severity = severity,
          message = issue.Text,
          code = issue.FromLinter,
        })
      end

      return diagnostics
    end

    lint.linters.golangcilint = {
      cmd = "golangci-lint",
      args = {
        "run",
        "--output.json.path",
        "stdout",
        function(_, bufnr)
          return { vim.api.nvim_buf_get_name(bufnr) }
        end,
      },
      stdin = false,
      append_fname = false,
      parser = golangci_lint_parser,
      stream = "stdout",
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
          if bufnr == nil or not vim.api.nvim_buf_is_loaded(bufnr) then
            return ""
          end
          return vim.api.nvim_buf_get_name(bufnr)
        end,
      },
      stdin = true,
      stream = "both",
      ignore_exitcode = true,
      parser = function(output, bufnr)
        local diagnostics = {}
        if output == "" then
          return diagnostics
        end
        
        local json_start = output:find("%[")
        if not json_start then
          return diagnostics
        end
        
        local json_output = output:sub(json_start)
        local ok, decoded = pcall(vim.json.decode, json_output)
        if not ok or not decoded or not decoded[1] or not decoded[1].messages then
          return diagnostics
        end
        
        for _, message in ipairs(decoded[1].messages) do
          local severity = vim.diagnostic.severity.WARN
          if message.severity == 2 then
            severity = vim.diagnostic.severity.ERROR
          elseif message.severity == 1 then
            severity = vim.diagnostic.severity.WARN
          end
          
          table.insert(diagnostics, {
            source = "eslint_d",
            lnum = (message.line or 1) - 1,
            col = (message.column or 1) - 1,
            end_lnum = message.endLine and (message.endLine - 1) or nil,
            end_col = message.endColumn and (message.endColumn - 1) or nil,
            severity = severity,
            message = message.message or "ESLint error",
            code = message.ruleId,
            user_data = {
              lsp = {
                code = message.ruleId,
              },
            },
          })
        end
        
        return diagnostics
      end,
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    addKeyMaps({
      { "n", "<leader>ll", function() lint.try_lint() end, "Trigger linting for current file" },
      { "n", "<leader>lL", function() 
        local filetype = vim.bo.filetype
        local js_ts_filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" } 
        if vim.tbl_contains(js_ts_filetypes, filetype) then
          lint.try_lint("eslint_d")
        else
          lint.try_lint()
        end
      end, "Trigger ESLint linting" },
    })
  end,
}
