-- My best attempt
local purple_base = {
  -- Core UI Elements
  deadstyle_color10 = "#0D1116", -- Eerie black - Main background
  deadstyle_color14 = "#ebfafa", -- Azure white - Main text color
  deadstyle_color13 = "#1A222B", -- Charcoal blue - CursorLine background, darker background elements
  deadstyle_color17 = "#141b22", -- Gunmetal - Alternative background
  deadstyle_color07 = "#1c242f", -- Dark slate gray - Another background variant

  -- Syntax Highlighting
  deadstyle_color01 = "#7b68ee", -- Medium slate blue - Pink/magenta elements, used for special keywords
  deadstyle_color02 = "#2ac278", -- Emerald green - Used for strings and git additions
  deadstyle_color03 = "#1a8cff", -- Bright blue - Used for functions and git changes
  deadstyle_color04 = "#949ae5", -- Periwinkle - Used for variables and purple accents
  deadstyle_color05 = "#19dfcf", -- Bright turquoise - Used for special highlights
  deadstyle_color06 = "#1682ef", -- Dodger blue - Used for preprocessor directives

  -- UI Accents
  deadstyle_color08 = "#f16c75", -- Light coral - Used for errors and warnings
  deadstyle_color09 = "#a5afc2", -- Cadet blue - Used for comments
  deadstyle_color11 = "#f16c75", -- Light coral - Used for deletion highlights and errors
  deadstyle_color12 = "#f1fc79", -- Lemon yellow - Used for search highlights
  deadstyle_color15 = "#013e4a", -- Midnight green - Used for darker accents
  deadstyle_color16 = "#6c7a89", -- Slate gray - Used for selection highlights
}

-- Improved color cordination
local cordinated_purple = {
  deadstyle_color01 = "#8a77fa", -- Slightly brighter medium slate blue for better visibility
  deadstyle_color02 = "#32d686", -- Slightly lighter emerald green for better contrast
  deadstyle_color03 = "#1a8cff", -- Bright blue (unchanged)
  deadstyle_color04 = "#a1a7e8", -- Slightly darker periwinkle for better distinction
  deadstyle_color05 = "#20e6d6", -- Slightly brighter turquoise
  deadstyle_color06 = "#2b8ff4", -- Slightly lighter dodger blue
  deadstyle_color07 = "#1c242f", -- Dark slate gray (unchanged)
  deadstyle_color08 = "#6ab1f5", -- Slightly darker cornflower blue
  deadstyle_color09 = "#b0b9cc", -- Slightly lighter cadet blue for better readability
  deadstyle_color10 = "#0b0e12", -- Slightly darker eerie black for more contrast
  deadstyle_color11 = "#f47a82", -- Slightly brighter light coral
  deadstyle_color12 = "#f3fd8c", -- Slightly darker lemon yellow for better visibility
  deadstyle_color13 = "#3a4c62", -- Slightly lighter charcoal blue
  deadstyle_color14 = "#f0fcfc", -- Slightly cooler azure white
  deadstyle_color15 = "#024858", -- Slightly lighter midnight green
  deadstyle_color16 = "#edbffd", -- Slightly darker pale lilac
  deadstyle_color17 = "#18222b", -- Slightly lighter gunmetal
}

-- Crazy
local crazy = {
  deadstyle_color01 = "#FF6B6B", -- Vibrant coral
  deadstyle_color02 = "#4ECDC4", -- Bright mint
  deadstyle_color03 = "#45B7D1", -- Electric blue
  deadstyle_color04 = "#F9DB6D", -- Marigold yellow
  deadstyle_color05 = "#FF8C42", -- Tangerine
  deadstyle_color06 = "#98FB98", -- Pale green
  deadstyle_color07 = "#2F4858", -- Deep space blue (background)
  deadstyle_color08 = "#FF69B4", -- Hot pink
  deadstyle_color09 = "#D3D3D3", -- Light gray
  deadstyle_color10 = "#1B2631", -- Dark blue-gray (darker background)
  deadstyle_color11 = "#FF355E", -- Radical red
  deadstyle_color12 = "#FDFD96", -- Pastel yellow
  deadstyle_color13 = "#36454F", -- Charcoal
  deadstyle_color14 = "#F0FFF0", -- Honeydew
  deadstyle_color15 = "#008080", -- Teal
  deadstyle_color16 = "#DDA0DD", -- Plum
  deadstyle_color17 = "#23283E", -- Navy blue (alternative background)
}

