--- indent-blankline (ibl) y su versión antigua.
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("IblIndent", { fg = b:blend(p.border, 0.45) })
  hl("IblWhitespace", { fg = b:blend(p.border, 0.3) })
  hl("IblScope", { fg = b:blend(p.blue, 0.55) })

  b:link("IndentBlanklineChar", "IblIndent")
  b:link("IndentBlanklineSpaceChar", "IblWhitespace")
  b:link("IndentBlanklineContextChar", "IblScope")
  b:link("IndentBlanklineContextStart", "IblScope")
end

return M
