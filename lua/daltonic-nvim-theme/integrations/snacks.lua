--- snacks.nvim (picker, notifier, dashboard, indent, explorer, terminal)
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local selection = b:blend(p.blue, 0.2)

  -- ── Picker ────────────────────────────────────────────────────────────
  hl("SnacksPicker", { fg = p.fg, bg = p.bg_float })
  hl("SnacksPickerBorder", { fg = p.border, bg = p.bg_float })
  hl("SnacksPickerTitle", { fg = p.bg, bg = p.purple, bold = true })
  hl("SnacksPickerBoxBorder", { fg = p.border, bg = p.bg_float })
  hl("SnacksPickerInputBorder", { fg = p.border, bg = p.bg_float })
  hl("SnacksPickerInputSearch", { fg = p.blue, bg = p.bg_float })
  hl("SnacksPickerList", { fg = p.fg, bg = p.bg_float })
  hl("SnacksPickerListCursorLine", { bg = selection })
  hl("SnacksPickerListBorder", { fg = p.border, bg = p.bg_float })
  hl("SnacksPickerMatch", { fg = p.green, bold = true })
  hl("SnacksPickerDir", { fg = p.fg_muted })
  hl("SnacksPickerFile", { fg = p.fg })
  hl("SnacksPickerIcon", { fg = p.blue })
  hl("SnacksPickerComment", { fg = p.fg_muted })
  hl("SnacksPickerLabel", { fg = p.purple })
  hl("SnacksPickerPrompt", { fg = p.blue, bg = p.bg_float })
  hl("SnacksPickerSearch", { fg = p.orange, bg = p.bg_float })
  hl("SnacksPickerSpecial", { fg = p.pink })
  hl("SnacksPickerTotals", { fg = p.fg_muted })
  hl("SnacksPickerTree", { fg = p.border })
  hl("SnacksPickerVirtual", { fg = p.fg_muted, italic = true })
  hl("SnacksPickerPreview", { fg = p.fg, bg = p.bg_float })
  hl("SnacksPickerPreviewBorder", { fg = p.border, bg = p.bg_float })
  hl("SnacksPickerPreviewCursorLine", { bg = p.cursorline })
  hl("SnacksPickerPreviewMatch", { fg = p.green })

  local git = {
    Added = p.green,
    Modified = p.orange,
    Deleted = p.red,
    Renamed = p.purple,
    Copied = p.cyan,
    Untracked = p.fg_muted,
    Ignored = p.fg_muted,
    Updated = p.blue,
  }

  for status, color in pairs(git) do
    hl("SnacksPickerGitStatus" .. status, { fg = color })
  end

  -- ── Notifier ──────────────────────────────────────────────────────────
  local levels = {
    ERROR = p.red,
    WARN = p.orange,
    INFO = p.cyan,
    DEBUG = p.purple,
    TRACE = p.fg_muted,
  }

  hl("SnacksNotifier", { fg = p.fg, bg = p.bg_float })
  hl("SnacksNotifierBorder", { fg = p.border, bg = p.bg_float })
  hl("SnacksNotifierFooter", { fg = p.fg_muted })
  hl("SnacksNotifierTitle", { fg = p.fg, bold = true })

  for level, color in pairs(levels) do
    hl("SnacksNotifier" .. level, { fg = color })
    hl("SnacksNotifierIcon" .. level, { fg = color })
    hl("SnacksNotifierTitle" .. level, { fg = color, bold = true })
    hl("SnacksNotifierBorder" .. level, { fg = p.border, bg = p.bg_float })
    hl("SnacksNotifierFooter" .. level, { fg = p.fg_muted })
  end

  -- ── Dashboard ─────────────────────────────────────────────────────────
  hl("SnacksDashboardNormal", { fg = p.fg, bg = p.bg })
  hl("SnacksDashboardHeader", { fg = p.blue, bold = true })
  hl("SnacksDashboardIcon", { fg = p.purple })
  hl("SnacksDashboardKey", { fg = p.orange })
  hl("SnacksDashboardDesc", { fg = p.fg })
  hl("SnacksDashboardDir", { fg = p.fg_muted })
  hl("SnacksDashboardFile", { fg = p.green })
  hl("SnacksDashboardFooter", { fg = p.fg_muted, italic = true })
  hl("SnacksDashboardTitle", { fg = p.blue, bold = true })
  hl("SnacksDashboardSpecial", { fg = p.pink })
  hl("SnacksDashboardTerminal", { fg = p.fg, bg = p.bg })

  -- ── Indent / explorer / terminal ──────────────────────────────────────
  hl("SnacksIndent", { fg = b:blend(p.border, 0.5) })
  hl("SnacksIndentScope", { fg = p.border })
  hl("SnacksIndentChunk", { fg = p.border })
  hl("SnacksIndentBlank", { fg = b:blend(p.border, 0.3) })
  hl("SnacksExplorerDir", { fg = p.blue })
  hl("SnacksExplorerFile", { fg = p.fg })
  hl("SnacksExplorerIcon", { fg = p.cyan })
  hl("SnacksExplorerWin", { fg = p.fg, bg = p.bg_alt })
  hl("SnacksTerminal", { fg = p.fg, bg = p.bg })
  hl("SnacksWinBar", { fg = p.fg_muted, bg = p.bg })
end

return M