-- Muted Crazy
local muted_crazy = {
  deadstyle_color01 = "#E15A5A", -- Muted coral
  deadstyle_color02 = "#45B1A8", -- Softer mint
  deadstyle_color03 = "#3E9CB3", -- Calmer electric blue
  deadstyle_color04 = "#E5C95F", -- Softer marigold yellow
  deadstyle_color05 = "#E67E3B", -- Muted tangerine
  deadstyle_color06 = "#7DE17D", -- Softer pale green
  deadstyle_color07 = "#2A3E4A", -- Deeper space blue (background)
  deadstyle_color08 = "#E15A97", -- Softer hot pink
  deadstyle_color09 = "#C0C0C0", -- Slightly darker light gray
  deadstyle_color10 = "#1A242E", -- Slightly lighter dark blue-gray (darker background)
  deadstyle_color11 = "#E13046", -- Toned down radical red
  deadstyle_color12 = "#E5E581", -- Muted pastel yellow
  deadstyle_color13 = "#2F3D45", -- Lighter charcoal
  deadstyle_color14 = "#E5F5E5", -- Slightly muted honeydew
  deadstyle_color15 = "#007070", -- Darker teal
  deadstyle_color16 = "#C48EC4", -- Muted plum
  deadstyle_color17 = "#202537", -- Lighter navy blue (alternative background)
}
local blue_crazy = {
  deadstyle_color01 = "#7B68EE", -- Medium slate blue (new)
  deadstyle_color02 = "#45B1A8", -- Softer mint (unchanged)
  deadstyle_color03 = "#3E9CB3", -- Calmer electric blue (unchanged)
  deadstyle_color04 = "#9A9AFF", -- Light periwinkle (new)
  deadstyle_color05 = "#E67E3B", -- Muted tangerine (unchanged)
  deadstyle_color06 = "#7DE17D", -- Softer pale green (unchanged)
  deadstyle_color07 = "#2A3C4D", -- Deeper space blue (adjusted)
  deadstyle_color08 = "#DA70D6", -- Orchid (new)
  deadstyle_color09 = "#D3D3D3", -- Light gray (unchanged)
  deadstyle_color10 = "#1B2631", -- Dark blue-gray (unchanged)
  deadstyle_color11 = "#E15A5A", -- Muted coral (moved from color01)
  deadstyle_color12 = "#E5C95F", -- Softer marigold yellow (moved from color04)
  deadstyle_color13 = "#2F3D45", -- Lighter charcoal (unchanged)
  deadstyle_color14 = "#E5F5E5", -- Slightly muted honeydew (unchanged)
  deadstyle_color15 = "#5D3FD3", -- Purple blue (new)
  deadstyle_color16 = "#C48EC4", -- Muted plum (unchanged)
  deadstyle_color17 = "#202537", -- Lighter navy blue (unchanged)
}
local rubber_duck = {
  deadstyle_color01 = "#FFD700", -- Duck yellow (Golden yellow)
  deadstyle_color02 = "#FFA500", -- Orange beak
  deadstyle_color03 = "#1E90FF", -- Dodger blue (water)
  deadstyle_color04 = "#FFFF00", -- Bright yellow
  deadstyle_color05 = "#32CD32", -- Lime green (duck toy)
  deadstyle_color06 = "#FF69B4", -- Hot pink (rubber duck accessory)
  deadstyle_color07 = "#4B0082", -- Indigo (night sky for contrast)
  deadstyle_color08 = "#00CED1", -- Dark turquoise (pool tile)
  deadstyle_color09 = "#DCDCDC", -- Gainsboro (light grey for bubbles)
  deadstyle_color10 = "#1A1A1A", -- Eerie black (deep water/main background)
  deadstyle_color11 = "#FF4500", -- Orange-red (warning)
  deadstyle_color12 = "#FFD700", -- Another golden yellow (highlighting)
  deadstyle_color13 = "#3d3d3d", -- Royal blue (deeper water)
  deadstyle_color14 = "#FFFAFA", -- Snow (main text color)
  deadstyle_color15 = "#8B4513", -- Saddle brown (wooden rubber duck)
  deadstyle_color16 = "#7FFFD4", -- Aquamarine (bath bubbles)
  deadstyle_color17 = "#2F4F4F", -- Dark slate gray (alternative background)
}

