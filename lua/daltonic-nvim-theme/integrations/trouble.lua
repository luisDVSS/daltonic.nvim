--- trouble.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("TroubleNormal", { fg = p.fg, bg = p.bg })
  hl("TroubleNormalNC", { fg = p.fg, bg = p.bg })
  hl("TroubleTitle", { fg = p.fg, bg = p.bg, bold = true })
  hl("TroubleText", { fg = p.fg })
  hl("TroubleCount", { fg = p.purple, bg = p.bg_alt })
  hl("TroubleFile", { fg = p.blue })
  hl("TroubleIndent", { fg = p.border })
  hl("TroubleLocation", { fg = p.fg_muted })
  hl("TroubleSource", { fg = p.fg_muted, italic = true })
  hl("TroubleCode", { fg = p.fg_muted })
  hl("TroubleFoldIcon", { fg = p.fg_muted })
  hl("TroubleIconDirectory", { fg = p.blue })

  local kinds = {
    Error = p.red,
    Warning = p.orange,
    Warn = p.orange,
    Information = p.cyan,
    Info = p.cyan,
    Hint = p.blue,
    Note = p.purple,
  }

  for kind, color in pairs(kinds) do
    hl("TroubleText" .. kind, { fg = color })
  end
end

return M
