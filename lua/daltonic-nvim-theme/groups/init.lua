--- Grupos base del editor y sintaxis clásica.
local M = {}

function M.setup(b)
  local p, o = b.p, b.o
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local comment = { fg = p.fg_muted }
  if o.styles.comments.italic then
    comment.italic = true
  end

  local keyword = { fg = p.purple }
  if o.styles.keywords.italic then
    keyword.italic = true
  end

  local func = { fg = p.blue }
  if o.styles.functions.bold then
    func.bold = true
  end

  local type_ = { fg = p.cyan }
  for key, value in pairs(o.styles.types or {}) do
    type_[key] = value
  end

  local inactive_bg = b:mix(p.bg, p.bg_alt, 0.65)
  local pmenu_selection = b:blend(p.blue, 0.22)

  -- ── Editor ────────────────────────────────────────────────────────────
  hl("Normal", { fg = p.fg, bg = p.bg })
  if o.dim_inactive then
    hl("NormalNC", { fg = b:mix(p.fg_muted, p.fg, 0.35), bg = inactive_bg })
  else
    hl("NormalNC", { link = "Normal" })
  end
  hl("NormalFloat", { fg = p.fg, bg = p.bg_float })
  hl("FloatBorder", { fg = p.border, bg = p.bg_float })
  hl("FloatTitle", { fg = p.fg, bg = p.bg_float, bold = true })
  hl("FloatFooter", { fg = p.fg_muted, bg = p.bg_float })

  hl("Cursor", { fg = p.bg, bg = p.cursor })
  hl("lCursor", { link = "Cursor" })
  hl("CursorIM", { link = "Cursor" })
  hl("TermCursor", { link = "Cursor" })
  hl("TermCursorNC", { fg = p.bg, bg = p.fg_muted })

  hl("CursorLine", { bg = p.cursorline })
  hl("CursorColumn", { bg = p.cursorline })
  hl("ColorColumn", { bg = p.cursorline })
  hl("CursorLineSign", { bg = p.cursorline })
  hl("CursorLineFold", { bg = p.cursorline })

  hl("LineNr", { fg = p.linenr, bg = p.bg })
  hl("LineNrAbove", { fg = p.linenr, bg = p.bg })
  hl("LineNrBelow", { fg = p.linenr, bg = p.bg })
  hl("CursorLineNr", { fg = p.linenr_active, bg = p.cursorline, bold = true })
  hl("SignColumn", { fg = p.fg_muted, bg = p.bg })
  hl("FoldColumn", { fg = p.linenr, bg = p.bg })
  hl("Folded", { fg = p.fg_muted, bg = p.bg_alt })

  hl("WinSeparator", { fg = p.border, bg = p.bg })
  hl("VertSplit", { link = "WinSeparator" })
  hl("WinBar", { fg = p.fg_muted, bg = p.bg })
  hl("WinBarNC", { fg = b:blend(p.fg_muted, 0.7), bg = p.bg })

  -- ── Barras y menús ────────────────────────────────────────────────────
  hl("StatusLine", { fg = p.statusline_fg, bg = p.statusline_bg })
  hl("StatusLineNC", { fg = p.fg_muted, bg = p.statusline_bg })
  hl("StatusLineTerm", { link = "StatusLine" })
  hl("StatusLineTermNC", { link = "StatusLineNC" })

  hl("TabLine", { fg = p.fg_muted, bg = p.bg_alt })
  hl("TabLineFill", { bg = p.bg_alt })
  hl("TabLineSel", { fg = p.fg, bg = p.bg_float, bold = true })

  hl("Pmenu", { fg = p.fg, bg = p.bg_float })
  hl("PmenuSel", { fg = p.fg, bg = pmenu_selection, bold = true })
  hl("PmenuKind", { fg = p.cyan, bg = p.bg_float })
  hl("PmenuKindSel", { fg = p.cyan, bg = pmenu_selection })
  hl("PmenuExtra", { fg = p.fg_muted, bg = p.bg_float })
  hl("PmenuExtraSel", { fg = p.fg_muted, bg = pmenu_selection })
  hl("PmenuMatch", { fg = p.blue, bg = p.bg_float, bold = true })
  hl("PmenuMatchSel", { fg = p.fg, bg = pmenu_selection, bold = true, underline = true })
  hl("PmenuSbar", { bg = p.bg_alt })
  hl("PmenuThumb", { bg = p.border })
  hl("WildMenu", { link = "PmenuSel" })

  hl("Visual", { bg = p.selection })
  hl("VisualNOS", { bg = p.selection })
  hl("Search", { fg = p.search_fg, bg = p.search_bg })
  hl("CurSearch", { fg = p.bg, bg = p.yellow, bold = true })
  hl("IncSearch", { fg = p.bg, bg = p.orange, bold = true })
  hl("Substitute", { fg = p.bg, bg = p.red, bold = true })
  hl("MatchParen", { fg = p.cyan, bg = b:blend(p.cyan, 0.15), bold = true })
  hl("QuickFixLine", { bg = p.selection, bold = true })

  -- ── Mensajes ──────────────────────────────────────────────────────────
  hl("ErrorMsg", { fg = p.red, bold = true })
  hl("WarningMsg", { fg = p.orange })
  hl("MoreMsg", { fg = p.green })
  hl("ModeMsg", { fg = p.fg, bold = true })
  hl("Question", { fg = p.green })
  hl("MsgArea", { fg = p.fg, bg = p.bg })
  hl("MsgSeparator", { fg = p.border, bg = p.bg })
  hl("Title", { fg = p.purple, bold = true })
  hl("Directory", { fg = p.blue, bold = true })

  -- ── Caracteres invisibles ─────────────────────────────────────────────
  hl("NonText", { fg = b:blend(p.border, 0.7) })
  hl("SpecialKey", { fg = b:blend(p.border, 0.85) })
  hl("Whitespace", { fg = b:blend(p.border, 0.4) })
  hl("EndOfBuffer", { fg = p.bg })
  hl("Conceal", { fg = p.fg_muted })
  hl("Ignore", { fg = p.fg_muted })
  hl("Underlined", { fg = p.blue, underline = true })
  hl("Error", { fg = p.red })
  hl("Todo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("Debug", { fg = p.orange })

  hl("SpellBad", { sp = p.red, undercurl = true })
  hl("SpellCap", { sp = p.orange, undercurl = true })
  hl("SpellLocal", { sp = p.cyan, undercurl = true })
  hl("SpellRare", { sp = p.purple, undercurl = true })

  -- ── Diffs ─────────────────────────────────────────────────────────────
  hl("DiffAdd", { bg = p.diff_add })
  hl("DiffChange", { bg = p.diff_change })
  hl("DiffDelete", { fg = p.red, bg = p.diff_del })
  hl("DiffText", { bg = b:blend(p.green, 0.3) })
  hl("Added", { fg = p.green })
  hl("Changed", { fg = p.orange })
  hl("Removed", { fg = p.red })

  hl("diffAdded", { link = "Added" })
  hl("diffRemoved", { link = "Removed" })
  hl("diffChanged", { link = "Changed" })
  hl("diffFile", { fg = p.blue })
  hl("diffNewFile", { fg = p.green })
  hl("diffOldFile", { fg = p.red })
  hl("diffLine", { fg = p.fg_muted })
  hl("diffIndexLine", { fg = p.purple })

  -- ── Sintaxis clásica ──────────────────────────────────────────────────
  hl("Comment", comment)
  hl("Constant", { fg = p.orange })
  hl("String", { fg = p.yellow })
  hl("Character", { fg = p.yellow })
  hl("Number", { fg = p.orange })
  hl("Boolean", { fg = p.orange })
  hl("Float", { fg = p.orange })
  hl("Identifier", { fg = p.fg })
  hl("Function", func)
  hl("Statement", keyword)
  hl("Conditional", keyword)
  hl("Repeat", keyword)
  hl("Label", keyword)
  hl("Operator", { fg = p.fg })
  hl("Keyword", keyword)
  hl("Exception", keyword)
  hl("PreProc", keyword)
  hl("Include", { fg = p.purple })
  hl("Define", { fg = p.purple })
  hl("Macro", { fg = p.pink })
  hl("PreCondit", { fg = p.purple })
  hl("Type", type_)
  hl("StorageClass", type_)
  hl("Structure", type_)
  hl("Typedef", type_)
  hl("Special", { fg = p.pink })
  hl("SpecialChar", { fg = p.pink })
  hl("Tag", { fg = p.pink })
  hl("Delimiter", { fg = p.fg })
  hl("SpecialComment", { fg = p.fg_muted, bold = true })

  -- ── Quickfix / help / salud ───────────────────────────────────────────
  hl("qfFileName", { fg = p.blue })
  hl("qfLineNr", { fg = p.fg_muted })
  hl("helpHyperTextEntry", { fg = p.green, bold = true })
  hl("helpHyperTextJump", { fg = p.blue, underline = true })
  hl("helpCommand", { fg = p.orange })
  hl("helpExample", { fg = p.fg_muted })
  hl("helpSpecial", { fg = p.purple })
  hl("helpNote", { fg = p.pink })
  hl("HealthError", { fg = p.red })
  hl("HealthWarning", { fg = p.orange })
  hl("HealthSuccess", { fg = p.green })
end

return M
