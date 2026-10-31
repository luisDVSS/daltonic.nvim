--- which-key.nvim
local M = {}

function M.setup(b)
  local p = b.p
  local function hl(group, spec)
    b:hl(group, spec)
  end

  hl("WhichKey", { fg = p.blue })
  hl("WhichKeyGroup", { fg = p.purple })
  hl("WhichKeyDesc", { fg = p.fg })
  hl("WhichKeySeparator", { fg = p.fg_muted })
  hl("WhichKeyValue", { fg = p.fg_muted })
  hl("WhichKeyFloat", { bg = p.bg_float })
  hl("WhichKeyBorder", { fg = p.border, bg = p.bg_float })
  hl("WhichKeyTitle", { fg = p.fg, bg = p.bg_float, bold = true })
  hl("WhichKeyNormal", { fg = p.fg, bg = p.bg_float })
  hl("WhichKeyIcon", { fg = p.blue, bg = p.bg_float })

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
    hl("WhichKeyIcon" .. name, { fg = color })
  end
end

return M
