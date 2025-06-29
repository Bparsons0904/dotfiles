return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      mode_bg = "#9d7cd8", -- Mode background (purple from LunarVim)
      mode_fg = "#1a1b26", -- Mode text (dark background)
      info_bg = "#3e4452", -- Info section background (darker gray)
      info_fg = "#c8ccd4", -- Info section text (light gray)
      main_bg = "#1e2030", -- Main background (dark background from LunarVim)
      main_fg = "#c8ccd4", -- Main text (light text)
      insert_bg = "#41a7fc", -- Insert mode (LunarVim blue)
      visual_bg = "#89ddff", -- Visual mode (LunarVim cyan)
      replace_bg = "#f7768e", -- Replace mode (soft red)
      command_bg = "#7dcfff", -- Command mode (light blue)
      normal_bg = "#7aa2f7", -- Normal mode (medium blue)
      modified_fg = "#1a1b26", -- Modified text color (dark)
      modified_bg = "#2ac278", -- Modified background (emerald green from your theme)
    }

    local function center_modified()
      if vim.bo.modified then
        return "UNSAVED"
      end
      return ""
    end

    local theme = {
      normal = {
        a = { fg = colors.mode_fg, bg = colors.normal_bg, bold = true },
        b = { fg = colors.info_fg, bg = colors.info_bg },
        c = { fg = colors.main_fg, bg = colors.main_bg },
      },
      insert = {
        a = { fg = colors.mode_fg, bg = colors.insert_bg, bold = true },
        b = { fg = colors.info_fg, bg = colors.info_bg },
      },
      visual = {
        a = { fg = colors.mode_fg, bg = colors.visual_bg, bold = true },
        b = { fg = colors.info_fg, bg = colors.info_bg },
      },
      replace = {
        a = { fg = colors.mode_fg, bg = colors.replace_bg, bold = true },
        b = { fg = colors.info_fg, bg = colors.info_bg },
      },
      command = {
        a = { fg = colors.mode_fg, bg = colors.command_bg, bold = true },
        b = { fg = colors.info_fg, bg = colors.info_bg },
      },
      inactive = {
        a = { fg = colors.info_fg, bg = colors.main_bg },
        b = { fg = colors.info_fg, bg = colors.main_bg },
        c = { fg = colors.main_fg, bg = colors.main_bg },
      },
    }

    require("lualine").setup({
      options = {
        theme = theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = {
          "filename",
          {
            require("git-drift").status,
            cond = function()
              return vim.b.gitsigns_head ~= nil
            end,
          },
          "branch",
          "diagnostics",
        },
        lualine_c = {
          {
            function()
              return "%="
            end, -- Left align padding
          },
          {
            center_modified,
            color = { fg = colors.modified_fg, bg = colors.modified_bg },
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
            cond = function()
              return vim.bo.modified
            end,
          },
          {
            function()
              return "%="
            end, -- Right align padding
          },
        },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
