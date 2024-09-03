return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local transparent = true -- Set to true if you would like to enable transparency

    -- Catppuccin colors
    local bg = "#1e1e2e" -- Background color
    local bg_dark = "#11111b" -- Darker background color
    local bg_highlight = "#2a273f" -- Highlight background color
    local bg_search = "#f5a97f" -- Search background color
    local bg_visual = "#3e2a5f" -- Visual selection background color
    local fg = "#e0def4" -- Foreground color
    local fg_dark = "#c6c6d4" -- Darker foreground color
    local fg_gutter = "#a6a6b2" -- Gutter foreground color
    local border = "#54546d" -- Border color

    require("catppuccin").setup({
      flavour = "mocha", -- Choose from 'latte', 'frappe', 'macchiato', 'mocha'
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = transparent,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        bg = bg,
        bg_dark = bg_dark,
        bg_highlight = bg_highlight,
        bg_search = bg_search,
        bg_visual = bg_visual,
        fg = fg,
        fg_dark = fg_dark,
        fg_gutter = fg_gutter,
        border = border,
      },
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
