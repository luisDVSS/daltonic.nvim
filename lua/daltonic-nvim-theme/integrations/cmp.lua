--- nvim-cmp y blink.cmp
local M = {}

local function kinds(p)
  return {
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
    Reference = p.cyan,
    Folder = p.blue,
    EnumMember = p.orange,
    Constant = p.orange,
    Struct = p.cyan,
    Event = p.orange,
    Operator = p.fg,
    TypeParameter = p.cyan,
    Property = p.pink,
  }
end

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  local selection = b:blend(p.blue, 0.22)
  local kind_colors = kinds(p)

  -- ── nvim-cmp ──────────────────────────────────────────────────────────
  for kind, color in pairs(kind_colors) do
    hl("CmpItemKind" .. kind, { fg = color })
    hl("CmpItemKind" .. kind .. "Icon", { fg = color })
  end

  hl("CmpItemKindIcon", { fg = p.pink })

  hl("CmpItemAbbr", { fg = p.fg })
  hl("CmpItemAbbrDeprecated", { fg = p.fg_muted, strikethrough = true })
  hl("CmpItemAbbrMatch", { fg = p.blue, bold = true })
  hl("CmpItemAbbrMatchFuzzy", { fg = p.blue, bold = true })
  hl("CmpItemMenu", { fg = p.fg_muted })
  hl("CmpItemKindDefault", { fg = p.fg_muted })
  hl("CmpItemKind", { fg = p.pink })
  hl("CmpGhostText", { fg = p.fg_muted, italic = true })
  hl("CmpDocumentation", { fg = p.fg, bg = p.bg_float })
  hl("CmpDocumentationBorder", { fg = p.border, bg = p.bg_float })

  -- ── blink.cmp ─────────────────────────────────────────────────────────
  hl("BlinkCmpMenu", { fg = p.fg, bg = p.bg_float })
  hl("BlinkCmpMenuBorder", { fg = p.border, bg = p.bg_float })
  hl("BlinkCmpMenuSelection", { bg = selection, bold = true })
  hl("BlinkCmpScrollBarThumb", { bg = p.border })
  hl("BlinkCmpScrollBarGutter", { bg = p.bg_alt })

  hl("BlinkCmpLabel", { fg = p.fg })
  hl("BlinkCmpLabelDeprecated", { fg = p.fg_muted, strikethrough = true })
  hl("BlinkCmpLabelMatch", { fg = p.blue, bold = true })
  hl("BlinkCmpLabelDetail", { fg = p.fg_muted })
  hl("BlinkCmpLabelDescription", { fg = p.fg_muted })
  hl("BlinkCmpSource", { fg = p.fg_muted })
  hl("BlinkCmpGhostText", { fg = p.fg_muted, italic = true })

  hl("BlinkCmpDoc", { fg = p.fg, bg = p.bg_float })
  hl("BlinkCmpDocBorder", { fg = p.border, bg = p.bg_float })
  hl("BlinkCmpDocSeparator", { fg = p.border })
  hl("BlinkCmpSignatureHelp", { fg = p.fg, bg = p.bg_float })
  hl("BlinkCmpSignatureHelpBorder", { fg = p.border, bg = p.bg_float })
  hl("BlinkCmpSignatureHelpActiveParameter", { fg = p.orange, bold = true })

  for kind, color in pairs(kind_colors) do
    hl("BlinkCmpKind" .. kind, { fg = color })
  end
  hl("BlinkCmpKind", { fg = p.pink })
end

return M
