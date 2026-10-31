--- bufferline.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("BufferLineFill", { bg = p.bg_alt })
  hl("BufferLineBackground", { fg = p.fg_muted, bg = p.bg_alt })
  hl("BufferLineBuffer", { fg = p.fg_muted, bg = p.bg_alt })
  hl("BufferLineBufferVisible", { fg = p.fg, bg = p.bg_alt })
  hl("BufferLineBufferSelected", { fg = p.fg, bg = p.bg, bold = true })

  hl("BufferLineCloseButton", { fg = p.fg_muted, bg = p.bg_alt })
  hl("BufferLineCloseButtonVisible", { fg = p.fg_muted, bg = p.bg_alt })
  hl("BufferLineCloseButtonSelected", { fg = p.red, bg = p.bg })

  hl("BufferLineModified", { fg = p.orange, bg = p.bg_alt })
  hl("BufferLineModifiedVisible", { fg = p.orange, bg = p.bg_alt })
  hl("BufferLineModifiedSelected", { fg = p.orange, bg = p.bg })

  hl("BufferLineSeparator", { fg = p.border, bg = p.bg_alt })
  hl("BufferLineSeparatorVisible", { fg = p.border, bg = p.bg_alt })
  hl("BufferLineSeparatorSelected", { fg = p.border, bg = p.bg })
  hl("BufferLineOffsetSeparator", { fg = p.border, bg = p.bg_alt })

  hl("BufferLineIndicator", { fg = p.bg_alt })
  hl("BufferLineIndicatorVisible", { fg = p.bg_alt })
  hl("BufferLineIndicatorSelected", { fg = p.blue })

  hl("BufferLineDuplicate", { fg = p.fg_muted, bg = p.bg_alt, italic = true })
  hl("BufferLineDuplicateVisible", { fg = p.fg_muted, bg = p.bg_alt, italic = true })
  hl("BufferLineDuplicateSelected", { fg = p.fg_muted, bg = p.bg, italic = true })

  hl("BufferLineTab", { fg = p.fg_muted, bg = p.bg_alt })
  hl("BufferLineTabSelected", { fg = p.fg, bg = p.bg, bold = true })
  hl("BufferLineTabClose", { fg = p.red, bg = p.bg_alt })
  hl("BufferLineTabSeparator", { fg = p.border, bg = p.bg_alt })
  hl("BufferLineTabSeparatorSelected", { fg = p.border, bg = p.bg })

  hl("BufferLineNumbers", { fg = p.fg_muted, bg = p.bg_alt })
  hl("BufferLineNumbersVisible", { fg = p.fg, bg = p.bg_alt })
  hl("BufferLineNumbersSelected", { fg = p.fg, bg = p.bg, bold = true })

  hl("BufferLineTruncMarker", { fg = p.fg_muted, bg = p.bg_alt })
  hl("BufferLinePick", { fg = p.red, bold = true })
  hl("BufferLinePickVisible", { fg = p.red, bold = true })
  hl("BufferLinePickSelected", { fg = p.red, bold = true })

  hl("BufferLineGroupLabel", { fg = p.bg, bg = p.purple, bold = true })
  hl("BufferLineGroupSeparator", { fg = p.border, bg = p.bg_alt })

  local diagnostics = {
    Error = p.red,
    Warning = p.orange,
    Info = p.cyan,
    Hint = p.blue,
    Diagnostic = p.fg_muted,
  }

  for kind, color in pairs(diagnostics) do
    hl("BufferLine" .. kind, { fg = color, bg = p.bg_alt })
    hl("BufferLine" .. kind .. "Visible", { fg = color, bg = p.bg_alt })
    hl("BufferLine" .. kind .. "Selected", { fg = color, bg = p.bg, bold = true })
    hl("BufferLine" .. kind .. "Diagnostic", { fg = color, bg = p.bg_alt })
    hl("BufferLine" .. kind .. "DiagnosticVisible", { fg = color, bg = p.bg_alt })
    hl("BufferLine" .. kind .. "DiagnosticSelected", { fg = color, bg = p.bg, bold = true })
  end
end

return M