local chiefs = {
  deadstyle_color01 = "#E31837", -- Chiefs Red
  deadstyle_color02 = "#FFB81C", -- Chiefs Gold
  deadstyle_color03 = "#FFFFFF", -- White
  deadstyle_color04 = "#FF4D4D", -- Lighter Red
  deadstyle_color05 = "#FFD700", -- Darker Gold
  deadstyle_color06 = "#C41E3A", -- Darker Red
  deadstyle_color07 = "#1C1C1C", -- Dark Background
  deadstyle_color08 = "#A9A9A9", -- Dark Gray
  deadstyle_color09 = "#D3D3D3", -- Light Gray
  deadstyle_color10 = "#141414", -- Darker Background
  deadstyle_color11 = "#FF6B6B", -- Soft Red (for warnings)
  deadstyle_color12 = "#FFE066", -- Soft Yellow (for search/highlights)
  deadstyle_color13 = "#2C2C2C", -- Slightly Lighter Background
  deadstyle_color14 = "#E8E8E8", -- Off-White (main text)
  deadstyle_color15 = "#B8860B", -- Dark Goldenrod
  deadstyle_color16 = "#CD5C5C", -- Indian Red
  deadstyle_color17 = "#242424", -- Alternative Background
}

local royals = {
  deadstyle_color01 = "#004687", -- Royals Blue
  deadstyle_color02 = "#BD9B60", -- Royals Gold
  deadstyle_color03 = "#FFFFFF", -- White
  deadstyle_color04 = "#7BB2DD", -- Powder Blue
  deadstyle_color05 = "#00A3E0", -- Light Blue
  deadstyle_color06 = "#003366", -- Darker Blue
  deadstyle_color07 = "#1C1C1C", -- Dark Background
  deadstyle_color08 = "#A9A9A9", -- Dark Gray
  deadstyle_color09 = "#D3D3D3", -- Light Gray
  deadstyle_color10 = "#141414", -- Darker Background
  deadstyle_color11 = "#FF6B6B", -- Soft Red (for warnings)
  deadstyle_color12 = "#E6F3FF", -- Very Light Blue (for search/highlights)
  deadstyle_color13 = "#2C2C2C", -- Slightly Lighter Background
  deadstyle_color14 = "#E8E8E8", -- Off-White (main text)
  deadstyle_color15 = "#4682B4", -- Steel Blue
  deadstyle_color16 = "#1E90FF", -- Dodger Blue
  deadstyle_color17 = "#242424", -- Alternative Background
}

local halloween = {
  deadstyle_color01 = "#FF6600", -- Pumpkin Orange
  deadstyle_color02 = "#B55EDF", -- Lighter Magenta (witch purple)
  deadstyle_color03 = "#00FF00", -- Lime Green (slime)
  deadstyle_color04 = "#FFA500", -- Orange
  deadstyle_color05 = "#9370DB", -- Medium Purple (mystical night sky)
  deadstyle_color06 = "#228B22", -- Forest Green
  deadstyle_color07 = "#1C1C1C", -- Almost Black (main background)
  deadstyle_color08 = "#CD853F", -- Peru (wooden texture)
  deadstyle_color09 = "#708090", -- Slate Gray (tombstone)
  deadstyle_color10 = "#000000", -- Black (alternative background)
  deadstyle_color11 = "#FF0000", -- Red (for warnings/blood)
  deadstyle_color12 = "#FFD700", -- Gold (candlelight)
  deadstyle_color13 = "#2F4F4F", -- Dark Slate Gray
  deadstyle_color14 = "#F8F8FF", -- Ghost White (main text)
  deadstyle_color15 = "#DA70D6", -- Orchid (lighter purple)
  deadstyle_color16 = "#FF4500", -- Orange Red
  deadstyle_color17 = "#191970", -- Midnight Blue
}

