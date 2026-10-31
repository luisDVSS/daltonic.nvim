--- mini.nvim (statusline, tabline, icons, files, indentscope, cursorword, diff, pick, notify)
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  -- ── mini.statusline ───────────────────────────────────────────────────
  local modes = {
    Normal = p.blue,
    Insert = p.green,
    Visual = p.purple,
    Replace = p.red,
    Command = p.yellow,
    Terminal = p.cyan,
  }

  for mode, color in pairs(modes) do
    hl("MiniStatuslineMode" .. mode, { fg = p.bg, bg = color, bold = true })
  end

  hl("MiniStatuslineModeOther", { fg = p.bg, bg = p.orange, bold = true })
  hl("MiniStatuslineDevinfo", { fg = p.fg_muted, bg = p.statusline_bg })
  hl("MiniStatuslineFileinfo", { fg = p.fg_muted, bg = p.statusline_bg })
  hl("MiniStatuslineFilename", { fg = p.fg, bg = p.statusline_bg })
  hl("MiniStatuslineInactive", { fg = p.fg_muted, bg = p.bg_alt })

  -- ── mini.tabline ──────────────────────────────────────────────────────
  hl("MiniTablineCurrent", { fg = p.fg, bg = p.bg, bold = true })
  hl("MiniTablineVisible", { fg = p.fg, bg = p.bg_alt })
  hl("MiniTablineHidden", { fg = p.fg_muted, bg = p.bg_alt })
  hl("MiniTablineModifiedCurrent", { fg = p.orange, bg = p.bg, bold = true })
  hl("MiniTablineModifiedVisible", { fg = p.orange, bg = p.bg_alt })
  hl("MiniTablineModifiedHidden", { fg = p.orange, bg = p.bg_alt })
  hl("MiniTablineFill", { bg = p.bg_alt })
  hl("MiniTablineTabpagesection", { fg = p.bg, bg = p.blue, bold = true })

  -- ── mini.icons ────────────────────────────────────────────────────────
  local icons = {
    Azure = p.cyan,
    Blue = p.blue,
    Cyan = p.cyan,
    Green = p.green,
    Grey = p.fg_muted,
    Orange = p.orange,
    Purple = p.purple,
    Red = p.red,
    Yellow = p.yellow,
  }

  for name, color in pairs(icons) do
    hl("MiniIcons" .. name, { fg = color })
  end

  -- ── mini.files ────────────────────────────────────────────────────────
  hl("MiniFilesBorder", { fg = p.border, bg = p.bg_float })
  hl("MiniFilesBorderModified", { fg = p.orange, bg = p.bg_float })
  hl("MiniFilesCursorLine", { bg = p.cursorline })
  hl("MiniFilesDirectory", { fg = p.blue })
  hl("MiniFilesFile", { fg = p.fg })
  hl("MiniFilesNormal", { fg = p.fg, bg = p.bg_float })
  hl("MiniFilesTitle", { fg = p.fg, bg = p.bg_float, bold = true })
  hl("MiniFilesTitleFocused", { fg = p.bg, bg = p.blue, bold = true })

  -- ── mini.indentscope ─────────────────────────────────────────────────
  hl("MiniIndentscopeSymbol", { fg = p.border })
  hl("MiniIndentscopeSymbolOff", { fg = p.orange })

  -- ── mini.cursorword ──────────────────────────────────────────────────
  hl("MiniCursorword", { bg = b:blend(p.blue, 0.15) })
  hl("MiniCursorwordCurrent", { bg = b:blend(p.blue, 0.15) })

  -- ── mini.diff ────────────────────────────────────────────────────────
  hl("MiniDiffSignAdd", { fg = p.green })
  hl("MiniDiffSignChange", { fg = p.orange })
  hl("MiniDiffSignDelete", { fg = p.red })
  hl("MiniDiffOverAdd", { bg = p.diff_add })
  hl("MiniDiffOverChange", { bg = p.diff_change })
  hl("MiniDiffOverDelete", { bg = p.diff_del })
  hl("MiniDiffOverContext", { bg = p.bg_alt })

  -- ── mini.pick ────────────────────────────────────────────────────────
  hl("MiniPickNormal", { fg = p.fg, bg = p.bg_float })
  hl("MiniPickBorder", { fg = p.border, bg = p.bg_float })
  hl("MiniPickBorderBusy", { fg = p.orange, bg = p.bg_float })
  hl("MiniPickIconDir", { fg = p.blue })
  hl("MiniPickIconFile", { fg = p.fg_muted })
  hl("MiniPickMatchCurrent", { bg = p.cursorline })
  hl("MiniPickMatchMarked", { bg = b:blend(p.orange, 0.18) })
  hl("MiniPickMatchRanges", { fg = p.green, bold = true })
  hl("MiniPickPreviewLine", { bg = p.cursorline })
  hl("MiniPickPreviewRegion", { bg = b:blend(p.blue, 0.18) })
  hl("MiniPickPrompt", { fg = p.blue, bg = p.bg_float })

  -- ── mini.notify ──────────────────────────────────────────────────────
  hl("MiniNotifyNormal", { fg = p.fg, bg = p.bg_float })
  hl("MiniNotifyBorder", { fg = p.border, bg = p.bg_float })
  hl("MiniNotifyTitle", { fg = p.fg, bg = p.bg_float, bold = true })
  hl("MiniNotifyLspProgress", { fg = p.fg_muted })
  hl("MiniNotifyError", { fg = p.red })
  hl("MiniNotifyWarn", { fg = p.orange })
  hl("MiniNotifyInfo", { fg = p.cyan })
  hl("MiniNotifyDebug", { fg = p.purple })

  -- ── mini.hipatterns ──────────────────────────────────────────────────
  hl("MiniHipatternsFixme", { fg = p.bg, bg = p.red, bold = true })
  hl("MiniHipatternsHack", { fg = p.bg, bg = p.orange, bold = true })
  hl("MiniHipatternsTodo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("MiniHipatternsNote", { fg = p.bg, bg = p.cyan, bold = true })
end

return M
