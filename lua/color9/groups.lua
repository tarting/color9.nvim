local groups = {}

local function get_base_colors(colors)
    -- default to light theme
    local base_colors = {
        bg1 = colors.light1,
        bg2 = colors.light2,
        bg3 = colors.light3,
        bg4 = colors.light4,
        bg_term = colors.white,
        gray = colors.dark3,
        fg1 = colors.black,
        fg2 = colors.dark1,
        light_dark = colors.light1,
        red = colors.red2,
        green = colors.green2,
        blue = colors.blue2,
        magenta = colors.magenta2,
        cyan = colors.cyan2,
        alt_red = colors.red1,
        alt_green = colors.green1,
        alt_blue = colors.blue1,
        alt_magenta = colors.magenta1,
        alt_cyan = colors.cyan1,
        gold = colors.gold,
        beige = colors.beige,
    }

    local dark_colors = {
        bg1 = colors.black,
        bg2 = colors.dark1,
        bg3 = colors.dark2,
        bg4 = colors.dark3,
        bg_term = colors.dark1,
        gray = colors.dark3,
        fg1 = colors.white,
        fg2 = colors.light1,
        light_dark = colors.light1,
        red = colors.red2,
        green = colors.green2,
        blue = colors.blue2,
        magenta = colors.magenta2,
        cyan = colors.cyan2,
        alt_red = colors.red3,
        alt_green = colors.green3,
        alt_blue = colors.blue3,
        alt_magenta = colors.magenta3,
        alt_cyan = colors.cyan3,
        gold = colors.gold,
        beige = colors.beige,
    }

    local bg = vim.o.background
    if bg == "dark" then
        base_colors = dark_colors
    end

    return base_colors
end


-- Set neovim terminal colors
local function set_terminal_colors(colors)
    vim.g.terminal_color_0 = colors.bg_term
    vim.g.terminal_color_8 = colors.gray
    vim.g.terminal_color_1 = colors.alt_red
    vim.g.terminal_color_9 = colors.red
    vim.g.terminal_color_2 = colors.alt_green
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_3 = colors.beige
    vim.g.terminal_color_11 = colors.gold
    vim.g.terminal_color_4 = colors.alt_blue
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_5 = colors.alt_magenta
    vim.g.terminal_color_13 = colors.magenta
    vim.g.terminal_color_6 = colors.alt_cyan
    vim.g.terminal_color_14 = colors.cyan
    vim.g.terminal_color_7 = colors.light_dark
    vim.g.terminal_color_15 = colors.fg
end

groups.reset = function()
    -- Clear all defaults
    local reset_groups = {
        Comment     = { fg = nil, bg = nil },
        Constant    = { fg = nil, bg = nil },
        Special     = { fg = nil, bg = nil },
        Identifier  = { fg = nil, bg = nil },
        Statement   = { fg = nil, bg = nil },
        PreProc     = { fg = nil, bg = nil },
        Type        = { fg = nil, bg = nil },
        Underlined  = { fg = nil, bg = nil },
        Ignore      = { fg = nil, bg = nil },
        Error       = { fg = nil, bg = nil },
        Todo        = { fg = nil, bg = nil },
        NonText     = { fg = nil, bg = nil },
        Directory   = { fg = nil, bg = nil },
        ErrorMsg    = { fg = nil, bg = nil },
        IncSearch   = { fg = nil, bg = nil },
        Search      = { fg = nil, bg = nil },
        MoreMsg     = { fg = nil, bg = nil },
        ModeMsg     = { fg = nil, bg = nil },
        LineNr      = { fg = nil, bg = nil },
        CursorLineN = { fg = nil, bg = nil },
        Question    = { fg = nil, bg = nil },
        StatusLine  = { fg = nil, bg = nil },
        StatusLineN = { fg = nil, bg = nil },
        VertSplit   = { fg = nil, bg = nil },
        Title       = { fg = nil, bg = nil },
        Visual      = { fg = nil, bg = nil },
        VisualNOS   = { fg = nil, bg = nil },
        WarningMsg  = { fg = nil, bg = nil },
        WildMenu    = { fg = nil, bg = nil },
        Folded      = { fg = nil, bg = nil },
        FoldColumn  = { fg = nil, bg = nil },
        DiffAdd     = { fg = nil, bg = nil },
        DiffChange  = { fg = nil, bg = nil },
        DiffDelete  = { fg = nil, bg = nil },
        DiffText    = { fg = nil, bg = nil },
        SignColumn  = { fg = nil, bg = nil },
        Conceal     = { fg = nil, bg = nil },
        SpellBad    = { fg = nil, bg = nil },
        SpellCap    = { fg = nil, bg = nil },
        SpellRare   = { fg = nil, bg = nil },
        SpellLocal  = { fg = nil, bg = nil },
        Pmenu       = { fg = nil, bg = nil },
        PmenuSel    = { fg = nil, bg = nil },
        PmenuSbar   = { fg = nil, bg = nil },
        PmenuThumb  = { fg = nil, bg = nil },
        TabLine     = { fg = nil, bg = nil },
        TabLineSel  = { fg = nil, bg = nil },
        TabLineFill = { fg = nil, bg = nil },
        CursorColum = { fg = nil, bg = nil },
        CursorLine  = { fg = nil, bg = nil },
        ColorColumn = { fg = nil, bg = nil },
        MatchParen  = { fg = nil, bg = nil },
    }
    return reset_groups
end