local blue = {
  deadstyle_color01 = "#4A90E2", -- Bright Blue (primary accent)
  deadstyle_color02 = "#b3b3b3", -- Dark white
  deadstyle_color03 = "#E67E22", -- Orange (for warnings/contrast)
  deadstyle_color04 = "#3498DB", -- Dodger Blue (lighter accent)
  deadstyle_color05 = "#1A7A5F", -- Green Sapphire (blue-green accent)
  -- deadstyle_color05 = "#2D7D9A",
  deadstyle_color06 = "#27AE60", -- Nephritis (green accent)
  deadstyle_color07 = "#141E30", -- Space Cadet (main background)
  deadstyle_color08 = "#34495E", -- Wet Asphalt (lighter background elements)
  deadstyle_color09 = "#7F8C8D", -- Asbestos (comments/secondary text)
  deadstyle_color10 = "#0C1421", -- Dark Midnight Blue (alternative background)
  deadstyle_color11 = "#E74C3C", -- Alizarin (error highlight)
  deadstyle_color12 = "#F1C40F", -- Sunflower (search highlight)
  deadstyle_color13 = "#2980B9", -- Belize Hole (another blue accent)
  deadstyle_color14 = "#ECF0F1", -- Clouds (main text color)
  deadstyle_color15 = "#8E44AD", -- Wisteria (purple accent)
  deadstyle_color16 = "#16A085", -- Green Sea (another green accent)
  deadstyle_color17 = "#1C2833", -- Dark Slate Gray (alternative dark background)
}

local royal_purple = {
  -- Core UI Elements
  deadstyle_color10 = "#0A0C15", -- Darker background for more contrast
  deadstyle_color14 = "#f0f2ff", -- Slightly warmer white text
  deadstyle_color13 = "#1d2741", -- Deeper blue-purple background
  deadstyle_color17 = "#111526", -- Richer gunmetal with purple undertones
  deadstyle_color07 = "#1A1E32", -- Deeper slate with purple hints
  -- Syntax Highlighting
  deadstyle_color01 = "#9370DB", -- Medium purple - softer on the eyes
  deadstyle_color02 = "#34D399", -- Slightly warmer emerald
  deadstyle_color03 = "#4785FF", -- Warmer bright blue
  deadstyle_color04 = "#B39DDB", -- Lighter periwinkle
  deadstyle_color05 = "#20B2AA", -- Slightly muted turquoise
  deadstyle_color06 = "#2196F3", -- Brighter blue for better contrast
  -- UI Accents
  deadstyle_color08 = "#FF6B6B", -- Warmer coral
  deadstyle_color09 = "#B0BEC5", -- Slightly warmer comments
  deadstyle_color11 = "#FF6B6B", -- Matching coral
  deadstyle_color12 = "#FFF59D", -- Softer yellow
  deadstyle_color15 = "#012F3D", -- Deeper midnight green
  deadstyle_color16 = "#78909C", -- Warmer slate gray
}

local twilight_purple = {
  -- Core UI Elements
  deadstyle_color10 = "#0E0E17", -- Neutral dark background
  deadstyle_color14 = "#E8EAFD", -- Slightly cooler white
  deadstyle_color13 = "#1B1B2B", -- Muted purple-gray background
  deadstyle_color17 = "#13131F", -- Darker muted background
  deadstyle_color07 = "#1D1D2D", -- Soft purple-gray
  -- Syntax Highlighting
  deadstyle_color01 = "#8B7BB3", -- Muted lavender
  deadstyle_color02 = "#7AC29E", -- Muted sage green
  deadstyle_color03 = "#7AA2F7", -- Softer blue
  deadstyle_color04 = "#A39EC4", -- Dusty periwinkle
  deadstyle_color05 = "#89B4BE", -- Muted teal
  deadstyle_color06 = "#7795C4", -- Muted blue
  -- UI Accents
  deadstyle_color08 = "#E06C75", -- Slightly muted coral
  deadstyle_color09 = "#9AA3B2", -- Softer comments
  deadstyle_color11 = "#E06C75", -- Matching coral
  deadstyle_color12 = "#E5E279", -- Muted yellow
  deadstyle_color15 = "#1A2A35", -- Warmer dark accent
  deadstyle_color16 = "#717C89", -- Darker slate gray
}

