--- alpha-nvim (dashboard)
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("AlphaHeader", { fg = p.blue, bold = true })
  hl("AlphaHeaderLabel", { fg = p.purple })
  hl("AlphaHeaderVersion", { fg = p.fg_muted })
  hl("AlphaButtons", { fg = p.fg })
  hl("AlphaShortcut", { fg = p.orange, bold = true })
  hl("AlphaFooter", { fg = p.fg_muted, italic = true })
end

return M
