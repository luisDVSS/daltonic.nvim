--- mason.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("MasonNormal", { fg = p.fg, bg = p.bg_float })
  hl("MasonHeader", { fg = p.bg, bg = p.blue, bold = true })
  hl("MasonHeaderSecondary", { fg = p.bg, bg = p.purple, bold = true })
  hl("MasonHighlight", { fg = p.blue })
  hl("MasonHighlightBlock", { fg = p.bg, bg = p.blue })
  hl("MasonHighlightBlockBold", { fg = p.bg, bg = p.blue, bold = true })
  hl("MasonHighlightSecondary", { fg = p.purple })
  hl("MasonLink", { fg = p.cyan, underline = true })
  hl("MasonMuted", { fg = p.fg_muted })
  hl("MasonMutedBlock", { fg = p.fg, bg = p.bg_alt })
  hl("MasonMutedBlockBold", { fg = p.fg, bg = p.bg_alt, bold = true })
  hl("MasonError", { fg = p.red })
  hl("MasonWarning", { fg = p.orange })
  hl("MasonHeading", { fg = p.green, bold = true })
  hl("MasonDeprecated", { fg = p.fg_muted, strikethrough = true })
end

return M
