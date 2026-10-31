--- neo-tree.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("NeoTreeNormal", { fg = p.fg, bg = p.bg_alt })
  hl("NeoTreeNormalNC", { fg = p.fg, bg = p.bg_alt })
  hl("NeoTreeDimText", { fg = p.fg_muted })
  hl("NeoTreeTitleBar", { fg = p.bg, bg = p.blue, bold = true })
  hl("NeoTreeRootName", { fg = p.purple, bold = true })

  hl("NeoTreeDirectoryName", { fg = p.blue })
  hl("NeoTreeDirectoryIcon", { fg = p.blue })
  hl("NeoTreeFileIcon", { fg = p.fg_muted })
  hl("NeoTreeFileName", { fg = p.fg })
  hl("NeoTreeFileNameOpened", { fg = p.green, bold = true })
  hl("NeoTreeSymbolicLinkTarget", { fg = p.cyan })
  hl("NeoTreeIndentMarker", { fg = p.border })
  hl("NeoTreeExpander", { fg = p.fg_muted })
  hl("NeoTreeMessage", { fg = p.fg_muted, italic = true })
  hl("NeoTreeModified", { fg = p.orange })
  hl("NeoTreeCursorLine", { bg = p.cursorline })
  hl("NeoTreeWinSeparator", { fg = p.border, bg = p.bg_alt })

  local git = {
    Added = p.green,
    Modified = p.orange,
    Deleted = p.red,
    Renamed = p.purple,
    Staged = p.green,
    Unstaged = p.orange,
    Untracked = p.cyan,
    Ignored = p.fg_muted,
  }

  for status, color in pairs(git) do
    hl("NeoTreeGit" .. status, { fg = color })
  end

  hl("NeoTreeGitConflict", { fg = p.red, bold = true })

  -- ── Selección, flotantes, pestañas y estados ─────────────────────────
  hl("NeoTreeSelected", { fg = p.fg, bg = b:blend(p.blue, 0.2), bold = true })
  hl("NeoTreePreview", { bg = b:blend(p.blue, 0.12) })

  hl("NeoTreeFloatNormal", { fg = p.fg, bg = p.bg_float })
  hl("NeoTreeFloatBorder", { fg = p.border, bg = p.bg_float })
  hl("NeoTreeFloatTitle", { fg = p.fg, bg = p.bg_float, bold = true })

  hl("NeoTreeStatusLine", { fg = p.statusline_fg, bg = p.statusline_bg })
  hl("NeoTreeStatusLineNC", { fg = p.fg_muted, bg = p.statusline_bg })

  hl("NeoTreeTabActive", { fg = p.fg, bg = p.bg, bold = true })
  hl("NeoTreeTabInactive", { fg = p.fg_muted, bg = p.bg_alt })
  hl("NeoTreeTabSeparatorActive", { fg = p.border, bg = p.bg })
  hl("NeoTreeTabSeparatorInactive", { fg = p.border, bg = p.bg_alt })

  hl("NeoTreeBufferNumber", { fg = p.linenr })
  hl("NeoTreeSignColumn", { fg = p.fg_muted, bg = p.bg_alt })
  hl("NeoTreeVertSplit", { fg = p.border, bg = p.bg_alt })
  hl("NeoTreeEndOfBuffer", { fg = p.bg_alt })

  hl("NeoTreeDotfile", { fg = b:blend(p.fg_muted, 0.7) })
  hl("NeoTreeHiddenByName", { fg = b:blend(p.fg_muted, 0.7) })
  hl("NeoTreeIgnored", { fg = b:blend(p.fg_muted, 0.7) })
  hl("NeoTreeWindowsHidden", { fg = b:blend(p.fg_muted, 0.7) })
  hl("NeoTreeFadeText1", { fg = b:blend(p.fg_muted, 0.55) })
  hl("NeoTreeFadeText2", { fg = b:blend(p.fg_muted, 0.35) })

  hl("NeoTreeFilterTerm", { fg = p.yellow, bold = true })
  hl("NeoTreeFileStats", { fg = p.fg_muted })
  hl("NeoTreeFileStatsHeader", { fg = p.fg_muted, bold = true })
end

return M
