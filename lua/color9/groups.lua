local groups = {}

local function get_base_colors(colors)
	-- default to light theme
	local base_colors = {
		bg1 = colors.w1,
		bg2 = colors.w2,
		bg3 = colors.w3,
		bg4 = colors.w4,
		bg_term = colors.white,
		gray = colors.bk3,
		fg1 = colors.black,
		fg2 = colors.bk1,
		red = colors.r2,
		green = colors.g2,
		yellow = colors.y2,
		blue = colors.b2,
		magenta = colors.m2,
		cyan = colors.c2,
		orange = colors.o3,
		light_red = colors.r1,
		light_green = colors.g1,
		light_yellow = colors.y1,
		light_blue = colors.b1,
		light_magenta = colors.m1,
		light_cyan = colors.c1,
		light_orange = colors.o1,
		dark_red = colors.r3,
		dark_green = colors.g3,
		dark_yellow = colors.y3,
		dark_blue = colors.b3,
		dark_magenta = colors.m3,
		dark_cyan = colors.c3,
		dark_orange = colors.o5,
	}

	local dark_colors = {
		bg1 = colors.bk1,
		bg2 = colors.bk2,
		bg3 = colors.bk3,
		bg4 = colors.bk4,
		bg_term = colors.black,
		gray = colors.w3,
		fg1 = colors.w1,
		fg2 = colors.w2,
		red = colors.r2,
		green = colors.g2,
		yellow = colors.y2,
		blue = colors.b2,
		magenta = colors.m2,
		cyan = colors.c2,
		orange = colors.o3,
		light_red = colors.r1,
		light_green = colors.g1,
		light_yellow = colors.y1,
		light_blue = colors.b1,
		light_magenta = colors.m1,
		light_cyan = colors.c1,
		light_orange = colors.o1,
		dark_red = colors.r3,
		dark_green = colors.g3,
		dark_yellow = colors.y3,
		dark_blue = colors.b3,
		dark_magenta = colors.m3,
		dark_cyan = colors.c3,
		dark_orange = colors.o5,
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
	vim.g.terminal_color_0 = colors.dark_magenta
	vim.g.terminal_color_8 = colors.gray
	vim.g.terminal_color_1 = colors.dark_red
	vim.g.terminal_color_9 = colors.red
	vim.g.terminal_color_2 = colors.dark_green
	vim.g.terminal_color_10 = colors.green
	vim.g.terminal_color_3 = colors.yellow
	vim.g.terminal_color_11 = colors.dark_yellow
	vim.g.terminal_color_4 = colors.dark_blue
	vim.g.terminal_color_12 = colors.blue
	vim.g.terminal_color_5 = colors.dark_magenta
	vim.g.terminal_color_13 = colors.magenta
	vim.g.terminal_color_6 = colors.dark_cyan
	vim.g.terminal_color_14 = colors.cyan
	vim.g.terminal_color_7 = colors.light_dark
	vim.g.terminal_color_15 = colors.fg
end

groups.get_hi_groups = function()
	local palette = require("color9.palette")
	local c = get_base_colors(palette)
	set_terminal_colors(c)

	local hi_groups = {
		Normal = { fg = c.fg1, bg = c.bg1 },
		Visual = { fg = c.fg1, bg = c.bg2 },
		NonText = { fg = c.w3, bg = c.w3 },
		StatusLine = { fg = c.fg1, bg = c.light_cyan, bold = true, underline = true },
		StatusLineNC = { fg = c.fg1, bg = c.light_cyan, bold = false, underline = false },
		VertSplit = { fg = c.fg1, bg = c.light_cyan },
		LineNr = { fg = c.bg4, bg = c.light_yellow, bold = false },
		CursorLineNr = { fg = c.bg4, bg = c.light_yellow, bold = true },
		SignColumn = { link = "LineNr" },
		Folded = { fg = c.dark_yellow },
		FoldColumn = { fg = c.dark_yellow, bold = true },
		TabLine = { link = "StatusLineNC" },
		TabLineFill = { link = "StatusLineNC" },
		TabLineSel = { fg = c.bg1, bg = c.dark_magenta },

		Search = { link = "Visual" },
		IncSearch = { fg = c.fg1, bg = c.bg2, bold = true },

		WildMenu = { fg = c.bg1, bg = c.dark_magenta },
		Pmenu = { fg = c.dark_green, bg = c.light_green },
		PmenuSel = { fg = c.fg4, bg = c.green },
		PmenuSbar = { fg = c.light_green, bg = c.dark_green },
		PmenuThum = { fg = c.light_green, bg = c.fg4 },

		CursorColum = { bg = c.light_yellow },
		CursorLine = { link = "CursorColum" },

		ErrorMsg = { bold = true },
		ModeMsg = { bold = true },
		MoreMsg = { bold = true },
		WarningMsg = { bold = true },
		Directory = { bold = true },

		-- Minimal syntax highlighting
		Comment = { fg = c.dark_yellow, bold = true },
		Underlined = { underline = true },
		Title = { bold = true },

		SpellBad = { fg = c.dark_red, undercurl = true },
		SpellCap = { undercurl = true },
		SpellLocal = { undercurl = true },
		SpellRare = { undercurl = true },

		htmlBold = { bold = true },
		htmlItalic = { italic = true },

		Error = { fg = c.bg1, bg = c.dark_red },
		Todo = { fg = c.dark_magenta },
		todo = { fg = c.dark_magenta },

		-- Special        = { italic = true },
		MatchParen = { bg = c.bg3, bold = true },
		SpecialKey = { bold = true },
		Ignore = { bold = true },
		String = { fg = c.fg2, italic = true },

		helpHyperTextJump = { bold = true },
		helpHyperTextEntry = { bold = true },

		-- ColorColumn
		-- Cursor
		-- CursorIM

		-- VisualNOS
		-- Conceal
		-- EndOfBuffer

		DiffAdd = { fg = c.dark_green },
		DiffChange = { fg = c.dark_yellow },
		DiffDelete = { fg = c.dark_red },
		DiffText = { fg = c.gray },

		-- Orgmode
		OrgHeadlineLevel1 = { bold = true },
		OrgHeadlineLevel2 = { link = "Normal" },
		OrgHeadlineLevel3 = { link = "OrgHeadlineLevel2" },
		OrgHeadlineLevel4 = { link = "OrgHeadlineLevel3" },
		OrgHeadlineLevel5 = { link = "OrgHeadlineLevel4" },
		OrgHeadlineLevel6 = { link = "OrgHeadlineLevel5" },
		OrgHeadlineLevel7 = { link = "OrgHeadlineLevel6" },
		OrgHeadlineLevel8 = { link = "OrgHeadlineLevel7" },
		OrgHeadlineLevel9 = { link = "OrgHeadlineLevel8" },
		OrgHeadlineLevel10 = { link = "OrgHeadlineLevel9" },
		OrgHeadlineLevel11 = { link = "OrgHeadlineLevel10" },
		OrgHeadlineLevel12 = { link = "OrgHeadlineLevel11" },
		OrgHeadlineLevel13 = { link = "OrgHeadlineLevel12" },
		OrgHeadlineLevel14 = { link = "OrgHeadlineLevel13" },
		OrgHeadlineLevel15 = { link = "OrgHeadlineLevel14" },
		OrgHeadlineLevel16 = { link = "OrgHeadlineLevel15" },
		OrgHeadlineLevel17 = { link = "OrgHeadlineLevel16" },
		OrgHeadlineLevel18 = { link = "OrgHeadlineLevel17" },
		OrgHeadlineLevel19 = { link = "OrgHeadlineLevel18" },
		OrgHeadlineLevel20 = { link = "OrgHeadlineLevel19" },
		OrgHeadlineLevel21 = { link = "OrgHeadlineLevel20" },
		OrgHeadlineLevel22 = { link = "OrgHeadlineLevel21" },
		OrgHeadlineLevel23 = { link = "OrgHeadlineLevel22" },
		OrgHeadlineLevel24 = { link = "OrgHeadlineLevel23" },
		OrgHeadlineLevel25 = { link = "OrgHeadlineLevel24" },
		OrgHeadlineLevel26 = { link = "OrgHeadlineLevel25" },
		OrgHeadlineLevel27 = { link = "OrgHeadlineLevel26" },
		OrgHeadlineLevel28 = { link = "OrgHeadlineLevel27" },
		OrgHeadlineLevel29 = { link = "OrgHeadlineLevel28" },
		OrgHeadlineLevel30 = { link = "OrgHeadlineLevel29" },
		OrgHeadlineLevel31 = { link = "OrgHeadlineLevel30" },
		OrgHeadlineLevel32 = { link = "OrgHeadlineLevel31" },
		OrgHeadlineLevel33 = { link = "OrgHeadlineLevel32" },
		OrgHeadlineLevel34 = { link = "OrgHeadlineLevel33" },
		OrgHeadlineLevel35 = { link = "OrgHeadlineLevel34" },
		OrgHeadlineLevel36 = { link = "OrgHeadlineLevel35" },
		OrgHeadlineLevel37 = { link = "OrgHeadlineLevel36" },
		OrgHeadlineLevel38 = { link = "OrgHeadlineLevel37" },
		OrgHeadlineLevel39 = { link = "OrgHeadlineLevel38" },
		-- OrgEditSrcHighlight    = {  },
		-- OrgTSBlock             = {  },
		-- OrgTSBullet            = {  },
		-- OrgTSCheckbox          = {  },
		-- OrgTSComment           = {  },
		-- OrgTSDirective         = {  },
		-- OrgTSDrawer            = {  },
		-- OrgTSLatex             = {  },
		-- OrgTSPlan              = {  },
		-- OrgTSPropertyDrawer    = {  },
		-- OrgTSTag               = {  },
		OrgTSTimestampActive = { link = "org_timestamp" },
		OrgTSTimestampInactive = { link = "org_timestamp_inactive" },
		org_code = { fg = c.bg2 },
		org_hyperlink = { underline = true, italic = true },
		org_timestamp = { fg = c.dark_yellow },
		org_timestamp_inactive = { fg = c.yellow },
		org_verbatim = { link = "String" },
		org_underline = { underline = true },
		org_bold = { bold = true },
		org_italic = { italic = true },
		org_strikethrough = { strikethrough = true },
		OrgCalendarToday = { fg = c.fg1, bg = c.light_cyan },
		OrgDONE_builtin = { fg = c.gray, bg = c.bg1 },
		OrgTODO_builtin = { fg = c.fg1, bg = c.light_cyan },
	}
	return hi_groups
end

groups.get_clear_groups = function()
	local palette = require("color9.palette")
	local colors = get_base_colors(palette)
	set_terminal_colors(colors)

	-- Clear all defaults
	local reset_groups = {
		Comment = { fg = nil, bg = nil },
		Constant = { fg = nil, bg = nil },
		Special = { fg = nil, bg = nil },
		Identifier = { fg = nil, bg = nil },
		Statement = { fg = nil, bg = nil },
		PreProc = { fg = nil, bg = nil },
		Type = { fg = nil, bg = nil },
		Underlined = { fg = nil, bg = nil },
		Ignore = { fg = nil, bg = nil },
		Error = { fg = nil, bg = nil },
		Todo = { fg = nil, bg = nil },
		NonText = { fg = nil, bg = nil },
		Directory = { fg = nil, bg = nil },
		ErrorMsg = { fg = nil, bg = nil },
		IncSearch = { fg = nil, bg = nil },
		Search = { fg = nil, bg = nil },
		MoreMsg = { fg = nil, bg = nil },
		ModeMsg = { fg = nil, bg = nil },
		LineNr = { fg = nil, bg = nil },
		CursorLineN = { fg = nil, bg = nil },
		Question = { fg = nil, bg = nil },
		StatusLine = { fg = nil, bg = nil },
		StatusLineN = { fg = nil, bg = nil },
		VertSplit = { fg = nil, bg = nil },
		Title = { fg = nil, bg = nil },
		Visual = { fg = nil, bg = nil },
		VisualNOS = { fg = nil, bg = nil },
		WarningMsg = { fg = nil, bg = nil },
		WildMenu = { fg = nil, bg = nil },
		Folded = { fg = nil, bg = nil },
		FoldColumn = { fg = nil, bg = nil },
		DiffAdd = { fg = nil, bg = nil },
		DiffChange = { fg = nil, bg = nil },
		DiffDelete = { fg = nil, bg = nil },
		DiffText = { fg = nil, bg = nil },
		SignColumn = { fg = nil, bg = nil },
		Conceal = { fg = nil, bg = nil },
		SpellBad = { fg = nil, bg = nil },
		SpellCap = { fg = nil, bg = nil },
		SpellRare = { fg = nil, bg = nil },
		SpellLocal = { fg = nil, bg = nil },
		Pmenu = { fg = nil, bg = nil },
		PmenuSel = { fg = nil, bg = nil },
		PmenuSbar = { fg = nil, bg = nil },
		PmenuThumb = { fg = nil, bg = nil },
		TabLine = { fg = nil, bg = nil },
		TabLineSel = { fg = nil, bg = nil },
		TabLineFill = { fg = nil, bg = nil },
		CursorColum = { fg = nil, bg = nil },
		CursorLine = { fg = nil, bg = nil },
		ColorColumn = { fg = nil, bg = nil },
		MatchParen = { fg = nil, bg = nil },
	}
	return reset_groups
end

return groups