local function get_colors()
  local colors = {
    rubber_duck = rubber_duck,
    blue_crazy = blue_crazy,
    purple_base = purple_base,
    cordinated_purple = cordinated_purple,
    crazy = crazy,
    muted_crazy = muted_crazy,
    royals = royals,
    chiefs = chiefs,
    halloween = halloween,
  }

  local num_themes = 0
  for _ in pairs(colors) do
    num_themes = num_themes + 1
  end

  math.randomseed(os.time())

  local random_index = math.random(num_themes)

  local color_array = {}
  for _, v in pairs(colors) do
    table.insert(color_array, v)
  end

  return color_array[random_index]
end

-- local colors = get_colors()
local colors = royal_purple

return {
  "eldritch-theme/eldritch.nvim",
  lazy = true,
  name = "eldritch",
  opts = {
    on_colors = function(global_colors)
      local color_definitions = {
        bg = colors.deadstyle_color10,
        fg = colors.deadstyle_color14,
        selection = colors.deadstyle_color16,
        comment = colors.deadstyle_color09,
        red = colors.deadstyle_color08,
        orange = colors.deadstyle_color06,
        yellow = colors.deadstyle_color05,
        green = colors.deadstyle_color02,
        purple = colors.deadstyle_color04,
        cyan = colors.deadstyle_color03,
        pink = colors.deadstyle_color01,
        bright_red = colors.deadstyle_color08,
        bright_green = colors.deadstyle_color02,
        bright_yellow = colors.deadstyle_color05,
        bright_blue = colors.deadstyle_color04,
        bright_magenta = colors.deadstyle_color01,
        bright_cyan = colors.deadstyle_color03,
        bright_white = colors.deadstyle_color14,
        menu = colors.deadstyle_color10,
        visual = colors.deadstyle_color16,
        gutter_fg = colors.deadstyle_color16,
        nontext = colors.deadstyle_color16,
        white = colors.deadstyle_color14,
        black = colors.deadstyle_color10,
        git = {
          change = colors.deadstyle_color03,
          add = colors.deadstyle_color02,
          delete = colors.deadstyle_color11,
        },
        gitSigns = {
          change = colors.deadstyle_color03,
          add = colors.deadstyle_color02,
          delete = colors.deadstyle_color11,
        },
        bg_dark = colors.deadstyle_color13,
        bg_highlight = colors.deadstyle_color17,
        terminal_black = colors.deadstyle_color13,
        fg_dark = colors.deadstyle_color14,
        fg_gutter = colors.deadstyle_color13,
        dark3 = colors.deadstyle_color13,
        dark5 = colors.deadstyle_color13,
        bg_visual = colors.deadstyle_color16,
        dark_cyan = colors.deadstyle_color03,
        magenta = colors.deadstyle_color01,
        magenta2 = colors.deadstyle_color01,
        magenta3 = colors.deadstyle_color01,
        dark_yellow = colors.deadstyle_color05,
        dark_green = colors.deadstyle_color02,
      }

      for key, value in pairs(color_definitions) do
        global_colors[key] = value
      end
    end,

    on_highlights = function(highlights)
      local highlight_definitions = {
        DiffChange = { bg = colors.deadstyle_color02, fg = "black" },
        DiffDelete = { bg = colors.deadstyle_color01, fg = "black" },
        TelescopeResultsDiffDelete = { bg = colors.deadstyle_color01, fg = "black" },
        CursorLine = { bg = colors.deadstyle_color13 },
        ["@markup.strong"] = { fg = colors.deadstyle_color04, bold = true },
        SpellBad = { sp = colors.deadstyle_color11, undercurl = true, bold = true, italic = true },
        SpellCap = { sp = colors.deadstyle_color12, undercurl = true, bold = true, italic = true },
        SpellLocal = { sp = colors.deadstyle_color12, undercurl = true, bold = true, italic = true },
        SpellRare = { sp = colors.deadstyle_color04, undercurl = true, bold = true, italic = true },
        MiniDiffSignAdd = { fg = colors.deadstyle_color05, bold = true },
        MiniDiffSignChange = { fg = colors.deadstyle_color02, bold = true },
        RenderMarkdownCode = { bg = colors.deadstyle_color07 },
        TreesitterContext = { sp = colors.deadstyle_color10 },
        MiniFilesNormal = { sp = colors.deadstyle_color10 },
        MiniFilesBorder = { sp = colors.deadstyle_color10 },
        MiniFilesTitle = { sp = colors.deadstyle_color10 },
        MiniFilesTitleFocused = { sp = colors.deadstyle_color10 },
        NormalFloat = { bg = colors.deadstyle_color10 },
        FloatBorder = { bg = colors.deadstyle_color10 },
        FloatTitle = { bg = colors.deadstyle_color10 },
        MatchParen = {
          fg = colors.deadstyle_color12,
          bold = true,
        },
        NotifyBackground = { bg = colors.deadstyle_color10 },
        NeoTreeNormalNC = { bg = colors.deadstyle_color10 },
        NeoTreeNormal = { bg = colors.deadstyle_color10 },
        NvimTreeWinSeparator = { fg = colors.deadstyle_color10, bg = colors.linkarzu_color10 },
        NvimTreeNormalNC = { bg = colors.deadstyle_color10 },
        NvimTreeNormal = { bg = colors.deadstyle_color10 },
        TroubleNormal = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupBorder = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupTitle = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupBorderFilter = { bg = colors.deadstyle_color10 },
        NoiceCmdlineIconFilter = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupTitleFilter = { bg = colors.deadstyle_color10 },
        NoiceCmdlineIcon = { bg = colors.deadstyle_color10 },
        NoiceCmdlineIconCmdline = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupBorderCmdline = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupTitleCmdline = { bg = colors.deadstyle_color10 },
        NoiceCmdlineIconSearch = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupBorderSearch = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupTitleSearch = { bg = colors.deadstyle_color10 },
        NoiceCmdlineIconLua = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupBorderLua = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupTitleLua = { bg = colors.deadstyle_color10 },
        NoiceCmdlineIconHelp = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupBorderHelp = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupTitleHelp = { bg = colors.deadstyle_color10 },
        NoiceCmdlineIconInput = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupBorderInput = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupTitleInput = { bg = colors.deadstyle_color10 },
        NoiceCmdlineIconCalculator = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupBorderCalculator = { bg = colors.deadstyle_color10 },
        NoiceCmdlinePopupTitleCalculator = { bg = colors.deadstyle_color10 },
        NoiceCompletionItemKindDefault = { bg = colors.deadstyle_color10 },
        NoiceMini = { bg = colors.deadstyle_color10 },
        StatusLine = { bg = colors.deadstyle_color10 },
        Folded = { bg = colors.deadstyle_color10 },
        DiagnosticInfo = { fg = colors.deadstyle_color03 },
        DiagnosticHint = { fg = colors.deadstyle_color02 },
        DiagnosticWarn = { fg = colors.deadstyle_color08 },
        DiagnosticOk = { fg = colors.deadstyle_color04 },
        DiagnosticError = { fg = colors.deadstyle_color05 },
        RenderMarkdownQuote = { fg = colors.deadstyle_color12 },
        Visual = { bg = colors.deadstyle_color16, fg = colors.linkarzu_color10 },
        PreProc = { fg = colors.deadstyle_color06 },
        ["@operator"] = { fg = colors.deadstyle_color02 },
        KubectlHeader = { fg = colors.deadstyle_color04 },
        KubectlWarning = { fg = colors.deadstyle_color03 },
        KubectlError = { fg = colors.deadstyle_color01 },
        KubectlInfo = { fg = colors.deadstyle_color02 },
        KubectlDebug = { fg = colors.deadstyle_color05 },
        KubectlSuccess = { fg = colors.deadstyle_color02 },
        KubectlPending = { fg = colors.deadstyle_color03 },
        KubectlDeprecated = { fg = colors.deadstyle_color08 },
        KubectlExperimental = { fg = colors.deadstyle_color09 },
        KubectlNote = { fg = colors.deadstyle_color03 },
        KubectlGray = { fg = colors.deadstyle_color10 },
      }

      for group, props in pairs(highlight_definitions) do
        highlights[group] = props
      end
    end,
  },
}
