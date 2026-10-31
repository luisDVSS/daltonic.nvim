--- noice.nvim (cmdline, mensajes, LSP progress y confirmaciones)
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local selection = b:blend(p.blue, 0.22)

  -- ── Cmdline clásica ───────────────────────────────────────────────────
  hl("NoiceCmdline", { fg = p.fg, bg = p.bg })
  hl("NoiceCmdlineIcon", { fg = p.cyan })
  hl("NoiceCmdlineIconSearch", { fg = p.yellow })
  hl("NoiceCmdlinePrompt", { fg = p.purple, bold = true })
  hl("NoiceCmdlinePopup", { fg = p.fg, bg = p.bg_float })
  hl("NoiceCmdlinePopupBorder", { fg = p.cyan, bg = p.bg_float })
  hl("NoiceCmdlinePopupBorderSearch", { fg = p.yellow, bg = p.bg_float })
  hl("NoiceCmdlinePopupTitle", { fg = p.cyan, bold = true })

  -- ── Ventanas flotantes ────────────────────────────────────────────────
  hl("NoicePopup", { fg = p.fg, bg = p.bg_float })
  hl("NoicePopupBorder", { fg = p.border, bg = p.bg_float })
  hl("NoiceSplit", { fg = p.fg, bg = p.bg_float })
  hl("NoiceSplitBorder", { fg = p.border, bg = p.bg_float })
  hl("NoiceConfirm", { fg = p.fg, bg = p.bg_float })
  hl("NoiceConfirmBorder", { fg = p.cyan, bg = p.bg_float })
  hl("NoiceMini", { fg = p.fg, bg = p.bg })
  hl("NoiceVirtualText", { fg = p.fg_muted })
  hl("NoiceCursor", { link = "Cursor" })

  -- ── Popupmenu de comandos ─────────────────────────────────────────────
  hl("NoicePopupmenu", { fg = p.fg, bg = p.bg_float })
  hl("NoicePopupmenuBorder", { fg = p.border, bg = p.bg_float })
  hl("NoicePopupmenuMatch", { fg = p.blue, bold = true })
  hl("NoicePopupmenuSelected", { fg = p.fg, bg = selection, bold = true })

  hl("NoiceScrollbar", { bg = p.bg_alt })
  hl("NoiceScrollbarThumb", { bg = p.border })

  -- ── Progreso LSP ──────────────────────────────────────────────────────
  hl("NoiceLspProgressSpinner", { fg = p.cyan })
  hl("NoiceLspProgressTitle", { fg = p.fg_muted })
  hl("NoiceLspProgressClient", { fg = p.blue, bold = true })

  -- ── Formato de mensajes ───────────────────────────────────────────────
  hl("NoiceFormatProgressDone", { fg = p.bg, bg = p.green })
  hl("NoiceFormatProgressTodo", { bg = p.selection })
  hl("NoiceFormatEvent", { fg = p.purple })
  hl("NoiceFormatKind", { fg = p.cyan })
  hl("NoiceFormatDate", { fg = p.orange })
  hl("NoiceFormatConfirm", { bg = p.selection })
  hl("NoiceFormatConfirmDefault", { bg = selection, bold = true })
  hl("NoiceFormatTitle", { fg = p.purple, bold = true })
  hl("NoiceFormatLevelDebug", { fg = p.purple })
  hl("NoiceFormatLevelTrace", { fg = p.fg_muted })
  hl("NoiceFormatLevelOff", { fg = p.fg_muted })
  hl("NoiceFormatLevelInfo", { fg = p.cyan })
  hl("NoiceFormatLevelWarn", { fg = p.orange })
  hl("NoiceFormatLevelError", { fg = p.red })

  -- ── Completado del cmdline ────────────────────────────────────────────
  local kinds = {
    Default = p.pink,
    Text = p.fg,
    Method = p.blue,
    ["Function"] = p.blue,
    Constructor = p.cyan,
    Field = p.pink,
    Variable = p.fg,
    Class = p.cyan,
    Interface = p.cyan,
    Module = p.cyan,
    Unit = p.orange,
    Value = p.orange,
    Enum = p.orange,
    Keyword = p.purple,
    Snippet = p.yellow,
    Color = p.pink,
    File = p.blue,
    Folder = p.blue,
    EnumMember = p.orange,
    Constant = p.orange,
    Struct = p.cyan,
    Property = p.pink,
  }

  for kind, color in pairs(kinds) do
    hl("NoiceCompletionItemKind" .. kind, { fg = color })
  end

  hl("NoiceCompletionItemMenu", { fg = p.fg_muted })
  hl("NoiceCompletionItemWord", { fg = p.fg })
end

return M
