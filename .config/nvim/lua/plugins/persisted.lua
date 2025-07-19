return {
  "olimorris/persisted.nvim",
  lazy = false,
  config = function()
    require("persisted").setup({
      save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- Directory to save sessions
      silent = false, -- Show messages when saving/loading sessions
      use_git_branch = true, -- Create separate sessions for different git branches
      autosave = true, -- Automatically save session when exiting
      autoload = true, -- Automatically load session when starting Neovim
      on_autoload_no_session = function()
        vim.notify("No existing session found for this directory", vim.log.levels.INFO)
      end,
      should_autosave = function()
        -- Don't autosave for certain conditions
        if vim.bo.filetype == "alpha" then
          return false
        end
        if vim.bo.filetype == "gitcommit" then
          return false
        end
        if vim.bo.filetype == "gitrebase" then
          return false
        end
        return true
      end,
      before_save = function()
        -- Close floating windows before saving
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local config = vim.api.nvim_win_get_config(win)
          if config.relative ~= "" then
            vim.api.nvim_win_close(win, false)
          end
        end

        -- Close certain buffer types
        local excluded_filetypes = { "neo-tree", "trouble", "notify" }
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(buf) then
            local ft = vim.bo[buf].filetype
            if vim.tbl_contains(excluded_filetypes, ft) then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end
      end,
      after_load = function()
        vim.notify("Session loaded successfully", vim.log.levels.INFO)
      end,
      telescope = {
        reset_prompt_after_deletion = true, -- Reset telescope prompt after deleting session
      },
    })

    -- Add keymaps for session management
    addKeyMaps({
      {
        "n",
        "<leader>ss",
        function()
          require("persisted").save()
        end,
        "Save session",
      },
      {
        "n",
        "<leader>sl",
        function()
          require("persisted").load()
        end,
        "Load session for current directory",
      },
      {
        "n",
        "<leader>sd",
        function()
          require("persisted").delete()
        end,
        "Delete current session",
      },
      {
        "n",
        "<leader>sS",
        function()
          require("persisted").stop()
        end,
        "Stop current session",
      },
      { "n", "<leader>st", ":Telescope persisted<CR>", "Find sessions" },
    })
  end,
}
